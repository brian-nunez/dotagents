// Renders a shields.io badge URL locally, for previews when img.shields.io is unreachable.
// Usage: echo '<shields url>' | node badge.mjs
// Static badges render exactly. Live badges (release, CI, versions) render their label with
// the message "live", because their real values are only known to shields.io.
import * as icons from 'simple-icons';
import { makeBadge } from 'badge-maker';

const hex = (c) => (/^[0-9a-f]{3,8}$/i.test(c) ? `#${c}` : c);
const dec = (s) =>
  decodeURIComponent(s)
    .replace(/__/g, '\u0001').replace(/_/g, ' ').replace(/\u0001/g, '_')
    .replace(/--/g, '\u0000').replace(/-/g, ' ').replace(/\u0000/g, '-');

const liveLabels = { 'github/v/release': 'release', 'github/go-mod/go-version': 'go', 'github/actions/workflow/status': 'build', 'github/license': 'license', 'npm/v': 'npm', 'crates/v': 'crates.io', 'pypi/v': 'pypi', discord: 'discord' };

let input = '';
process.stdin.on('data', (d) => { input += d; }).on('end', () => {
  const url = new URL(input.trim());
  const q = url.searchParams;
  let label = '';
  let message = 'live';
  let color = 'grey';

  if (url.pathname.startsWith('/badge/')) {
    const parts = url.pathname.slice(7).replace(/--/g, '\u0002').split('-').map((p) => p.replace(/\u0002/g, '--'));
    color = parts.pop();
    message = dec(parts.pop() ?? '');
    label = parts.length ? dec(parts.join('-')) : '';
  } else {
    const key = Object.keys(liveLabels).find((k) => url.pathname.includes(k));
    label = key ? liveLabels[key] : 'badge';
  }

  if (q.get('label')) label = q.get('label');
  if (q.get('color')) color = q.get('color');

  const opt = { label, message, color: hex(color), style: q.get('style') ?? 'flat' };
  const logo = q.get('logo');

  if (logo) {
    const name = `si${logo.replace(/(^|[-.])(\w)/g, (_, __, c) => c.toUpperCase())}`;
    const icon = icons[name];

    if (icon) {
      const fill = q.get('logoColor') ? hex(q.get('logoColor')) : `#${icon.hex}`;
      opt.logoBase64 = `data:image/svg+xml;base64,${Buffer.from(icon.svg.replace('<svg ', `<svg fill="${fill}" `)).toString('base64')}`;
    }
  }

  process.stdout.write(makeBadge(opt));
});
