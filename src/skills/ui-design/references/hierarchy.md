# Visual hierarchy

How to make the important things look important and everything else recede, using size, weight, color, contrast, and placement. Consult when composing any screen, styling data and labels, ranking actions, and when a critique finds the screen "noisy" or "flat".

## Rank before you style

- List every element on the screen and assign it a rank: primary (1–2 items the user came for), secondary (supporting), tertiary (metadata, legal, rarely used).
- Audit what currently draws the eye: dark fills, saturated color, large size, bold weight, solid icons. If the loudest thing is chrome (nav bar, repeated buttons) rather than the primary data, swap the treatments.
- Expect most of the gain from de-emphasizing secondary and tertiary content, not from boosting the primary.

## Size, weight, and color: use all three

Size alone produces primary text that is too large and secondary text that is too small. Split the job:

- **Weight** for emphasis: make the primary element bold and keep its size reasonable.
- **Color** for de-emphasis: make supporting text a softer color instead of shrinking it.
- **Size** only for the big jumps (page title, key metric).

```css
/* Before: size-only hierarchy (everything weight 400) */
.title { font-size: 30px; font-weight: 400; }
.desc  { font-size: 16px; font-weight: 400; }
.price { font-size: 24px; font-weight: 400; }
.meta  { font-size: 14px; font-weight: 400; }

/* After: weight + color hierarchy */
.title { font-size: var(--text-2xl);  font-weight: var(--weight-bold);   color: var(--text-primary); }
.price { font-size: var(--text-lg);   font-weight: var(--weight-bold);   color: var(--text-primary); }
.desc  { font-size: var(--text-lg);   font-weight: var(--weight-normal); color: var(--text-secondary); }
.meta  { font-size: var(--text-base); font-weight: var(--weight-normal); color: var(--text-tertiary); }
```

- The title got smaller but stronger; secondary text got bigger (16→18, 14→16) and quieter through color. Readability improves while hierarchy gets clearer.

## Text color ladder

Use three text colors. More tiers cannot stay distinguishable while still meeting contrast targets.

| Tier | Use | Example (cool blue-grey) |
|---|---|---|
| Primary (`--text-primary`) | Headlines, names, key values, active nav | `hsl(202, 57%, 15%)` (14.5:1) |
| Secondary (`--text-secondary`) | Body copy, descriptions, dates, supporting values | `hsl(201, 23%, 34%)` (7.0:1) |
| Tertiary (`--text-tertiary`) | Footnotes, review counts, placeholders, legal | `hsl(203, 16%, 43%)` (5.0:1) |

- Keep the hue nearly constant (201–203), raise lightness (15→34→43%), and lower saturation as lightness rises (57→23→16%). The tertiary step is the lightest shade that still passes 4.5:1; a lighter `hsl(203, 15%, 47%)` measures 4.36:1 and fails.
- Avoid pure black for primary text; use `--text-primary` (`--neutral-900`, a very dark saturated neutral).
- Canonical ladder and contrast targets: [tokens](tokens.md). Grey temperature: [color](color.md).

## Two weights, nothing under 400

| Role | Weight |
|---|---|
| Most text | `--weight-normal` 400 |
| Emphasis | `--weight-bold`: 600 or 700, one value per project |

- Use two weights for UI text. Add `--weight-medium` (500) as an optional third for labels and nav, and `--weight-display` only for headlines ≥30px.
- Keep UI text at 400 or heavier. Weights under 400 are for large headings (≥ 30px) only; to de-emphasize small text, use a lighter color or one size step smaller instead.

## Emphasize by de-emphasizing

When the key element still does not stand out and there is nothing left to add to it, quiet its competitors.

- Nav: active item keeps its color and weight; inactive items move to `--text-tertiary` (a soft grey-blue that still passes 4.5:1, e.g. `hsl(215, 15%, 47%)`, 4.69:1), not dark and bold.
- Panels: if a sidebar competes with the main content, remove its card background and let it sit on the page background. Only the main content stays a white surface.
- Repeated row actions: turn per-row solid buttons into small outline buttons or links.

## Labels are a last resort

A `Label: value` layout gives every field equal weight. Remove or demote labels so data can carry hierarchy. Forms still need labels; this applies to displaying data.

1. **Drop the label when format explains it.** `jane@example.com`, `(555) 765-4321`, `$19.99`, `2 days ago` need no label.
2. **Drop it when context explains it.** A department line under a person's name; a name in a "Recent Invoices" card is the client. The UI does not need to mirror database fields one-to-one.
3. **Merge label into value.** `In stock: 12` → `12 left in stock`; `Bedrooms: 3` → `3 bedrooms` (bold number, regular grey word, optional icon in place of the label).
4. **Transform raw data into what the user needs.** `17/07/18` → `Due in 2 days`; `10/08/18` → `Aug. 10, 2018`; drop needless `.00` so values are consistent.
5. **When labels are required (dashboards, stat tiles), make them supporting content:** smaller, lower contrast, optionally uppercase and tracked. The value is big and heavy; the unit is smaller than the number.

