# Typography

Rules and exact values for sizing, setting, aligning and spacing text; consult while choosing type, building a mockup, and critiquing any text-bearing screen.

For specific typefaces and pairings, see [font-pairings](font-pairings.md). For the canonical numeric scales (type sizes, line-heights, weights, text color ladder), see [tokens](tokens.md).

## Type scale

- Use a hand-crafted scale, not a ratio-generated one. Hand-picked steps give control over which sizes exist and never produce fractional pixels.
- Default scale (canonical in [tokens](tokens.md)): `12, 14, 16, 18, 20, 24, 30, 36, 48, 60, 72` px.
  - Small end steps by 2 px (12→20), where UI text lives and fine distinctions matter.
  - Large end jumps by 6–12 px, so no time goes into picking 46 vs 48 for a headline.
- Pick every font size from the scale. A real component uses only 3–5 of them.
- Define sizes in `px` or `rem`. Keep `em` out of font-size: `em` compounds through nesting, so computed sizes fall off the scale.
  - Example: a parent at `1.25em` (20px) with a child at `.875em` computes to 17.5px, which is not a scale value.
- Reject modular scales for interface work:
  - They produce fractional sizes (16px base at 4:5 gives 31.25, 39.063, 48.828 px) that browsers round inconsistently.
  - They have too few useful steps. A rounded 3:4 scale gives only 12, 16, 21, 28 px, with nothing between 12 and 16 or between 16 and 21.
  - Golden ratio (1:1.618) from 16px gives 9.89, 16, 25.89, 41.89, 67.77, 109.66 px. The smallest step is unreadable and the gaps above 16 are huge.
  - If a ratio scale is mandated (long-form editorial only), round every value by hand when defining it.

```css
:root {
  --text-xs: 0.75rem;   /* 12 */
  --text-sm: 0.875rem;  /* 14 */
  --text-base: 1rem;    /* 16 */
  --text-lg: 1.125rem;  /* 18 */
  --text-xl: 1.25rem;   /* 20 */
  --text-2xl: 1.5rem;   /* 24 */
  --text-3xl: 1.875rem; /* 30 */
  --text-4xl: 2.25rem;  /* 36 */
  --text-5xl: 3rem;     /* 48 */
  --text-6xl: 3.75rem;  /* 60 */
  --text-7xl: 4.5rem;   /* 72 */
}
```

- Size each role by importance, not by document order. On a product card the price (24) can outrank the product title (18), and most supporting text sits at 14.
- Pitfall: a different size for every element, so every px value from 10 to 24 appears somewhere. Collapse to the scale.

## Choosing fonts

Pick from [font-pairings](font-pairings.md) first. When going beyond it, apply these filters in order.

- **Default to a neutral sans-serif for UI.** A neutral sans is the lowest-risk choice for interface text. If the brief gives no type direction, the system stack is an acceptable floor:

```css
font-family: -apple-system, "Segoe UI", Roboto, "Noto Sans", Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
```

  - Prefer a deliberate webfont over the bare system stack when the brief calls for character. The system font is overused, has no voice, and renders differently per OS.
  - Keep the system stack as the fallback after the chosen face: `font-family: "Graphik", -apple-system, …`.
- **Require at least 5 weights.** Families with many weights are usually built with more care. In a font directory, filter "number of styles" (weights × italics) to 10+. On a large free directory this cuts about 85% of families and leaves under 50 sans-serifs. A looser cut of 8+ styles (regular, semibold, bold, light plus italics) also works.
- **Optimize for legibility at small sizes.** Faces built for headlines have a short x-height and tight letter-spacing. Faces built for small text have a tall x-height and wider spacing.
  - Use a tall-x-height, normal-width face for body and UI text.
  - Keep condensed, short-x-height faces for headlines only.
  - Example: a short-x-height geometric (Futura PT) next to a tall-x-height geometric (Proxima Nova) at the same size; the second reads larger and clearer at 14px.
