# Color

How to specify, build and apply a color system: HSL, palette anatomy, shade ramps, tinted greys, role mapping, color on color, meaning and gradients. Consult it when choosing or extending a palette, assigning colors to components, or critiquing color in a mockup. Ready-made ramps are in [palettes](palettes.md); contrast rules in depth are in [accessibility](accessibility.md); the text color ladder is in [tokens](tokens.md).

## Specify colors in HSL

- Write colors as `hsl(h, s%, l%)` in reasoning and in CSS custom properties. Shades of one color share a hue, so the relationship is visible in code; in hex it is hidden.
- Hue is degrees on the color wheel, clockwise from red:

| Hue | 0° | 30° | 60° | 90° | 120° | 150° | 180° | 210° | 240° | 270° | 300° | 330° |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Name | red | orange | yellow | chartreuse | green | spring green | cyan | azure | blue | violet | magenta | rose |

- Saturation: 0% is grey, 100% is fully vivid. At 0% the hue has no effect: `hsl(210, 0%, 50%)` and `hsl(320, 0%, 50%)` are the same grey.
- Lightness: 0% is black, 100% is white, 50% is the pure hue.
- Example, three-segment donut chart:
  - Before (hex): `#03369E`, `#507DD7`, `#9FB9ED`. They read as unrelated values.
  - After (HSL): `hsl(220, 95%, 34%)`, `hsl(220, 65%, 61%)`, `hsl(220, 69%, 80%)`. The shared hue 220 shows they are one family.

### HSL is not HSB

- Many design-tool pickers use HSB/HSV. CSS accepts HSL. Convert before writing CSS.
- In HSB, 0% brightness is black, but 100% brightness is white only when saturation is 0%. The pure hue is `HSB(h, 100%, 100%)` = `hsl(h, 100%, 50%)`.
- Conversion (S and B as 0–1): `L = B × (1 − S/2)`; `S_hsl = (B − L) / min(L, 1 − L)` (use 0 when L is 0 or 1). Hue is unchanged.
- Pitfall: reading an HSB value such as "210 / 42 / 71" as HSL gives a much darker, duller color.

## Build a palette with enough colors

A five-swatch "generated" palette cannot build an interface. Plan three groups, each as a full ramp:

| Group | Count | Use |
|---|---|---|
| Greys (neutrals) | 8–10 shades | Text, backgrounds, panels, borders, form controls, secondary buttons. Most of the UI. |
| Primary | 1–2 hues × 5–10 shades | Primary actions, active navigation, links, focus, brand accents. Ultra-light shades tint backgrounds; dark shades work as text. |
| Accents | several hues × 5–10 shades | Highlights ("New" badge in yellow, pink or teal), semantic states (red destructive, yellow warning, green positive), categorical data (chart series, calendar events, tags). |

- Expect up to about 10 hues × 5–10 shades in a complex product. The bundled palettes use 10 shades per hue (050–900).
- Start greys at a very dark grey, not `#000`, and step up to an off-white. Pure black looks unnatural.
- Example, team chat app:
  - Before: built from `#173F5F`, `#20639B`, `#3CAEA3`, `#F6D55C`, `#ED553B` only. The result was a saturated yellow message pane, a full red-orange error banner and a blue input. It looked garish and was hard to read.
  - After: about 17 colors. 3 blues (active channel bg, sidebar bg, sidebar secondary text), 2 teals (badge bg, badge text), 1 red (notification dot), 1 green (online dot), 5 greys (text, timestamps, input bg, near-white), 5 yellows (alert bg, ring, icon, body text, title text). The message pane is white and the alert is a pale-yellow tint.

## Define every shade up front

Fix the ramp before designing. Do not derive shades on the fly with `lighten()`, `darken()` or ad-hoc `color-mix()`; that produces dozens of near-identical blues.

1. **Base (500).** Pick the shade that best represents the hue at full strength. Test three candidates side by side: too dark looks heavy, too light looks chalky. Judge by eye; there is no fixed lightness. The primary action fill is chosen later by contrast, not by this step (see the role table).
2. **Edges (900 and 050/100).** Pick them inside an alert. The darkest shade is the alert title text. The lightest is the alert background. Keep the base hue and adjust S and L.
3. **Midpoints.** Fill 700 (between 900 and 500) and 300 (between 500 and 100). Each must feel like an even compromise between its neighbours.
4. **Remaining gaps.** Fill 800, 600, 400, 200 the same way. Add 050 below 100 for the faintest tint.
5. **Greys.** Use the same process without a base. 900 = darkest text color; 050 = subtle off-white page background.
6. **Tune in context.** After the ramp is in use, adjusting a shade's saturation or lightness is fine. Adding new one-off shades is not; extend the ramp instead.