```css
.stat-label { font-size: var(--text-sm); font-weight: var(--weight-bold); text-transform: uppercase;
              letter-spacing: var(--tracking-caps); color: var(--text-tertiary); }
.stat-value { font-size: var(--text-4xl); font-weight: var(--weight-bold); color: var(--text-primary); }
.stat-unit  { font-size: var(--text-base); font-weight: var(--weight-bold); text-transform: uppercase; }
```

### When to emphasize labels

- On spec sheets and other dense reference pages, users scan for the label ("Depth"), not the value ("7.6 mm"). Make the label dark/bold and the value a slightly lighter regular weight.
- Keep the value readable: a dark label with a one-step-lighter value is enough.

## Visual hierarchy is not document hierarchy

- Choose `h1`–`h6` for semantics; size them for their visual role.
- In app UIs, section and page titles usually behave like labels. Set them small (e.g., "Manage Account" at 16px instead of 24px) so tabs and content become the focus.
- A section title may be visually hidden (kept for screen readers) when the content explains itself.
- Document-style pages (articles, docs) can follow the default descending sizes.

## Balance weight and contrast

Bold text reads as emphasized because it covers more surface area (a bold glyph covers roughly 1.8× the ink of regular). Treat other heavy and light elements the same way.

- **Heavy elements → reduce contrast.** Solid icons next to text look heavier than the text. Keep hue and saturation, raise lightness: icon `hsl(212, 20%, 68%)` beside text `hsl(212, 20%, 13%)`.
- **Light elements → increase weight.** A 1px border in a pale color vanishes; darkening it looks harsh. Keep the pale color and double the width.

```css
/* Too dark */  border: 1px solid var(--neutral-400);
/* Too light */ border: 1px solid var(--neutral-200);   /* vanishes on a tinted card */
/* Balanced */  border: var(--border-2) solid var(--neutral-200);
```

## Action hierarchy

Most screens have one primary action, a few secondary actions, and some tertiary actions. Style by rank first, semantics second.

| Rank | Light background | Dark background | Colored/gradient background |
|---|---|---|---|
| Primary | Solid brand fill, white text | Solid bright fill (e.g., green/teal), white text | Solid white button, brand-colored text |
| Secondary | White fill + light border + brand/dark text, or pale grey-blue fill + dark text | Transparent + light grey outline + white text | Translucent tint (`rgba(255,255,255,.2)` or `rgba(0,0,0,.15)`) + white text |
| Tertiary | Text link (brand color or grey), no chrome | Plain white text | Plain white text |

- Keep exactly one solid high-contrast button per view or card.
- Make secondary actions near key data visually quieter than the data (smaller, translucent, outline).
- On gradients or photos, prefer black/white at low opacity for secondary buttons so contrast stays even across the background.
- Plain text links can disappear on colored bands; a small translucent pill with a chevron reads as clickable without shouting.

### Destructive actions

- If deleting is not the main purpose of the screen, make it secondary or tertiary: grey text link, or white button with light border and red text.
- Put the big solid red treatment on the confirmation step, where destruction is the primary action: modal footer on a slightly tinted band, plain-text "Cancel", solid red "Deactivate" aligned right.
- Rarely used destructive links (e.g., "Cancel subscription") can move to the top-right of their section heading row, baseline-aligned, as a plain link.

| Rank | Destructive styling |
|---|---|
| Primary (confirmation only) | Solid red, white text |
| Secondary | White, light grey border, red text |
| Tertiary | Plain grey text, no red |

## Text on colored backgrounds

Grey or white-with-opacity on color looks muddy, washed out, or disabled. Hierarchy comes from distance to the background color; pick secondary text that sits closer to the background in its own hue.

1. Start from the background hue.
2. Raise lightness toward 85–95% and keep saturation high so the text stays vivid. Measure it: normal-size text needs 4.5:1.
3. If contrast is still short, rotate hue toward the nearest brighter hue (blue → cyan, red → orange/pink, purple → pink).

```css
/* Teal band ≈ #29787B */
.band .secondary { color: hsl(183, 70%, 92%); }        /* 4.62:1; not hsl(0,0%,78%) (3.05:1) */
                                                        /* not hsla(0,0%,100%,.6) */
                                                        /* hsl(183,70%,84%) (4.14:1) only for ≥24px or bold ≥18.66px */
/* Slate-blue band ≈ #3D5A87 */
.band .label { color: #BBE8FC; }  /* hue rotated 210° → 199°, very light; 5.33:1 */
```

