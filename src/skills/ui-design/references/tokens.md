# Design tokens

The canonical default values every mockup draws from: spacing, sizing, density, type, weight, line-height, letter-spacing, radius, borders, shadows, color roles, and contrast targets. Consult it when setting up a mockup's `:root` and whenever you are about to type a raw number. Other reference files explain *how* to use these values; **this file wins any disagreement** about *which* values exist. Worked examples elsewhere may quote historical before/after values; rules and new designs use the values here.

## The rule

- Pick every value from a scale defined here or in the brief. A value off the scale is a deliberate, recorded exception, never a nudge ("13px looked better").
- Choose by elimination: guess a value, try its neighbours on either side, keep the best. If an outer neighbour wins, re-centre on it and compare again.
- Override a scale in the brief when the project needs it (brand type, tighter density), then use the override everywhere. One system per project.
- Token names are exactly those below, plus `--font-sans`, `--font-serif`, `--font-mono` (family stacks) and `--measure: 34em` (paragraph width). Add a new token to `:root` (and the brief) before using a new value.

## Spacing and sizing

Non-linear, built from a 16px base. Small steps at the bottom where a few pixels are significant; large jumps at the top where they are not. Adjacent values stay roughly 20–25%+ apart, so each choice is visibly distinct.

| Token | px | Typical use |
|---|---|---|
| `--space-1` | 4 | tight inline gaps, 12–16px icon beside small text |
| `--space-2` | 8 | label → input, icon-to-text gap in buttons and nav (16–24px icons) |
| `--space-3` | 12 | within a group, button vertical padding |
| `--space-4` | 16 | default gap, button horizontal padding |
| `--space-6` | 24 | between fields/groups, card padding |
| `--space-8` | 32 | above section headings in cards, generous padding |
| `--space-12` | 48 | between page sections (compact), above article headings |
| `--space-16` | 64 | between page sections |
| `--space-24` | 96 | marketing section padding |
| `--space-32` | 128 | hero padding |
| `--space-48` | 192 | very large vertical rhythm |
| `--space-64` | 256 | sidebar width |
| `--space-96` | 384 | narrow column / card width |
| `--space-128` | 512 | card / modal / login width |
| `--space-160` | 640 | form / article column |
| `--space-192` | 768 | wide content column |

Group spacing: space *within* a group is always smaller than space *around* it — 8px label→input with 24px between fields; 12px below a heading with 32–48px above it; list items spaced at least 1.5× their line height.

### Sanctioned component-internal values

Small components need finer control than the scale offers. These, and only these, are allowed off-scale:

| Component | Values |
|---|---|
| Button padding (v / h) by text size | 12px text → 6 / 8 · 14px → 8 / 12 · 16px → 12 / 16 · 18px → 14 / 24 · 20px → 16 / 32 |
| Badge / pill padding | 2px / 8px (12px text), 4px / 12px (14px text) |
| Hero single-field input | 56px tall |
| Toggle switch | track 40 × 24px, knob 20px |
| Hairlines and offsets | 1px, 2px, 3px (borders, shadow offsets, focus ring width) |

## Layout widths and control sizes

| Item | Default |
|---|---|
| Paragraph measure | `max-width: 34em` (45–75 characters; 20–35em range) |
| Form column | 512–640px |
| Login / single card | `max-width: 448–512px`, shrink only below that |
| Modal | 512px (small), 640px (medium), 768px (large) |
| Sidebar | fixed 256px (224px compact); content area flexes |
| Page container | 1280px max, centered; content may be narrower |
| Icon sizes | 16, 20, 24px native; 32px+ only when enclosed in a shape (see [imagery](imagery.md)) |
| Avatar sizes | 24, 32, 40, 48, 64, 96px |
| Tap target | ≥ 44 × 44px (padding may provide it) |
| Accent bar | `--border-accent` 4px (cards, nav, alerts), `--border-accent-lg` 6px (page top) |
| Focus ring | `outline: 3px solid var(--focus); outline-offset: 2px` (an outline, not a box-shadow) |

## Density

Pick one mode in the brief; it sets these tokens.

| Token | Compact | Comfortable (default) | Airy |
|---|---|---|---|
| `--control-h` (inputs, buttons) | 32px | 40px (48px in primary forms) | 48px |
| `--row-h` (table / list rows) | 40px | 48px | 64px |
| `--card-pad` | 16px | 24px | 32px |
| `--section-gap` | 32px | 64px | 96px |

Primary forms and mobile use 48px controls in every mode.

## Type scale

Hand-picked, in `rem` (or px). No `em` for font sizes: nesting produces off-scale values.