- **Trust popularity.** Sort a font directory by popularity. This matters most when picking something with personality (a characterful serif), where taste is hardest. Popular serifs with 10 styles include EB Garamond, Alegreya and Cormorant Garamond.
- **Learn from sites you admire.** Open the browser inspector on a well-designed site, select a heading, and read its `font-family` (or a `--font-family-sans-serif`-style custom property). Record the face and its fallback stack. Build a working vocabulary of faces this way.
- Use serifs for voice, not for UI chrome. Serif reads formal and trustworthy, and works for a testimonial, quote or article body. Keep application UI sans-serif.

## Line length

- Set paragraphs to **45–75 characters per line**. Going past 75 is risky; past ~110 readers lose their place on line returns.
- Set the measure in `em` so it scales with font size: `max-width: 20em` to `35em`.

```css
.prose p { max-width: var(--measure); } /* 34em ≈ 65–75 chars at 18px; ≈620px wide */
```

- Constrain paragraph width independently of the container. A wide section (three feature columns, images, a full-width grid) still gets a narrow intro paragraph.
  - Before: section intro at `max-width: none` runs as 2 lines of ~140 characters across a full-width feature grid.
  - After: same intro at `max-width: 34em`, centered as 3 short lines; the feature grid below stays full width.
- Size and measure are coupled. After narrowing a column, raise the body size (for example 16→18 px) and re-check the character count.
- Leave the side space empty. A narrow column with empty margins reads as deliberate and professional.

## Baseline alignment for mixed sizes

- When two sizes share a line (card title left, small actions right; a big number with a small unit), align them on the **baseline**, not the vertical center.
- Centering offsets the baselines, which is obvious when the texts sit close together.

```css
.card-header { display: flex; align-items: baseline; gap: 12px; }
```

- Before: "Who to follow" at 20px with "Refresh • See all" at 14px, `align-items: center` — the links float above the title's baseline.
- After: `align-items: baseline` — both rest on the same line and the header reads as one unit.
- Apply the same rule to value + unit pairs ("82" + "BPM", "$17" + "per person").

## Line-height

Line-height is **inversely proportional to font size** and **proportional to line length**.

| Context | Token | Line-height |
|---|---|---|
| Display headlines ≥48px | `--leading-none` | 1 |
| Headings 24–36px, stat values | `--leading-tight` | 1.25 |
| Headings 18–20px, dense UI text | `--leading-snug` | 1.375 |
| UI body, narrow reading columns | `--leading-normal` | 1.5 |
| Article body, multi-line text ≤14px | `--leading-relaxed` | 1.625 |
| Very wide measures only | `--leading-loose` | 2 |

- Narrow measures can use 1.5. Wide measures need more, because the eye travels further back to find the next line.
- Small text that wraps needs extra leading; single-line elements (buttons, badges, labels, nav items) may use `--leading-none` or `--leading-tight`. Large text needs little or none: a 48px headline at 1.5 looks like separate lines floating apart; at 1 it reads as one block.
- Set a line-height per size step. A single global `line-height: 1.5` on everything is a common, subtle mistake.

```css
body   { font-size: var(--text-lg); line-height: var(--leading-relaxed); }   /* 18/29 article body */
h1     { font-size: var(--text-5xl); line-height: var(--leading-none); }    /* 48/48 */
.small { font-size: var(--text-sm); line-height: var(--leading-relaxed); }  /* 14/23 */
```

- Pitfall: tight body leading (~1.0–1.3) on a wide column. Readers re-read or skip lines.
- List items: space items at least 1.5× their line height apart, so the item gap exceeds the line gap (18px text on 29px lines → a 16px gap between items).

## Link styling in UI-heavy screens

- In prose, make links obvious: brand color plus underline, or a distinct color.
- In interfaces where most text is clickable (cards, feeds, grids, nav), use a quieter hierarchy:
  1. Primary links (titles, nav): darker color and heavier weight, no brand color.
  2. Secondary links (author, channel): normal text color.
  3. Ancillary links: no style until hover; add underline or color on `:hover`.