- Opacity text also lets patterns or images show through the glyphs; a solid hand-picked color does not.
- Exception: for large surfaces on gradients (button fills, chips), use black or white at low opacity, e.g., `rgba(0, 0, 0, 0.15)`.
- Full contrast rules: [accessibility](accessibility.md).

## Grayscale first

- Build the first high-fidelity pass in greys only. Spacing, size, weight, and contrast must carry the hierarchy.
- Add color last, and only where the grayscale design already had the strongest accents (primary button, selected state, active toggle). Layout, size, and spacing should not change when color arrives.
- If the grayscale version has no clear focal point, color will not fix it.
- Squint/blur test: blur the screenshot; the 1–2 primary elements should still be the first things visible.

## Pitfalls

- Using a large thin font (24–30px, weight 300) to make a title important; it reads weak and wastes space.
- Shrinking secondary text to 12px instead of coloring it; it becomes unreadable.
- Repeating solid buttons in every table row or card.
- Making labels bold and values regular in a stat tile (label outranks data).
- Coloring every link brand blue in a card grid; reserve color for links inside prose and use weight/darkness for card titles.
- Inconsistent value formats across sibling tiles ($500 vs $3,400.00).

## Worked examples

1. **Brokerage dashboard.** Before: every nav link the same, summary labels and values the same size and color, solid blue "Buy" + solid red "Sell" in every row. After: inactive nav grey; summary becomes one solid blue panel with tiny uppercase light-blue labels, large white values, and small light-blue change values; table headers tiny uppercase grey; ticker bold over a grey description (no truncation); gain/loss green with amount over percent; Buy/Sell become small outline buttons.
2. **Tour listing card.** Before: title 30/400, description 16, price 24/400, meta 14, all one color. After: title 24/700 dark, price 18/700, description and "per person" 18 grey, review count and footnote 16 light grey.
3. **Contact card.** Before: "Name:", "Job Title:", "Email:", "Phone:" labels, all small. After: name larger dark, role in accent color below it, email and phone small grey, no labels.
4. **Stat tile.** Before: "Heart rate" bold title over small "82 BPM". After: "HEART RATE" tiny uppercase tracked grey; "82" very large and heavy; "BPM" smaller bold uppercase beside it.
5. **Invoice overview band.** Before: three bordered white cards; labels 18px black, values 16px black; solid dark-blue "View all" buttons loudest on the page; dark blue nav bar. After: nav turns white; the three stats merge into one full-width slate-blue band flush under the header; values 36px Light white without decimals; labels 14px Bold caps, `--tracking-caps`, pale cyan `#BBE8FC` (5.33:1); "View all" becomes a 24px pill in `rgba(0,0,0,.15)` with a nested circled chevron.
6. **Recent invoice cards.** Before: bordered rows "Client: / Amount: / Due Date: / Status:". After: labels removed; client name semibold; amount 24px Medium as the largest element; "Due in 2 days" grey; status as a soft pill top-right (pale tint fill, dark same-hue text such as `#6F2323` on pale pink); full-width tinted footer "View Invoice ›".
7. **Listing actions.** Before: solid red "Delete Listing", solid blue "Edit", solid green "Publish". After: "Delete Listing" plain text link, "Edit" pale grey-blue fill with dark text, "Publish" the only solid button.
8. **Settings page title.** Before: "Manage Account" at 24px competes with tabs and the Profile card. After: 16px, acting as a label; tabs and form become the focus.

## Checks

- Each screen has one clearly dominant element visible in a blurred screenshot.
- Every text color comes from the three-step text ladder (or a hand-picked same-hue color on colored backgrounds).
- UI text uses `--weight-normal` and one `--weight-bold` (plus optional `--weight-medium`), and no text under 30px is lighter than 400.
- Secondary text is de-emphasized by color, not by sizes below 14px.
- Each view or card has at most one solid high-contrast button.
- Destructive actions are solid red only inside a confirmation step.
- No grey text or white-with-opacity text sits on a colored background, and every hand-picked on-color text passes 4.5:1 (3:1 if large).
- Data displays avoid `Label: value` pairs except on spec sheets or label-scanned tables.
- Every required label is smaller or lower contrast than its value; every unit is smaller than its number.
- Solid icons beside text are lighter in color than the text.
- Section titles in app screens are no larger than the content they introduce needs.
- Sibling values use one consistent format (decimals, date style, currency).
- The grayscale version of the mockup already shows the same hierarchy as the color version.