```css
:root {
  --primary-050: hsl(205, 79%, 92%);
  --primary-100: hsl(205, 97%, 85%);
  --primary-300: hsl(205, 74%, 65%);
  --primary-500: hsl(205, 67%, 45%);  /* base */
  --primary-700: hsl(205, 82%, 33%);
  --primary-900: hsl(205, 100%, 21%); /* alert title text */
}
```

- Naming: `050, 100 … 900`, 050 lightest, 900 darkest.
- Ten shades is the target. Five per hue is the floor for a small project.

## Raise saturation away from 50% lightness

- The same saturation looks weaker near 0% or 100% lightness than at 50%. Plot saturation against lightness as a U-curve: lowest at the middle shades, highest at the darkest and lightest.
- Measured U-curves in the bundled ramps (900 → mid → 050):

| Ramp | S at 900 | S at middle | S at 050 |
|---|---|---|---|
| Blue Grey | 61% | 22% | 36% |
| Cyan | 91% | 57% | 100% |
| Red | 92% | 64–67% | 100% |
| Green | 86% | 35% | 65% |
| Indigo | 62% | 42% | 68% |

- Light tints at 92–97% lightness often need 90–100% saturation to read as colored instead of grey (`#FFEEEE`, `#E0FCFF`, `#FFFBEA`).
- Pitfall: a flat saturation across the ramp makes the darks muddy and the lights chalky.

## Use perceived brightness and hue rotation

- Hues differ in perceived brightness at the same HSL lightness. `hsl(60, 100%, 50%)` (yellow) looks far lighter than `hsl(240, 100%, 50%)` (blue).
- Perceived brightness, with r, g, b as 0–255, gives a 0–1 result:

```
sqrt(0.299 r² + 0.587 g² + 0.114 b²) / 255
```

- Approximate perceived brightness at S 100%, L 50%:

| Hue | 0 | 30 | 60 | 90 | 120 | 150 | 180 | 210 | 240 | 270 | 300 | 330 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Brightness % | 50 | 60 | 88 | 77 | 74 | 76 | 80 | 53 | 41 | 48 | 65 | 56 |

- Local maxima are 60° (yellow), 180° (cyan) and 300° (magenta). Local minima are 0° (red), 120° (green) and 240° (blue).
- **Lighten** a color by rotating its hue toward the nearest of 60°, 180°, 300°. **Darken** it by rotating toward the nearest of 0°, 120°, 240°. Saturation and intensity are kept, unlike a lightness change, which pushes toward white or black.
- Rotate at most 20–30° between two colors that must read as the same hue. Beyond that, they read as different colors.
- Combine both methods: take part of the change from hue and part from lightness.
- Yellow and other light hues: rotate the darker shades toward orange so they become rich amber and rust, not olive or khaki. The bundled Yellow (Vivid) ramp runs from hue 15° at 900 (`#8D2B0B`) to 49° at 050 (`#FFFBEA`). Each adjacent step moves only a few degrees.
- Typical drift in vivid ramps: dark shades move toward the deeper neighbour (yellow → orange, light blue → blue, pink → magenta), light shades move toward the brighter neighbour (blue → sky/cyan, teal → mint, orange → peach).

## Tint the greys

- Greys with some saturation set the interface's temperature. Once any surface is tinted, pure 0% greys look dead next to it.
  - Cool: blue hue, about 207–216°.
  - Warm: yellow-orange hue, about 37–43°.
- Raise grey saturation at the extremes too, or the lightest and darkest shades will look washed out. Equal lightness, different temperatures:

| Step | Neutral | Cool | Warm |
|---|---|---|---|
| 1 | `hsl(0, 0%, 28%)` | `hsl(209, 15%, 28%)` | `hsl(41, 15%, 28%)` |
| 2 | `hsl(0, 0%, 43%)` | `hsl(207, 12%, 43%)` | `hsl(40, 12%, 43%)` |
| 3 | `hsl(0, 0%, 58%)` | `hsl(208, 12%, 58%)` | `hsl(39, 12%, 58%)` |
| 4 | `hsl(0, 0%, 76%)` | `hsl(210, 16%, 76%)` | `hsl(39, 16%, 76%)` |
| 5 | `hsl(0, 0%, 88%)` | `hsl(208, 21%, 88%)` | `hsl(39, 21%, 88%)` |