- Before: video grid with every title and channel name in bright blue — the page looks overbearing.
- After: titles dark semibold, channel names grey like the meta line, underline on hover only.

```css
.card-title a { color: var(--text-primary); font-weight: var(--weight-bold); text-decoration: none; }
.card-meta a  { color: inherit; text-decoration: none; }
.card-meta a:hover { text-decoration: underline; }
```

## Alignment

- **Left-align by default** (match the language direction). Left alignment gives every line a shared starting edge.
- **Center only short, independent blocks**: headlines, hero subtitles, feature-column blurbs of ≤2–3 lines.
  - If one block in a centered row runs long, rewrite it shorter so all blocks match length (4 lines → 2 lines).
  - If a centered block exceeds 3 lines, left-align it (and its icon and title).
- **Right-align numbers** in tables and stat lists so digits and decimals line up. Right-align the column header with its data. Treat numeric dates as numbers.
- Keep text columns (names, symbols, status) left-aligned.
- **Justify only with hyphenation**, and only for print-like formal reading (magazine, newspaper). Left-aligned works there too.

```css
.formal p { text-align: justify; hyphens: auto; }
td.num, th.num { text-align: right; font-variant-numeric: tabular-nums; }
```

- Pitfall: justified text with `hyphens: none` produces rivers of word gaps.
- Pitfall: centering every table cell. Align each column by its content type.

## Letter-spacing

- Leave letter-spacing at the type designer's default for body text.
- **Tighten headlines** set in a text face: `--tracking-tight` (-0.02em) by default; for wide-set faces at 48px+, go down to -0.05em, which mimics a purpose-built headline face.
- **Widen all-caps text**: `--tracking-caps` 0.05em (0.05–0.1em for tiny labels). Caps lack the ascender/descender variety of lowercase, so default spacing crowds them.
  - A 14px caps label with 0.7px tracking equals 0.05em.
- Use the direction one way only. Widening a headline face to use it for small text does not work; pick a text face instead.

| Case | Value |
|---|---|
| Body, sentence case | `0` |
| Large headline in a text face | `--tracking-tight` `-0.02em` (to `-0.05em` for wide faces) |
| All-caps label / button / table header | `--tracking-caps` `0.05em` (up to `0.1em`) |
| Body text tightened or widened | rejected (`-0.05em` cramped, `0.05em` loose) |

## Weight usage

- Use two weights for most UI work:
  - Normal: `--weight-normal` 400 for most text.
  - Emphasis: `--weight-bold`, one value per project (600 or 700), for text that must stand out.
  - Optional third: `--weight-medium` 500 for labels and nav.
- Keep weights under 400 off small UI text. Use light/thin weights only at large display sizes (30px+), where they read as elegant.
  - Large KPI values: 36px Light under a bold caps label.
  - Large article titles: 48px Light gives an airy editorial voice; Bold/Demi at 48px gives a punchy news voice.
- Use weight before size to create hierarchy: shrink a heading and make it bold rather than keeping it big and regular.
  - Before: section heading 28px regular, card title 30px regular, all text weight 400.
  - After: section heading 18px bold, card title 24px bold, price 18px bold.
- Choose the display weight by voice: light = elegant, minimal, sophisticated; heavy (Black, Extra Black) = tough, exuberant, loud.
- Keep body weight at Book/Regular. Medium or heavier body text reads as shouting; Light body text is below the 30px floor for light weights.

## Uppercase small labels

Use the "eyebrow / label" recipe for stat labels, table headers, overlines and section kickers.

```css
.label {
  font-size: var(--text-xs);            /* 12px; --text-sm (14px) for larger labels */
  font-weight: var(--weight-bold);
  text-transform: uppercase;
  letter-spacing: var(--tracking-caps);
  line-height: var(--leading-tight);       /* single-line label: tight is fine */
  color: var(--text-tertiary);           /* softened; on color, a measured tint of the background hue */
}
```

