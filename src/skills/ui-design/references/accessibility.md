# Accessibility That Still Looks Good

Contrast targets, techniques for meeting them without ugly results, non-color cues, semantics, focus, tap targets, labels, legibility and motion; consult when picking any text/background pair, styling status or charts, and before signing off a mockup.

Canonical text ladder and contrast targets live in [tokens.md](tokens.md); palette mechanics in [color.md](color.md); component states in [components.md](components.md).

## Contrast targets (WCAG 2.x)

| Content | AA | AAA |
|---|---|---|
| Normal text (<24px regular, <18.66px bold) | 4.5:1 | 7:1 |
| Large text (≥24px regular, or ≥18.66px / 14pt bold) | 3:1 | 4.5:1 |
| UI component boundaries and states that identify a control, focus indicators, meaningful icons and chart marks | 3:1 | — |
| Disabled controls, pure decoration, logos | exempt | exempt |

- Design rule of thumb: treat everything under 24px (under 18.66px when bold) as normal text. Semibold 14–16px labels, pills and table text are **normal** text and need 4.5:1.
- Target AA everywhere; aim for AAA (7:1) on body copy and primary text, which a dark ladder reaches easily.
- Contrast is measured against the actual pixels behind the text: page, card, tint, gradient stop or image. Check the worst point of a gradient or photo.
- Pitfall: placeholder text and tertiary grey (legal, timestamps) still convey information; keep them ≥4.5:1. Placeholders use `--text-tertiary`.

## Worked contrast values

### Grey on white

| Grey | Ratio on `#FFFFFF` | Normal text | Large text |
|---|---|---|---|
| `hsl(0,0%,59%)` | 2.96:1 | Fail | Fail |
| `hsl(0,0%,54%)` | 3.45:1 | Fail | AA |
| `hsl(0,0%,42%)` | ~5.4:1 | AA | AAA |
| `hsl(0,0%,40%)` / `#666666` | 5.74:1 | AA | AAA |
| `hsl(0,0%,33%)` | 7.57:1 | AAA | AAA |

- On white, neutral grey body text needs lightness ≤ ~45% for AA and ≤ ~33% for AAA.
- Tinted greys behave the same: `hsl(203,15%,47%)` is 4.36:1 (fails); drop to the ladder's tertiary `hsl(203,16%,43%)` → 5.0:1. A soft nav grey `hsl(215,15%,55%)` is 3.55:1; `hsl(215,15%,47%)` → 4.69:1.
- Off-white surfaces cost contrast: always measure against `#F5F5F5`/`#F3F6FA`, not white (`#606060` on `#F5F5F5` = 5.77:1).

### Status badges

| Treatment | Example | Ratio | Verdict |
|---|---|---|---|
| White on bright pill | Approved green / Awaiting yellow / Declined pink-red | 2.25 / 1.56 / 3.14 | Fail |
| White on saturated red | `#F24141` | 3.74:1 | Fail (normal text) |
| White on yellow | `#BFA02C` → darkened `#9B7F15` | 2.54 → 3.86:1 | Still fails; needs ~`hsl(47,86%,30%)` = `#8E720B` (4.60:1), which reads as muddy olive |
| White on darkened fills | dark green / ochre / dark red | 5.97 / 5.07 / 5.34 | AA, but heavy pills hijack the hierarchy |
| **Flipped:** dark same-hue text on pale tint | e.g. `#6F2323` on `#FDE8E8` | 9.22:1 (set: 9.01 / 9.78 / 12.32) | **AAA and quiet** |

### Colored text on a colored panel

| Background | Text | Ratio | Result |
|---|---|---|---|
| `#3D5A87` slate band | grey-white | — | Passes but looks muddy |
| `#3D5A87` | `#698FB5` (same hue, lighter) | 2.06:1 | Fail |
| `#3D5A87` | `#BBE8FC` (hue rotated to cyan) | 5.33:1 | AA, still colorful |
| `hsl(240,34%,34%)` | `hsl(240,44%,89%)` | ~7.3:1 | Passes, but looks identical to white headings |
| `hsl(240,34%,34%)` | `hsl(188,100%,85%)` | ~8.6:1 | AAA, distinct light-cyan secondary text |
| `#29787B` teal band | `hsl(0,0%,78%)` grey | 3.05:1 | Fail + muddy |
| `#29787B` | `hsl(183,70%,84%)` | 4.14:1 | Large/bold only; for normal-size text raise to `hsl(183,70%,92%)` (4.62:1) |

## Flipping contrast