| Token | rem | px | Typical role |
|---|---|---|---|
| `--text-xs` | 0.75 | 12 | uppercase micro-labels, badges only |
| `--text-sm` | 0.875 | 14 | secondary text, labels, table cells, help text |
| `--text-base` | 1 | 16 | UI body text, inputs, buttons, mobile reading text |
| `--text-lg` | 1.125 | 18 | article body (desktop), card titles, emphasized values |
| `--text-xl` | 1.25 | 20 | section titles, large buttons |
| `--text-2xl` | 1.5 | 24 | app page titles, prices, mobile headlines |
| `--text-3xl` | 1.875 | 30 | stat values, mobile hero headlines |
| `--text-4xl` | 2.25 | 36 | dashboard figures, sub-hero headings |
| `--text-5xl` | 3 | 48 | marketing headlines |
| `--text-6xl` | 3.75 | 60 | hero headlines |
| `--text-7xl` | 4.5 | 72 | display only |

Minimums: reading and UI body text 16px; secondary text 14px; 12px only for uppercase tracked labels and badges. Responsive: large sizes shrink faster than small ones — desktop headline/body ≈ 2.5–2.7× (48/18); mobile ≈ 1.9× (30/16).

## Weights

| Token | Value | Use |
|---|---|---|
| `--weight-normal` | 400 | most text |
| `--weight-medium` | 500 | labels, nav (optional third weight) |
| `--weight-bold` | 600 or 700 (pick one per project) | emphasis, titles, primary values |
| `--weight-display` | 300–900 | text ≥ 30px only (light = elegant, heavy = bold) |

Two weights (normal + bold) carry most UI. Weights below 400 appear only at ≥ 30px.

## Line-height

| Token | Value | Use |
|---|---|---|
| `--leading-none` | 1 | display headlines ≥ 48px |
| `--leading-tight` | 1.25 | headings 24–36px, stat values |
| `--leading-snug` | 1.375 | headings 18–20px, dense UI text |
| `--leading-normal` | 1.5 | UI body, narrow reading columns |
| `--leading-relaxed` | 1.625 | article body, multi-line text ≤ 14px |
| `--leading-loose` | 2 | very wide measures only |

Line-height falls as size rises and rises as the measure widens. Single-line elements (buttons, badges, labels, nav items) may use `--leading-none` or `--leading-tight`; the 1.625 rule applies to text that wraps.

## Letter-spacing

| Token | Value | Use |
|---|---|---|
| `--tracking-tight` | -0.02em (to -0.05em for wide-set faces) | headlines set in a text face |
| `--tracking-normal` | 0 | default — trust the typeface |
| `--tracking-caps` | 0.05em (0.05–0.1em) | ALL CAPS labels, eyebrows, small buttons |

## Radius

Choose ONE set per project from the brief's personality and apply it to every component. Mixing sharp and rounded corners reads as broken.

| Set | `--radius-sm` | `--radius` | `--radius-lg` | `--radius-button` | Feel |
|---|---|---|---|---|---|
| Sharp | 0 | 0 | 0 | 0 | formal, editorial, serious |
| Subtle (default) | 2px | 4px | 8px | 4px | neutral, professional |
| Soft | 4px | 8px | 16px | 8px | friendly, modern |
| Round | 8px | 12px | 24px | 9999px | playful, consumer |

`--radius-full: 9999px` is for avatars, badges, toggles, and dots in every set. `--radius-sm` → checkboxes, badges-as-tags, small chips; `--radius` → buttons, inputs, menus; `--radius-lg` → cards, modals, panels. Nested radius ≤ the container's.

## Borders

| Token | Value | Use |
|---|---|---|
| `--border` | 1px | inputs, table rules, dividers |
| `--border-2` | 2px | soft-colored borders that need weight, selected cards |
| `--border-accent` | 4px | accent bars on cards, nav, alerts |
| `--border-accent-lg` | 6px | accent bar across the page top |

Prefer spacing, background contrast, or a shadow before reaching for a border.

## Shadows (elevation)

Two-part: a large soft direct-light shadow plus a tight dark ambient one; the ambient part fades as elevation rises. Assign by z-position, not by taste. Every `box-shadow` in a design is one of these tokens or a named recipe in [depth](depth.md); focus rings use `outline`, underlines use `text-decoration` or a background gradient.

```css
:root {
  --shadow-1: 0 1px 3px rgba(0,0,0,.12), 0 1px 2px rgba(0,0,0,.24);   /* buttons, chips, small raised items */
  --shadow-2: 0 3px 6px rgba(0,0,0,.15), 0 2px 4px rgba(0,0,0,.12);   /* cards, raised panels, featured tile */
  --shadow-3: 0 10px 20px rgba(0,0,0,.15), 0 3px 6px rgba(0,0,0,.10); /* dropdowns, menus, popovers, toasts */
  --shadow-4: 0 15px 25px rgba(0,0,0,.15), 0 5px 10px rgba(0,0,0,.05);/* dragged items, sticky overlays */
  --shadow-5: 0 20px 40px rgba(0,0,0,.2);                             /* modals, dialogs */
  --shadow-inset: inset 0 2px 4px rgba(0,0,0,.06);                     /* inputs, wells, checkboxes */
  --shadow-image-edge: inset 0 0 0 1px rgba(0,0,0,.1);                 /* avatars/thumbnails on matching backgrounds */
}
```

