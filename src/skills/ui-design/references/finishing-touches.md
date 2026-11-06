# Finishing Touches

Polish moves that make a solid layout feel designed: upgraded defaults, accent borders, decorated backgrounds, empty states, border removal, unconventional components and habits for finding new tricks. Consult after hierarchy, spacing and color are settled, when a screen is correct but plain, busy or generic.

## Supercharge the defaults

Upgrade elements that are already on the page before adding new ones.

### Icon bullets

- Replace list bullets with icons. Use checkmarks or arrows for generic lists, and content-specific icons where they fit (a padlock for security features).
- Use a filled brand-color circle with a white glyph (or a two-tone icon from [imagery.md](imagery.md#bundled-two-tone-icon-set)), about 20–24px. Align it to the first line, not centered on the whole item.
- Space the items at least 1.5× their line height apart (e.g. 12px gaps between 24px lines), not at the line height alone, so the list stays skimmable.

```css
.feature-list { list-style: none; padding: 0; }
.feature-list li { display: flex; gap: 12px; align-items: flex-start; margin-bottom: 12px; }
.feature-list .tick { flex: none; width: 24px; height: 24px; border-radius: var(--radius-full);
  background: var(--action); color: #fff; display: grid; place-items: center; margin-top: 2px; }
```

### Big quote marks

- Promote the quote marks to a graphic. Use an oversized curly "“" (about 3–4x the text size, 72px `--text-7xl`), in a pale desaturated brand tint, hanging in the left margin and overlapping the first line. Remove the typed inline quotes and the em dash before the attribution.
- Optionally, set the quote in a serif italic (for example, Georgia 20/30) for a conversational, trustworthy voice.
- Attribution: a 40px avatar, then the name in semibold brand color stacked over the title in regular grey.

```css
.quote { position: relative; padding-left: 0; }
.quote::before { content: "\201C"; position: absolute; left: -48px; top: -12px;
  font: 700 var(--text-7xl)/1 var(--font-serif); color: var(--primary-200); }
```

### Custom link styling

- Replace the default browser blue with a brand color plus heavier weight (`--weight-medium` or `--weight-bold`). For more polish, use a thick colorful underline that partially overlaps the lower part of the letters.

```css
a.fancy { color: var(--primary-900); font-weight: var(--weight-bold); text-decoration: none;
  background: linear-gradient(var(--warning-300), var(--warning-300)) 0 85% / 100% 0.35em no-repeat; }
/* or */
a.underlined { text-decoration: underline 3px var(--primary-300); text-underline-offset: -0.1em; text-decoration-skip-ink: none; }
```

### Custom checkboxes and radios

- Make the selected state use a brand color. Make the controls larger than the browser default (about 20–24px), and give checkboxes `--radius-sm` from the project's radius set. Unselected controls are grey-blue outlines in the shade reaching 3:1 on their background (`--neutral-500` on white).
- Use `accent-color` for the quickest win. Use `appearance: none` for full control.

```css
input[type=checkbox], input[type=radio] { accent-color: var(--action); width: 20px; height: 20px; }

.check { appearance: none; width: 20px; height: 20px; border: 1px solid var(--neutral-500);  /* 3:1 on white */
  border-radius: var(--radius-sm); background: var(--bg-surface); display: grid; place-items: center; }
.check:checked { background: var(--action); border-color: transparent; }
.check:checked::after { content: ""; width: 10px; height: 6px; border: 2px solid #fff;
  border-top: 0; border-right: 0; transform: rotate(-45deg) translate(1px, -1px); }
.radio { appearance: none; width: 20px; height: 20px; border-radius: var(--radius-full); border: 2px solid var(--neutral-500); }
.radio:checked { border-color: var(--action);
  background: radial-gradient(circle, var(--action) 0 40%, var(--bg-surface) 45%); }  /* dot with a white gap */
```

- Keep focus rings visible on custom controls. See [accessibility.md](accessibility.md).

## Accent borders

- A colored rectangle adds flair with no illustration or photography. Use a 4px bar (`--border-accent`; `--border-accent-lg` 6px at the page top) of a brand or semantic color.

| Placement | Spec |
|---|---|
| Top of a card | 4px full-width bar in the brand color, `border-top: 4px solid` |
| Active nav item | 2–3px bar flush with the nav's bottom edge, the label's width, plus colored label |
| Alert side | 4px left border in the alert's semantic hue, on a pale tint background |
| Under a headline | short bar 48px × 4px, left-aligned, extra space around it |
| Top of the page | 6px full-viewport bar in a deep brand shade (e.g. `--primary-700`) |

```css
.card--accent { border-top: var(--border-accent) solid var(--primary-500); border-radius: var(--radius-lg); }
.alert--info  { border-left: var(--border-accent) solid var(--info-500); background: var(--info-100); }
.headline::after { content: ""; display: block; width: 48px; height: 4px; margin-top: 16px;
  background: var(--primary-500); border-radius: var(--radius-sm); }
body { border-top: var(--border-accent-lg) solid var(--primary-700); }
.nav a[aria-current] { background: linear-gradient(var(--primary-500), var(--primary-500)) bottom / 100% 3px no-repeat; }
```

- Echo the logo or primary color, so the accent reads as part of the brand.
- Use one or two accent placements per view. If every card has a bar, it is no longer an accent.

## Decorating backgrounds

- To break monotony without restructuring, change a few backgrounds. Keep the content contrast intact.
- Panel color change: fill an emphasized card (a featured pricing plan) with a muted brand color, use white text and light tinted accents for secondary text (not grey), and keep a white footer with the CTA in the panel's hue.
- Section color change: alternate section backgrounds (brand color hero, white, dark charcoal features, light grey-blue form) to separate sections without borders.
- Subtle gradients: use two hues no more than about 30° apart. Lightness shifts can be tiny. A barely visible left-to-right glow is enough.

```css
.band   { background: linear-gradient(90deg, hsl(220, 57%, 39%), hsl(203, 46%, 45%)); } /* ~17° apart */
.page   { background: linear-gradient(180deg, var(--bg-surface) 0%, var(--neutral-050) 60%); } /* white for hero text, tint under the form */
.chip-on-gradient { background: hsla(0, 0%, 0%, .15); color: #fff; } /* translucent: contrast holds across the gradient */
```

- Repeating patterns: use a subtle tiled SVG pattern (topography lines, dots, waves). Keep the contrast between pattern and background low (a few lightness points). A pattern can also run along one edge only (a footer whose squares get denser toward the bottom).
- Single shapes: place one or two graphics at specific positions instead of a full tile, for example a triangular dot grid in a header corner, a small chunk of wave pattern top-left, or a dotted world map behind a newsletter box.

```css
.section--decor { position: relative; overflow: hidden; }
.section--decor::before { content: ""; position: absolute; top: 0; right: 0; width: 256px; height: 256px;
  background: radial-gradient(var(--primary-200) 2px, transparent 2.5px) 0 0 / 24px 24px;
  -webkit-mask-image: linear-gradient(225deg, #000 50%, transparent 50%); mask-image: linear-gradient(225deg, #000 50%, transparent 50%);
  opacity: .5; pointer-events: none; }
```

- Pitfall: decoration with enough contrast to compete with the text. If you notice the pattern before the headline, lower its contrast.

## Empty states

- Treat the empty state as the first impression of a feature, not as an afterthought. Design it in the same pass as the "ideal data" screen.
- Include an illustration or an enclosed brand-color icon, a one-line message about the benefit ("Add a new contact and start messaging."), and one emphasized primary CTA with an icon ("+ Add contact").
- Hide supporting UI that does nothing without content: tabs, filters, search, sort, bulk actions and duplicate header CTAs. Show them once there is data.
- Layout option for app pages: a left-aligned larger heading, a grey description and one button, with a large, very low-contrast outline illustration bleeding off the right edge.

## Fewer borders

- Separate elements with shadow, background contrast or space before you reach for a border. Many borders make a screen busy.
- Box shadow: outlines a container more softly than a border. It works only when the element's color differs from the page (a white card on a tinted page).
- Two background colors: adjacent areas in slightly different tints need no line between them. If you have both a tint and a border, remove the border.
- Extra spacing: more distance between groups separates them with no new UI.

Step-by-step (contacts picker card):

| Step | Change | Value |
|---|---|---|
| 0 | Card border, header border, bordered search band, border between every row, footer border | busy |
| 1 | Replace the card outline with a shadow on a light grey page | `box-shadow: var(--shadow-5);` (it is a modal picker; an in-page card takes `--shadow-2`) |
| 2 | Tint the search field and footer instead of using borders. The input becomes a borderless filled field | `background-color: var(--bg-subtle);` |
| 3 | Remove the row borders and separate rows with space. Make the selected row an inset rounded pale-blue block | `margin-bottom: 8px;` |

- Tables: replace row borders with zebra striping (very light tint on alternate rows) or with more row height.
- Dashboards: remove the 1px borders on cards and use an off-white cool page with white cards and `--shadow-2`. See [depth.md](depth.md).

## Thinking outside the box

- Treat each component as a floating box or a data display that can take any form, not as its default form.
- Rich dropdowns: make the menu wide, with sections, a 2-column grid of items (icon + bold title + one-line grey description), a "NEW" pill badge, and a secondary section on a tinted band (separated by background, not border).
- Tables, merged columns: if a column does not need to be sortable, stack it under a related one. Put the name in dark 16px over the role in muted 14px, and the amount over the policy type. Seven columns become four or five, and each cell gains hierarchy.
- Tables, enriched content: add round avatars (32px) before names, and render enums as soft pills (pale tint background, dark same-hue text) instead of plain text.
- Radio buttons as selectable cards: for important choices (plans, shipping), put each option in a card. Give it a tiny uppercase tracked label, a big bold differentiating value with a smaller unit, and a bold price with a lighter "/ mo". Selected card: 2px colored border, light tint fill, tinted text and a filled check circle in the top-right corner. Unselected cards: `--shadow-2` and no border.

```css
.option { position: relative; padding: var(--space-4); border: var(--border-2) solid transparent; border-radius: var(--radius-lg);
  background: var(--bg-surface); box-shadow: var(--shadow-2); cursor: pointer; }  /* transparent border: no layout shift */
.option:has(input:checked) { border-color: var(--primary-500); background: var(--primary-050); }
.option input { position: absolute; opacity: 0; }
.option .label { font-size: var(--text-xs); font-weight: var(--weight-bold); text-transform: uppercase; letter-spacing: var(--tracking-caps); color: var(--text-tertiary); }
```

- More unconventional moves: a dark datepicker popover over a light UI (range endpoints as bright filled circles, the days between on a lighter band); a button placed inside the input, inset with padding; a two-color headline (first line dark navy, second line brand color).

## Leveling up

- Look for decisions you would not have made. When a design impresses, find the unintuitive choices (inverted popover, button inside input, split-color headline) and add them to your toolkit.
- Rebuild interfaces you admire, from scratch, without inspecting their source first. Then compare your version with the original. The gaps show the hidden tricks, for example:

| Trick discovered | Value |
|---|---|
| Tighter line-height on headings | `--leading-tight` 1.25 (and `--leading-none` 1 for display sizes) |
| Letter-spacing on uppercase labels | `--tracking-caps` .05em (about 0.7px at 14px) |
| Stacked two-part shadows | every `--shadow-N` pairs a soft direct shadow with a tight ambient one ([depth.md](depth.md)) |
| Cropped decorative images | `overflow: hidden;` on the card so a map/illustration bleeds to the edges |
| Tinted footer band for card CTA | pale grey-blue strip, uppercase tracked link-button |

- In critique passes, ask of every default-looking element: "What is one upgrade here?" (icon, color, accent, layout).

## Worked examples

1. **Feature list card**: tiny grey bullets → 24px filled blue circles with white checks. Use a padlock-in-slate-circle for a security list.
2. **Testimonial**: italic text with inline straight quotes and "— Name, Title" → serif italic, a 72px pale-teal "“" hanging in the margin, a 40px avatar, the name in semibold brand teal stacked over a grey title.
3. **Pricing card**: plain white card → the same card with a 4px sky-blue top bar. For the featured plan, an indigo body with white text, mint-tinted secondary symbols and a white footer CTA in indigo.
4. **Conference landing page**: plain grey page → a 6px `--primary-700` top bar, a white-to-`--neutral-050` vertical gradient behind the form, and the input border replaced with `--shadow-2`.
5. **Contacts picker**: border → `--shadow-5` → `--bg-subtle` tint → 8px row gaps. The final card has zero internal borders.
6. **Product nav dropdown**: a narrow list of grey links → a wide 2-column panel with icons, titles, descriptions, a "NEW" badge and a tinted bottom band for docs links.
7. **Policy table**: six flat columns → four columns with stacked name/role and amount/type, avatars, and soft green/yellow status pills.
8. **Discounts page, empty**: tabs, filter, search and two CTAs over "No discounts" → a heading, a description, one teal "Create discount" button, and a faint oversized tag illustration bleeding off the right.

## Checks

- Every bulleted list in a marketing view uses icon bullets, or there is a stated reason to keep plain bullets.
- Testimonials use an enlarged, tinted quote glyph, and contain no typed inline quote marks.
- No link renders in the default browser blue. Links use a brand color plus weight or a custom underline.
- Checkboxes and radios show the brand color in the selected state and are at least 20px.
- Each view has at most two accent-border placements, each 4px (6px at the page top; 2–3px for active-tab indicators), in a palette color.
- Every gradient spans hues no more than 30° apart.
- Background patterns and decorative shapes have low contrast against their background, and text stays the most prominent element.
- Every list/collection view has a designed empty state with one emphasized CTA and no filters, tabs or search.
- No container has both a contrasting background and a border unless the border carries meaning.
- List rows and table rows are separated by spacing or zebra tint, not a border on every row.
- Tables with secondary data stack it under primary values instead of giving it separate unsortable columns.
- Important single-choice options with 2–4 items render as selectable cards, not as a bare radio stack.