- When a colored element is not the page's focus, use **dark colored text on a light tint of the same hue** instead of white on a saturated fill.
- Gains: higher contrast (often AAA) and lower visual weight; the hue still carries meaning.
- Recipe: background = the hue's `-100` shade; text = the hue's `-900` shade; 14px semibold, or 12px uppercase tracked.

```css
.badge--danger  { background: var(--danger-100);  color: var(--danger-900); }
.badge--warning { background: var(--warning-100); color: var(--warning-900); }
.badge--success { background: var(--success-100); color: var(--success-900); }
```

- Verify each pair with the snippet below; tints shift with the palette.
- Keep white-on-saturated only for the one primary action, where weight is wanted, and darken until ≥4.5:1.

## Rotating hue to gain contrast

- Hues differ in perceived brightness at equal HSL lightness: at S100% L50%, yellow (60°) ≈ 88%, cyan (180°) ≈ 80%, magenta (300°) ≈ 65% are bright; blue (240°) ≈ 41%, red (0°) ≈ 50% are dark.
- To lighten secondary text on a dark colored panel without approaching white: start from the panel hue, raise lightness, then **rotate hue toward the nearest bright hue** (60°, 180°, 300°). Example: slate blue 210° → cyan ~199° (`#BBE8FC`).
- To darken a color for text on light backgrounds without going muddy: rotate toward the nearest dark hue (0°, 120°, 240°) — e.g. darken yellow by moving toward orange.
- Limit rotation to ~20–30° for shades within one ramp; for secondary text on a colored panel larger shifts (up to ~50°) are acceptable if the result stays harmonious.
- Pitfalls:
  - Grey text on a colored background looks muddy; derive the color from the background hue instead.
  - White at reduced opacity (`hsla(0,0%,100%,.6)`) looks washed-out and lets patterns show through text; use a solid hand-picked color.
  - Exception: for *surfaces* (chips, buttons) on gradients, black or white at low opacity (e.g. black 15%) keeps contrast consistent across the gradient — then check the text on top at both gradient ends.

## Never rely on color alone

- Pair every color-coded meaning with a second cue: icon, text, shape, position or pattern.
  - Metric deltas: green "1.4%" / red "11.1%" become indistinguishable for red-green color blindness → add ↑ / ↓ arrows inside the pills.
  - Status: pill text ("Overdue") always present; mobile dots appear only next to the amount on attention rows *and* the detail view states the status in words.
  - Form errors: red border + error icon + message text.
  - Links in prose: color + underline (or weight) so they differ from body text by more than hue.
- **Charts and series:** vary lightness, not just hue. A donut with blue/green/orange collapses under blue-yellow color blindness; one hue at light/mid/dark stays separable. Add direct labels or a legend with values.
- Test: render the mockup in grayscale; every distinction must survive.

## Semantic markup independent of visual size

- Choose elements for meaning; style them for hierarchy. An h1 may render at 16px when the page title acts as a label.
- Keep one logical heading outline (h1 → h2 → h3, no skipped levels) even when visual sizes don't descend.
- Include section headings for screen readers even when the content speaks for itself, and hide them visually:

```css
.visually-hidden {
  position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px;
  overflow: hidden; clip: rect(0 0 0 0); clip-path: inset(50%);
  white-space: nowrap; border: 0;
}
```

- Use real `<button>` for actions and `<a href>` for navigation regardless of styling (a text-link "Cancel subscription" that performs an action is a `<button>`).
- Tables of data use `<table>`, `<th scope>`; stacked two-line cells keep both values in the same `<td>`.
- Landmarks: `<header>`, `<nav aria-label>`, `<main>`, `<footer>`; one `<main>` per page.
- Custom checkboxes, radios, plan cards: keep a native `<input>` underneath (visually hidden, not `display:none`) so keyboard and screen readers work; the card is the `<label>`.
- Icon-only buttons (menu, close X, chevrons) get `aria-label`; decorative icons get `aria-hidden="true"`.

## Focus visibility

- Every interactive element shows a visible focus indicator with ≥3:1 contrast against adjacent colors.
- Use `:focus-visible` so mouse clicks stay clean and keyboard users see a ring:

```css
:focus-visible {
  outline: 3px solid var(--focus);   /* --primary-500: reaches 3:1 on every surface */
  outline-offset: 2px;
}
.on-dark :focus-visible { outline-color: #fff; }
```