- The amount of tint is a brand choice: a few percent tips the temperature, 30%+ makes the interface lean clearly blue or warm.
- Default: take the grey hue from the primary hue (blue primary → blue-tinted greys). This keeps neutrals in harmony with the accents.
- Example, invoice dashboard "greys" that are actually saturated:
  - Name text: `hsl(212, 56%, 16%)`
  - Secondary text: `hsl(212, 18%, 35%)`
  - Page background: `hsl(210, 32%, 93%)`
  - Card footer / table header: `hsl(210, 38%, 97%)`
- Example, text ladder: `hsl(202, 57%, 15%)`, `hsl(201, 23%, 34%)`, `hsl(203, 16%, 43%)` (14.5 / 7.0 / 5.0:1 on white). The hue holds and saturation falls as lightness rises.

## Map shades to roles

Use this as the default mapping; it expands the role table in [tokens](tokens.md), which wins any disagreement. N = neutral ramp, P = primary ramp, A = accent or semantic ramp.

| Role | Shade |
|---|---|
| Page background (`--bg-page`) | N 050 |
| Card / panel | White on a tinted page; elevation and separation come from the background difference |
| Card footer, table header, zebra rows, wells (`--bg-subtle`) | N 100 (N 050 on white) |
| Borders, dividers (`--line`) | N 200; input borders N 300. When a border needs weight, a pale 2px border (`--border-2`) beats a dark 1px one |
| Headings, primary text (`--text-primary`) | N 900 |
| Secondary text (`--text-secondary`) | N 700 |
| Tertiary text, placeholders (`--text-tertiary`) | Lightest N shade passing 4.5:1 on its background, usually N 600; see [accessibility](accessibility.md) |
| Disabled text, decorative icons | N 400–500 (disabled controls are exempt from contrast) |
| Icons next to text | Lighter than the text, e.g. `hsl(212, 20%, 68%)` icons with `hsl(212, 20%, 13%)` labels |
| Input fill | White with an N 300 border when a fill, inset shadow or label box also identifies the field; otherwise the N shade reaching 3:1 (usually N 500). Or a `--bg-subtle` fill |
| Primary button (`--action`) | The lightest P shade whose white label passes 4.5:1, usually P 600–700; hover (`--action-hover`) one shade darker |
| Primary button, light hue (yellow, light cyan, lime) | P 300–400 fill with P 900 text |
| Secondary / soft button | P 050–100 background, P 800 text |
| Tertiary action | Text-only link in P 700 (or `--action`) |
| Alert | A 100 bg, A 900 title and body, A 500 accent bar and icon (optional A 200–300 border) |
| Badge / status pill | A 100 bg, A 900 text (optional A 200–300 border) |
| Active nav, tabs | P 700 (or `--action`) |
| Toggles, slider track, checked controls | `--action` |
| Focus ring (`--focus`) | P 500 (the primary shade reaching 3:1 on every surface it appears on), drawn as `outline: 3px solid var(--focus); outline-offset: 2px` |
| Selection range (calendar, table rows) | Endpoints P 400–600; in-range band P 050–100 |
| Main chart series | P 500–600, whichever reaches 3:1 on white (light hues such as yellow, lime, cyan and teal need P 700+ or a supporting hue); comparison series N 300 |
| Categorical series | One hue at clearly different lightnesses, or distinct accents that also differ in lightness |
| Tags, categories, "New" labels | A supporting hue, never the primary, tinted or mid shade |
| Links in prose | P 700 (or `--action`) plus underline |
| Links in nav or lists | Weight and dark neutral, no color; ancillary links styled only on hover |

- Grey contrast on white in the bundled neutral ramps: Blue Grey, Grey and Warm Grey reach 4.5:1 at 600; Cool Grey reaches it at 500. Those shades are the floor for tertiary text; secondary and body text sit at 700 and 900.
- Keep 90%+ of pixels neutral. Primary color appears in splashes: CTA, active state, selection, key data.

## Text on colored backgrounds

- Do not use grey text on a colored panel; it looks muddy (`hsl(0, 0%, 78%)` on teal). Do not use white at reduced opacity for text either; `hsla(0, 0%, 100%, .6)` looks dull or disabled, and any pattern shows through the letters.
- Hand-pick the color: keep the background hue, raise lightness, keep saturation high, and measure it. On a teal band (~`#29787B`), secondary text becomes `hsl(183, 70%, 92%)` (4.62:1, passes for normal text); `hsl(183, 70%, 84%)` (4.14:1) is acceptable only for text ≥24px or bold ≥18.66px.
- Hierarchy on any background comes from distance to the background color. Primary text sits farthest from it, secondary text closer.
- If the hand-picked color still lacks contrast, rotate the hue toward a brighter hue (cyan, magenta, yellow) instead of moving toward white:
  - Before: panel `hsl(240, 34%, 34%)`, secondary text `hsl(240, 44%, 89%)`. Contrast is 7.3:1, but the text looks white, so it reads the same as the heading.
  - After: same panel, text `hsl(188, 100%, 85%)`. Contrast is 8.6:1 and the text reads as distinctly colored secondary text.
