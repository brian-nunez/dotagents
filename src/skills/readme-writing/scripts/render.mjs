// Renders a README to a standalone HTML page styled like GitHub.
// Usage: node render.mjs <README.md> <out.html> [light|dark]
// Dependencies: npm install in this scripts directory.
import { readFileSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { marked } from 'marked';
import markedAlert from 'marked-alert';

const here = dirname(fileURLToPath(import.meta.url));
const [, , src, out, theme = 'dark'] = process.argv;

const slug = (s) => s.toLowerCase().replace(/<[^>]+>/g, '').replace(/[^\w\- ]/g, '').trim().replace(/ /g, '-');

marked.use(markedAlert());
marked.use({ renderer: { heading: (text, level) => `<h${level} id="${slug(text)}">${text}</h${level}>` } });

const css = readFileSync(join(here, 'node_modules/github-markdown-css', `github-markdown-${theme}.css`), 'utf8');
const bg = theme === 'dark' ? '#0d1117' : '#ffffff';
const border = theme === 'dark' ? '#30363d' : '#d1d9e0';

const alertCss = ['note:#1f6feb:#4493f8', 'tip:#238636:#3fb950', 'important:#8957e5:#ab7df8', 'warning:#9e6a03:#d29922', 'caution:#da3633:#f85149']
  .map((a) => a.split(':'))
  .map(([n, b, t]) => `.markdown-alert-${n}{border-color:${b}}.markdown-alert-${n} .markdown-alert-title{color:${t}}`)
  .join('');

const html = `<!doctype html><html><head><meta charset="utf-8"><style>${css}
body{background:${bg};margin:0}
.markdown-body{box-sizing:border-box;max-width:1012px;margin:24px auto;padding:45px;border:1px solid ${border};border-radius:6px}
.markdown-alert{padding:.5rem 1rem;margin-bottom:16px;border-left:.25em solid}
.markdown-alert-title{font-weight:500;display:flex;align-items:center;gap:8px}
.markdown-alert svg{fill:currentColor}${alertCss}</style></head>
<body><article class="markdown-body">${marked.parse(readFileSync(src, 'utf8'))}</article></body></html>`;

writeFileSync(out, html);