- Inputs use the same outline plus a border color change to `--primary-500`; check the ring against the page, not the input. Draw focus rings with `outline`, never `box-shadow`.
- Never remove outlines without a replacement. Focus order follows visual order; modals trap focus and return it on close.
- Plan cards and custom controls show the same ring as buttons; card-based controls lend themselves to distinct hover, focus and selected states — design all three.

## Tap and click targets

- Minimum target **44×44px** for touch (WCAG AAA 2.5.5; platform guidance 44pt/48dp). WCAG AA floor is 24×24px with spacing.
- Visual size can be smaller if the hit area is padded: a 24px "View all" pill gets ≥44px hit height via padding or a pseudo-element.

```css
.hit-44 { position: relative; }
.hit-44::after { content: ""; position: absolute; inset: 50% auto auto 50%;
  width: max(100%, 44px); height: max(100%, 44px); transform: translate(-50%, -50%); }
```

- 48px inputs and buttons satisfy targets by default; keep ≥8px between adjacent targets.
- Whole-card click zones: make the full card the link, and mark it with a visible affordance (tinted footer band + chevron).
- Mobile list rows with a chevron use the airy `--row-h` (64px); never below 48px.

## Form labels are mandatory

- Every form control has a visible, programmatically associated `<label>` (or `aria-labelledby`). "Labels are a last resort" applies to **displaying data**, never to inputs.
- Placeholder is a hint ("Enter your email address"), not a label; it disappears on input. Color it `--text-tertiary` (≥4.5:1). Single-field forms (newsletter) may use a visually hidden label plus a placeholder.
- Helper and error text connect via `aria-describedby`; errors state the fix in words, near the field.
- Group related radios/checkboxes in `<fieldset>` with `<legend>` (e.g. "Change Plan", "Notifications").
- Required fields are marked in text or with a legend, not by color alone.

## Legible weights and sizes

- UI text weight ≥400. Weights under 400 only for large headings (≥30px, e.g. 48px light headline or 36px light stat value).
- Reading and UI body text 16px at every viewport, mobile included; 14px minimum for secondary text; 12px only for uppercase tracked labels and badges, with letter-spacing ~0.05em.
- Small text needs taller line-height (`--leading-relaxed` 1.625 at ≤14px; `--leading-normal` 1.5 for UI body, 1.625 for article body); large text tightens to `--leading-tight` 1.25 (24–36px) and `--leading-none` 1 (≥48px).
- Prefer typefaces with a tall x-height and normal width for UI text; avoid condensed short-x-height faces below headline sizes.
- De-emphasize with color and weight before shrinking text: grow secondary text 14→16px and lighten its color instead of making it tiny.
- Prefer `rem` for font sizes so user zoom and default-size preferences apply; layout must survive 200% zoom without clipped text.

## Motion restraint