- For large translucent surfaces on gradients or photos, opacity is right: a chip of `rgba(0, 0, 0, .15)` with white text keeps a consistent contrast across a gradient band. A solid hand-picked color would not.

## Flip the contrast for colored labels

- White text needs a surprisingly dark background to reach 4.5:1. Dark, heavy badges then pull focus from the main content.
- Use dark same-hue text on a light tint of the hue instead. It is quieter and has higher contrast.

| Status badge | White on bright | White on darkened | Dark text on light tint |
|---|---|---|---|
| Approved (green) | 2.25 fail | 5.97 AA | 9.01 AAA |
| Awaiting (yellow) | 1.56 fail | 5.07 AA | 9.78 AAA |
| Declined (red) | 3.14 fail | 5.34 AA | 12.32 AAA |

- Yellow is the worst case: `#BFA02C` must darken to `#8E720B` (4.60:1) before white text passes, and it turns olive-brown. Use cream with dark amber text instead.
- Essentials: 4.5:1 for normal text, 3:1 for large text (≥24px, or ≥18.66px bold). On white, `hsl(0, 0%, 54%)` is 3.45:1 (large text only), `hsl(0, 0%, 42%)` is 5.33:1 (AA), `hsl(0, 0%, 33%)` is 7.57:1 (AAA). Full rules: [accessibility](accessibility.md).

## Use color for meaning, never alone

- Semantic defaults: red = destructive or error, yellow = warning or pending, green = success, positive or paid. Use a vivid accent (teal, pink, yellow) for "new".
- When a primary hue already fills a semantic slot (red brand, green brand), reuse that ramp for the state. Do not add a near-duplicate hue.
- Pair every color signal with a second channel: icon, arrow, text label, shape or position.
  - Before: metric pills "1.4%" in green and "11.1%" in red. Under red-green color blindness both look khaki.
  - After: "↑ 1.4%" and "↓ 11.1%". Direction survives without hue.
- Separate chart series by lightness, not hue alone. A donut in blue, green and orange collapses under blue-yellow color blindness. A donut in light, mid and dark blue stays separable. For many series, pick accents that also differ clearly in lightness.
- Use color to enrich severity-bearing values (status columns), not neutral metadata. For low-severity rows, drop the color: a small dot only on pending or overdue rows is enough.
- Give no color emphasis to actions the user should not take. "Cancel subscription" becomes a plain link, not a red filled button. A destructive action that is the main purpose of a confirm dialog does get the red primary button.

## Gradients

- Use two hues no more than about 30° apart. Keep the change subtle so it reads as a sheen, not as two colors.
- Lighten one end by rotating its hue toward a bright hue rather than raising lightness:
  - Before: `linear-gradient(hsl(210, 100%, 75%), hsl(210, 100%, 50%))`. The top looks milky.
  - After: `linear-gradient(hsl(190, 100%, 50%), hsl(210, 100%, 50%))`. Vivid cyan to blue.
- Warm example: `linear-gradient(hsl(50, 100%, 50%), hsl(32, 100%, 50%))`.
- Section band: deep blue `#2A4D9B` to steel teal-blue `#3E7EA6`, with white icons and light-blue tinted body text.
- For buttons and pills, put the lighter value at the top and the darker at the bottom, matching light from above.

```css
.band { background: linear-gradient(90deg, hsl(221, 57%, 39%), hsl(203, 46%, 45%)); }
```

## Colored bands and panels

- Dark bands (hero, header, overview strip) use P 800–900 or N 900 with white headings and hand-picked light-tint secondary text that passes 4.5:1. Two adjacent dark shades can form a two-tone diagonal split.
- Lighter reads as closer, darker reads as farther away. A white card on an N 050–100 page lifts; a darker strip below a card recedes.
- A full colored panel (muted indigo pricing card, e.g. `#4F5F9B`) gives emphasis. Use white for primary values and a light mint/cyan tint for symbols and sublabels.
- Inverting emphasis: when a dark header outshines the key numbers, make the header white and move the dark color onto the data band.

## Dark surfaces