- Pair the label with a much larger value below it (label 14px bold caps, value 36px light).
- Labels stay quieter than values: smaller, lower contrast, caps, tracked.
- Reuse one label style across the page (stat labels and table headers share it) for consistency.
- On colored backgrounds, derive the label color from the background hue with higher lightness; rotate toward a brighter neighbor hue if contrast is short (pale cyan `#BBE8FC` on slate blue). See [color](color.md).
- Pitfall: all-caps sentences or paragraphs. Keep caps to 1–4 words.

## Numerals

- Use tabular figures wherever numbers stack or update: tables, stat tiles, timers, prices in lists. `font-variant-numeric: tabular-nums;`
- Right-align numeric columns (see Alignment).
- Format consistently: one currency style per screen. Drop needless decimals when all values are whole ("$3,400", not "$3,400.00" next to "$500").
- Make the key number the largest, heaviest element in its card; set its unit or suffix smaller ("200" + small bold "GB" + small regular "of storage").
- Turn raw values into the form users read: "Aug. 10, 2018" instead of "10/08/18"; relative phrases ("Due in 2 days", "Yesterday") for deadlines.

## Mobile type ratios

- Scale large type down faster than small type. The headline-to-body ratio shrinks on small screens.
  - Desktop: headline 48px over 18px body (2.66×).
  - Mobile: headline 30px over 16px body (≈1.9×). Body never drops below 16px on mobile.
- Allow the headline to wrap to 2–3 lines on mobile; avoid excessive wrapping (more than ~4 lines).
- Define mobile sizes as their own scale values. Do not encode headline size as a fixed `em` multiple of body (2.5em is right on desktop and wrong on mobile).
- Stack inline groups (meta items separated by "•", input + button) instead of squeezing them.

```css
h1 { font-size: var(--text-3xl); line-height: var(--leading-tight); }
@media (min-width: 768px) { h1 { font-size: var(--text-5xl); line-height: var(--leading-none); } }
```

## Monospace and code

- Set code, commands, keys, IDs and hashes in `--font-mono`. Keep the stack's system fallbacks.
- Size code one step below the surrounding text (about 0.875–0.9× of it), expressed as a scale value: 14px inside 16px UI text, 16px inside 18px article body. Never use `em` for the size.
- Line-height for code blocks: `--leading-normal` 1.5 to `--leading-relaxed` 1.625 (within the 1.5–1.7 range); inline code inherits the line's line-height.
- Inline code: `--neutral-050` or `--neutral-100` background, `--radius-sm`, padding 2px 4px, `--text-primary` color. Block code: the same tint with `--card-pad` padding, or a dark block (`--neutral-900` background, `--neutral-050` text, comments in `--neutral-300`, which passes 4.5:1 on `--neutral-900` in every bundled grey family (5.9:1+; `--neutral-400` drops to 4.0:1 in Cool Grey)).
- Turn off programming ligatures (`font-variant-ligatures: none`) so `!=`, `->` and `==` render exactly as typed.
- Commands and code scroll horizontally (`overflow-x: auto; white-space: pre`); never wrap them, because a wrapped command is copied wrong.
- Copy button: a tertiary icon action (bundled `icon-dupicate.svg`, 16–20px, `aria-label="Copy"`) in the block's top-right corner, visible on hover and focus; on click, swap the icon for a check and the label to "Copied" for ~2s.

```css
code, pre { font-family: var(--font-mono); font-variant-ligatures: none; }
:not(pre) > code { font-size: var(--text-sm); background: var(--neutral-100);
  border-radius: var(--radius-sm); padding: 2px 4px; }
pre { position: relative; font-size: var(--text-sm); line-height: var(--leading-relaxed);
  background: var(--neutral-900); color: var(--neutral-050);
  padding: var(--card-pad); border-radius: var(--radius-lg);
  overflow-x: auto; white-space: pre; }
```

## Retuning after a font swap