- Use motion only to explain change (open/close, reorder, state transitions). Keep durations ~150–300ms, ease-out for entering, ease-in for leaving.
- Respect reduced-motion preferences:

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: .01ms !important; animation-iteration-count: 1 !important;
    transition-duration: .01ms !important; scroll-behavior: auto !important;
  }
}
```

- Nothing flashes more than 3 times per second. Auto-playing carousels/animations >5s get a pause control.
- No parallax or large-scale motion on content pages without a reduced-motion fallback.

## Computing contrast

**Relative luminance (WCAG), used for compliance:**

1. Channel `c = value / 255`.
2. Linearize: `c ≤ 0.04045 ? c / 12.92 : ((c + 0.055) / 1.055) ^ 2.4` (WCAG 2.x prints 0.03928; the difference is negligible).
3. `L = 0.2126 R + 0.7152 G + 0.0722 B`.
4. Ratio `= (L_lighter + 0.05) / (L_darker + 0.05)`, from 1:1 to 21:1.

**Perceived brightness (HSP), used for intuition, never for compliance:**

```
brightness = sqrt(0.299 r² + 0.587 g² + 0.114 b²) / 255   (0–1, r g b in 0–255)
```

- It operates on gamma-encoded values and explains why yellow looks lighter than blue at equal HSL lightness. Use it to choose a hue direction; use relative luminance to pass or fail a pair.

**Browser snippet** (paste into the page console or run via a page-evaluate tool; accepts any CSS color the browser can resolve to `rgb()`):

```js
(() => {
  const toRGB = (c) => {
    const el = document.createElement('div');
    el.style.color = c; document.body.appendChild(el);
    const m = getComputedStyle(el).color.match(/[\d.]+/g).map(Number);
    el.remove(); return m.slice(0, 3);
  };
  const lum = (rgb) => rgb.map((v) => { v /= 255;
      return v <= 0.04045 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4; })
    .reduce((a, v, i) => a + v * [0.2126, 0.7152, 0.0722][i], 0);
  const ratio = (fg, bg) => { const [a, b] = [lum(toRGB(fg)), lum(toRGB(bg))];
    return +((Math.max(a, b) + 0.05) / (Math.min(a, b) + 0.05)).toFixed(2); };
  const bgOf = (el) => { for (let n = el; n; n = n.parentElement) {
      const c = getComputedStyle(n).backgroundColor;
      if (!/rgba\(.*,\s*0\)|transparent/.test(c)) return c; } return 'rgb(255,255,255)'; };
  window.contrast = ratio;
  window.auditContrast = (sel = 'body *') => [...document.querySelectorAll(sel)]
    .filter((el) => [...el.childNodes].some((n) => n.nodeType === 3 && n.textContent.trim()))
    .map((el) => { const s = getComputedStyle(el), px = parseFloat(s.fontSize),
        bold = +s.fontWeight >= 700, large = px >= 24 || (bold && px >= 18.66),
        r = ratio(s.color, bgOf(el));
      return { text: el.textContent.trim().slice(0, 40), px, r, pass: r >= (large ? 3 : 4.5) }; })
    .filter((x) => !x.pass);
  return { example: ratio('#6F2323', '#FDE8E8'), failures: auditContrast() };
})();
```

- `contrast('#BBE8FC', '#3D5A87')` → 5.33. `auditContrast()` lists failing text nodes.
- Limits: semi-transparent backgrounds, gradients and images are not composited; check those by sampling the rendered pixels at the darkest/lightest point. Colors returned in `color()`/`oklch()` syntax by some browsers need conversion first.

## Worked examples

- **Status pills in a policy table:** white text on green/yellow/pink (2.25 / 1.56 / 3.14, all fail) → darkened fills (5.97 / 5.07 / 5.34, pass but loud) → pale tints with dark same-hue text (9.01 / 9.78 / 12.32, AAA and quiet).
- **Dashboard stat labels on slate `#3D5A87`:** muddy grey-white → same-hue `#698FB5` (2.06:1) → hue-rotated `#BBE8FC` (5.33:1) under white 36px values (6.98:1).
- **Support panel `hsl(240,34%,34%)`:** body `hsl(240,44%,89%)` passes but merges with the white heading → `hsl(188,100%,85%)`, ~8.6:1 and visibly secondary.
- **Testimonial band `#29787B`:** company name `hsl(0,0%,78%)` (3.05:1, muddy) → `hsla(0,0%,100%,.6)` (washed out, pattern bleeds through) → solid `hsl(183,70%,84%)` (4.14:1, fine for bold text ≥18.66px or text ≥24px; use `hsl(183,70%,92%)`, 4.62:1, for normal-size text).
- **Revenue metric cards:** green/red percentage pills only → same pills with ↑/↓ arrow icons.
- **Leads donut:** blue/green/orange segments → one blue hue at three lightness levels + legend with bold percentages.
- **Inactive nav links:** `hsl(215,15%,55%)` on white (3.55:1) → `hsl(215,15%,47%)` (4.69:1); the active item still stands out via brand color and weight.
- **Manage Account title:** h1 kept for semantics, rendered at 16px; a visually hidden h2 names each settings section that has no visible title.

## Checks

- Every normal-size text/background pair measures ≥4.5:1, including placeholders, tertiary grey and text on tinted surfaces.
- Large text (≥24px, or ≥18.66px bold) measures ≥3:1.
- Status badges use pale tint + dark same-hue text, or a fill dark enough that white text reaches 4.5:1.
- Secondary text on colored panels uses a hue-derived color, not grey or translucent white.
- Every color-coded meaning also has an icon, text label or lightness difference; the mockup reads correctly in grayscale.
- Heading tags form a logical outline independent of rendered sizes.
- Every input, select, checkbox and radio has a visible associated label or a visually hidden one plus placeholder for single-field forms.
- Every interactive element shows a `:focus-visible` indicator with ≥3:1 contrast.
- Every tap target is ≥44×44px (visual or padded hit area).
- No UI text uses a font weight below 400 except headings/values ≥30px.
- Body text is ≥16px and secondary text ≥14px; 12px appears only in uppercase tracked labels or badges.
- A `prefers-reduced-motion` rule disables non-essential animation.
- Icon-only buttons have `aria-label`; decorative icons are `aria-hidden`.