Pressed state: one level lower (or none). Dragged: one level higher. Flat designs replace levels with lighter surfaces and solid zero-blur offsets (`0 3px 0 <neutral-200>`) — see [depth](depth.md).

## Color roles

Every palette ramp has 10 shades named `050, 100 … 900` (050 lightest). Bundled palettes: [palettes](palettes.md). Roles map to shades as follows; components reference role tokens or ramp tokens, never raw hex.

| Role | Token | Value |
|---|---|---|
| Page background | `--bg-page` | `--neutral-050` |
| Surface / card | `--bg-surface` | `#fff` |
| Subtle fill, zebra row, well | `--bg-subtle` | `--neutral-100` (or `--neutral-050` on white) |
| Borders, dividers | `--line` | `--neutral-200`; input borders `--neutral-300` when the field is also identified by a fill, inset shadow, or visible label box — otherwise the shade reaching 3:1 (usually `--neutral-500`) |
| Placeholder text | — | `--text-tertiary` (placeholders are text: 4.5:1) |
| Disabled text, decorative icons | — | `--neutral-400`–`500` (disabled controls are exempt from contrast) |
| Tertiary text | `--text-tertiary` | lightest neutral passing 4.5:1 on its background (usually `--neutral-600`) |
| Secondary text | `--text-secondary` | `--neutral-700` |
| Primary text | `--text-primary` | `--neutral-900`; never pure black |
| Primary action fill | `--action` | the lightest primary shade whose white label passes 4.5:1 (usually 600–700); light hues (yellow, lime, light cyan) use a 300–400 fill with a `900` label |
| Action hover | `--action-hover` | one shade darker than `--action` |
| Soft button / selection range | — | `--primary-050`–`100` background + `--primary-800` text |
| Links / active nav | — | `--primary-700` (or `--action`) |
| Status pills, alerts | — | `--{status}-100` background + `--{status}-900` text; alert accent bar `--{status}-500` |
| Focus ring | `--focus` | the primary shade reaching 3:1 against every surface it appears on (usually `--primary-500`); 3px outline, offset 2px |

Semantic families: `--danger-*` (red), `--warning-*` (yellow/amber), `--success-*` (green/teal), `--info-*` (blue/cyan), each a full 10-shade ramp. When the primary already covers a status hue (commonly info = blue primary), alias that status ramp to the primary. Tags and categories use supporting ramps, never the primary. Greys are tinted (cool or warm) with saturation rising toward both ends of the ramp. See [color](color.md).

### Text color ladder (example, cool tint on white)

```css
--text-primary:   hsl(202, 57%, 15%);  /* 14.5:1 */
--text-secondary: hsl(201, 23%, 34%);  /*  7.0:1 */
--text-tertiary:  hsl(203, 16%, 43%);  /*  5.0:1 on white, 4.6:1 on neutral-050 */
```

Three steps — dark, mid, light — same hue, saturation easing as lightness rises; every step passes 4.5:1 on the backgrounds it is used on. On colored backgrounds, build a separate ladder from the background's hue (see [hierarchy](hierarchy.md)).

## Contrast targets

| Text | Minimum | Better |
|---|---|---|
| Normal text (< 24px, or < 18.66px bold) | 4.5:1 | 7:1 |
| Large text (≥ 24px, or ≥ 18.66px bold) | 3:1 | 4.5:1 |
| Meaningful icons, focus rings, chart marks, and any border that alone identifies a control | 3:1 against adjacent colors | |

How to measure and fix: [accessibility](accessibility.md).

## Starter `:root`

`../assets/starter.html` ships this whole set as CSS custom properties. Copy it, swap the palette values for the brief's palette, set the density and radius set, and adjust only what the brief overrides.

## Checks

- Every spacing, size, font-size, weight, radius, and shadow resolves to a token in `:root` or a sanctioned component-internal value.
- `:root` defines one radius set and one density mode, and every component uses them.
- No font size is defined in `em`; no text below 12px; 12px appears only in uppercase labels and badges.
- Every color resolves to a palette ramp shade or white; no ad-hoc hex values appear in component rules.
- Primary text uses `--neutral-900`; no `#000` text.
- Shadows follow the elevation roles (button < card < dropdown < dragged < modal); focus rings are outlines reaching 3:1.
- Paragraph text has a `max-width` within 20–35em.
- Every text/background pair meets the contrast targets above.