- Re-check every size, weight and line break after changing typeface. Metrics do not transfer between families.
  - One face's Bold can be another's Semibold; drop a step when the new face sets heavier.
  - A face with a wider set reflows paragraphs; re-check the 45–75 character measure.
  - A face with a dense Regular may need the set shifted lighter (Bold / Regular / Regular instead of Black / Regular / Bold); Light stays reserved for ≥30px.
  - A very wide display face needs a smaller headline (36px instead of 48px).
  - A face with a very large x-height can drop body one step (16px instead of 18px).
- Re-check letter-spacing on headlines and caps, which depends on the face.

## Worked examples

1. **Conference landing page (text-only):**
   - Before: system font, black text, ~710px column with ~115 characters per line, 15px body at ~1.3 line-height, 48px medium headline on one line, 28px regular H2, date/location as two 26px regular lines.
   - After: ≈620px (34em) column at 18/29 body (~70 chars), body `--text-secondary`; headline 48/48 Light in dark navy over 2 lines; date and location merged into one 18px bold line with "•"; H2 18px bold with more space above than below; testimonial switched to a 20/30 italic serif for voice; mobile headline 30px over 16px body.
2. **Leisure listing card:**
   - Before: hierarchy by size only — title 30px/400, description 16px/400, price 24px/400, meta 14px/400.
   - After: title 24px/700, price 18px/700, unit "per person" regular beside the price; two weights × three text colors.
3. **Dashboard stat band:**
   - Before: label 18px regular title case above a 16px regular value; the label outranks the number.
   - After: label 14px bold caps, `--tracking-caps`, pale tint of the band hue measured at ≥4.5:1; value 36px Light white; decimals dropped.
4. **Invoice table:**
   - Before: all cells centered, headings bold black at data size, numeric dates "10/08/18".
   - After: text columns left, amounts and dates right-aligned; headings 14px bold caps tracked in grey; dates "Aug. 10, 2018"; secondary line (invoice #, currency) 14px muted under a 16px primary.
5. **Card header with actions:** 20px title and 14px "Refresh • See all" links moved from `align-items: center` to `align-items: baseline`.
6. **Video grid:** all-blue titles and channel links → dark semibold titles, grey channel names, underline on hover.
7. **Stock table:** left-aligned price/change/market-cap columns with misaligned decimals → right-aligned columns and headers with tabular figures; symbol column stays left.
8. **Marketing hero headline:** wide UI sans at 48px default tracking → `letter-spacing: -0.05em`, line-height 1, for a tighter, purpose-built headline feel.

## Checks

- Every font-size in the CSS is a value from the type scale in [tokens](tokens.md), set in px or rem.
- No paragraph exceeds ~75 characters per line; body containers have a `max-width` between 20em and 35em.
- Every line-height is a `--leading-*` token: 1 at ≥48px, 1.25 at 24–36px, 1.375 for 18–20px headings, 1.5 for UI body, 1.625 for article body and multi-line text ≤14px; single-line labels, badges, buttons and nav items may use 1 or 1.25.
- Mixed-size text on one line uses `align-items: baseline`.
- Every centered text block is 3 lines or fewer.
- Numeric table columns and their headers are right-aligned and use tabular figures.
- Any justified text also has `hyphens: auto`.
- All-caps text has positive letter-spacing (≥0.05em) and is no longer than a short label.
- Body text letter-spacing is 0; any headline tracking is negative.
- UI text uses `--weight-normal` and one `--weight-bold` (plus optional `--weight-medium`) below display sizes, and no weight under 400 appears below 30px.
- Reading and UI body text is 16px at every viewport; secondary text is ≥14px; 12px appears only in uppercase labels and badges.
- Code and commands use `--font-mono` at a scale size, on a tinted or dark block, and command blocks scroll horizontally instead of wrapping.
- In link-dense UI, only inline prose links use the brand color plus underline.
- Mobile headline-to-body size ratio is smaller than the desktop ratio.
- The primary family has 5+ weights and a system-font fallback stack after it.