Dark UIs and dark bands remap roles; they do not invert the light palette.

| Role | Shade |
|---|---|
| Page | N 900 (or N 800 for a softer dark) |
| Surfaces, cards, menus | Progressively lighter than the page (N 800, then N 700): lighter = closer |
| Primary / secondary / tertiary text | N 050 / N 200 / N 300. N 300 passes 4.5:1 on N 800 and N 900 in Blue Grey, Grey and Warm Grey (5.1:1+); with Cool Grey on N 800 use N 100 / N 200 (N 300 is 4.3:1). Measure on lighter N 700 surfaces |
| Borders, dividers | N 700 (one step lighter than the surface) |
| Primary action | Desaturated P 300–400 fill with a P 900 label, or P 500–600 fill with a white label; measure either |
| Links, active nav | P 300–400, measured at 4.5:1 on the surface |
| Focus ring | A light primary shade (P 300–400) reaching 3:1 on the dark surface |
| Status pills | A 900 bg + A 100 or A 200 text (≥5.3:1 in every bundled ramp; A 300 fails in several) |

- Shadows barely register on dark backgrounds; express elevation with lighter surfaces, keeping only `--shadow-3`–`5` for overlays.
- Lower saturation of mid and light shades used on dark: full-saturation 500s vibrate against N 900.
- Pitfall: pure `#000` page with `#fff` text glares; use N 900 and N 050.

## Worked examples

- **Status column in an invoice table:** solid red `#F24141` and yellow `#BFA02C` pills with white text fail contrast and dominate the table. Pale pink pill with `#6F2323` 14px semibold text, cream with dark amber, pale green with dark green: quiet and high-contrast.
- **Stat band label on slate blue:** a desaturated grey label looks muddy. Raising lightness in the band's hue gives `#698FB5` (harmonious, but low contrast). Rotating toward cyan gives `#BBE8FC`: legible and colored, and the white values still dominate.
- **Testimonial panel:** the panel is `hsl(221, 49%, 33%)`. The attribution is `hsl(194, 49%, 73%)`: hue shifted 27° toward cyan, lightness raised, saturation held.
- **Teal testimonial band:** company name `hsl(0, 0%, 78%)` (muddy, 3.05:1), then `hsla(0, 0%, 100%, .6)` (washed out, pattern shows through), then a solid same-hue tint: `hsl(183, 70%, 84%)` (4.14:1) for bold text ≥18.66px, `hsl(183, 70%, 92%)` (4.62:1) for normal-size text.
- **Settings form greys:** darkest grey for field labels, dark grey for helper text, mid grey for input and button borders, light grey for the payment-card fill and dividers, lightest grey for the page. Then tint all of them blue, e.g. text `#576272` and page ~`#F3F6FA`.
- **Dashboard temperature pass:** neutral greys (`#F5F5F5` zebra, `#5F5F5F` headers) are tinted toward the brand blue. The page becomes ~`#E8EDF4`, stripes and footers light blue-grey, amounts dark slate-blue. The page now matches the blue band.
- **Leads donut:** blue / green / orange becomes light / mid / dark blue, with a legend of dot, label and bold right-aligned percentage.
- **Privacy-policy alert:** pale indigo background, light indigo border, darkest indigo title, mid indigo body. This alert sets the ramp's 900 and 050.

## Checks

- Every color in the CSS is a custom property from a fixed ramp; no one-off hex values or runtime lighten/darken.
- Colors are authored in `hsl()` (or hex copied from a defined ramp), and any HSB picks were converted.
- The palette has an 8–10 shade neutral ramp, 1–2 primary ramps and semantic ramps for every state the UI shows.
- Neutrals carry text, backgrounds and borders; the primary appears only on actions, active states, selection and key data.
- Greys share one temperature and no surface uses pure `#000` text.
- No text on a colored background is grey or white-with-opacity; secondary text on color is a same-hue (or hue-rotated) light tint.
- Status badges and alerts use a light tint background with dark same-hue text.
- Body text reaches 4.5:1 and large text 3:1 against its actual background.
- Every color-coded signal (trend, status, error) also has an icon, label or shape.
- Chart series differ in lightness, not hue alone; comparison series are light neutral.
- The primary action fill is the lightest primary shade whose white label passes 4.5:1; light-hue buttons (yellow, light cyan, lime) use a 300–400 fill with a 900 label.
- Every gradient spans hues no more than ~30° apart.
- Dark and light ends of each ramp are visibly colored, not washed-out grey.
- On dark surfaces, elevation comes from lighter surfaces and every text step passes 4.5:1 against its own surface.
