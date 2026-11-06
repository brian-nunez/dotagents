# Layout and spacing

How to size, space, and arrange elements: white space, the spacing/sizing system, widths, columns, grids, responsive scaling, and grouping by proximity. Consult when blocking out layouts, setting padding and gaps, choosing widths, adapting to mobile, and when critique finds a screen cramped, stretched, or ambiguous.

## Start with too much white space, then remove it

- Give every element clearly too much room first, then reduce until it feels right. Adding space "until it stops looking bad" stops at the bare minimum.
- What looks slightly excessive on one component usually reads as "just enough" in the full page.
- Remove space from the gaps between items before removing it from container padding. Card padding usually stays generous.
- Starting points for a first pass: card padding 32px (then settle on the density's `--card-pad`, 24px comfortable), section gaps 64–96px (`--section-gap`), label→input 8px, field group gap 24px, control height 40–48px (`--control-h`).

## Spacing and sizing system

Pick every padding, margin, gap, width, height, and icon size from a predefined scale. Never nudge values one pixel at a time.

- Make the scale non-linear: adjacent values ≈20–25%+ apart. A flat "multiples of 4" scale still leaves 120 vs 124 vs 128 to agonize over.
- Small values need fine steps (12→16 is +33%); large values need coarse steps (500→520 is only +4%, invisible).
- Base it on 16px. Canonical scale: [tokens](tokens.md) — `4, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 384, 512, 640, 768`.

```css
:root {
  --space-1: 4px;  --space-2: 8px;  --space-3: 12px; --space-4: 16px;
  --space-6: 24px; --space-8: 32px; --space-12: 48px; --space-16: 64px;
  --space-24: 96px; --space-32: 128px;
}
```

- Use the same scale for sizes: icons 16/20/24 (32+ only inside a shape), avatars 24/32/40/48/64/96, control heights 32/40/48, max-widths 384/512/640/768.
- Use the scale for HTML mockups via custom properties so every value is auditable.

## Using the system: pick by elimination

1. Guess the likely value (e.g., icon 16px).
2. Render the neighbors on either side (12px and 24px).
3. If both neighbors look clearly wrong, keep the middle. If one neighbor wins, re-center on it and compare again (16 / 24 / 32).
4. Need more space? Jump to the next scale value; it is usually right.

## Don't fill the screen

- Give each element the width it needs. If a form needs 640px, use 640px on a 1440px screen.
- One full-width element (nav, hero band) does not oblige anything else to be full-width.
- Stretched layouts spread related values apart and make the eye travel; narrow centered content with empty margins reads as deliberate.
- Keep paragraphs to 45–75 characters (`max-width: 20em`–`35em`) even when sibling elements are wider ([typography](typography.md)).
- Avoid the opposite error too: when content genuinely needs space, use it.

| Content | Typical width |
|---|---|
| Login / signup card | 448–512px max-width |
| Form column | 512–640px |
| Cart / checkout column | 512–640px |
| Article body | ≈ 620px column (34em at 18px); 640–768px content column |
| App content area | flexible, page container max 1280px |

## Shrink the canvas: design mobile first

- When designing a small interface on a large canvas feels hard, start at ~400px wide (375 for phone frames).
- Port to desktop afterwards and change only what felt compromised. Often a full-bleed background band plus a centered mobile-width column is the whole desktop adaptation.

## Columns instead of stretching

When narrow content looks unbalanced in a wide layout, split it into columns rather than widening it.

- Settings / account forms: left column (~1/3) holds the section title and helper text; right column (~2/3) holds fields at their optimal width.
- Draw full-width dividers between sections so each section is a horizontal band spanning both columns; this removes doubt about which title owns which fields.
- Keep input width proportional to expected content (postal code short, email long). Field length is an affordance; stretching every input to full width throws it away.

## Grids are a tool, not a rule

- A 12-column grid helps place things, but do not make every width a percentage.
- **Fixed sidebars.** Give sidebars a fixed width tuned to their content (e.g., 256px) and let the main area flex. A 25% sidebar becomes wastefully wide on large screens and wraps labels on small ones.
- **Fixed inside components.** Avatars, thumbnails, and icons keep fixed sizes; only the text column grows.
- **max-width over column spans.** Give cards an optimal `max-width` and shrink only when the viewport is narrower. Column-span breakpoints can make a card wider on a medium screen than on a large one.

```css
.layout  { display: grid; grid-template-columns: 256px 1fr; }
.login   { width: 100%; max-width: 512px; margin-inline: auto; }
.feed-item { display: grid; grid-template-columns: 48px 1fr; gap: 16px; }
```

## Relative sizing doesn't scale

Large elements must shrink faster than small ones on small screens. Set each size per breakpoint; do not lock them together with `em` multipliers.

| Context | Body | Headline | Ratio |
|---|---|---|---|
| Desktop article | 18px | 48px | 2.67× |
| Mobile article | 16px | 30px | ≈1.9× |

- Body text stays at 16px minimum on every viewport; only the headline shrinks.
- `2.5em` on a 16px mobile body renders 40px and wraps to four lines; set the mobile headline to 30px (`--text-3xl`) instead.
- Only constraint on mobile: the headline must not wrap excessively.

### Button padding by size, not by em

Tuned values are the sanctioned table in [tokens](tokens.md#sanctioned-component-internal-values).

| Size | font-size | Proportional (avoid) | Tuned (use) |
|---|---|---|---|
| Extra large | 20px | `15px 20px` | `16px 32px` |
| Large | 18px | `13.5px 18px` | `14px 24px` |
| Default | 16px | `12px 16px` | `12px 16px` |
| Small | 14px | `10.5px 14px` | `8px 12px` |
| Extra small | 12px | `9px 12px` | `6px 8px` |

- Larger buttons get disproportionately more horizontal padding; smaller ones get tighter padding. Each size should feel like a different size, not a zoom level.

## Avoid ambiguous spacing

When no border or background separates groups, spacing alone defines grouping. Put more space around a group than inside it — roughly 2× or more.

| Situation | Ambiguous | Clear |
|---|---|---|
| Stacked form fields | label→input 20px, input→next label 20px | label→input 8px, input→next label 24px |
| Article section heading | 24px above, 24px below | 32–48px above, 12px below |
| Bulleted list (line-height 24px) | item gap 0 (items 24px apart) | items ≥1.5× line height apart: baselines 36px apart (12px gap); at 18px/29px lines, a 16px gap |
| Icon + count action row | icon→count 16px, count→next icon 16px | icon→count 4px, between groups 32px |
| Headline + meta + body | equal gaps | meta tight under headline (4–8px), larger gap (24px) before body |
| Card internals | arbitrary 12/13/15/21/22/25/26 | 12px within groups, 24px between groups and as padding |

- Fix form proximity by adding margin below the input, not by moving the label.
- Use a visible separator (1px divider, background change, card) when groups are long or many; otherwise spacing is enough.
- Apply the rule horizontally as well as vertically.

## Density is a decision

- Default to generous spacing. Choose compact layouts deliberately for data-heavy screens (dashboards, sports stats, trading, admin tables) where seeing everything at once beats calm.
- Compact still needs structure: grouped cards, small caps labels above bold values, aligned columns, hairline dividers.
- Record density in the brief ([personality](personality.md)). Removing excess space later is easier than discovering a design needs more.
- Table rows: `--row-h` from the density mode — 40px compact, 48px comfortable, 64px airy for scannable overview tables (with zebra striping instead of borders).

## Responsive adaptation patterns

| Pattern | When | How |
|---|---|---|
| Stack columns | Two-column forms, side-by-side cards | Single column; section title + helper text above fields; liberal section spacing + dividers |
| Full-width buttons | Mobile forms and dialogs | Buttons stretch to full width, stacked, primary on top |
| Stack input groups | Email + button, meta items | Input above button; meta items on separate lines |
| Move values to the right | Stacked cards leave empty right space | Put a comparable value (price, "View all" chip) on the right of the row; saves height and forms a scannable column |
| Collapse nav | Apps whose mobile use is "check the overview" | Logo + hamburger in a 64px bar (48px compact) |
| Reduce table columns | Overview tables | Keep identifier + key value, add a row chevron; status becomes a colored dot shown only for states needing attention |
| Horizontal scroll | Full tables that must stay complete | Clip at the viewport edge so a partial column signals more content |
| Retune type | Every breakpoint | Shrink headlines faster than body (see ratio table) |

- Naive stacking is a start, not an answer. Check how much scrolling it takes to reach the first useful content.

## Alignment and edges

- Align related elements to shared edges: card text to the card padding line, help text and buttons under a textarea to the textarea's left edge (not under the avatar beside it).
- Right-align numeric table columns and their headers; left-align text columns ([components](components.md)).
- Pull an action into a heading row (right side, baseline-aligned) when it scopes to that section; it saves vertical space and clarifies ownership.
- Use a divider above a form's final action row so the buttons read as belonging to the whole form, not the last section.

## Overlap and negative margins (brief)

- Let a card overlap a hero band edge or an avatar overlap a card boundary to create layers. Use it sparingly, one or two per page. Techniques and shadows: [depth](depth.md).

## Pitfalls

- Spacing values not on the scale (13px, 15px, 21px, 26px).
- Equal space above and below headings.
- Fluid percentage sidebars and percentage-sized avatars.
- Stretching inputs to fill a wide column.
- Scaling mobile headlines with the same ratio as desktop.
- Treating a 12-column stack as a finished mobile design.

## Worked examples

1. **Two-factor setup card.** Before: tight padding, label hugging the previous input, small button. After: roughly double padding around header and body, larger label/section gaps, wider card, taller button. Structure unchanged; spacing alone fixes it.
2. **Customer reviews widget.** Too tight → slightly loosened is only "not bad". Way over-spaced → space removed until right gives the best result: generous card padding, moderately spaced 5→1 star rows (56%, 20%, 14%, 2%, 8%), clear gaps between heading, list, "Review this product", and the button.
3. **Hotel suite card.** Before: horizontal 26/24px and vertical 26, 12, 15, 21, 25, 13, 22px. After: 24px padding all round; 12px label→price and price→button; 24px button→divider and divider→"HIGHLIGHTS"; 12px heading→list. Two values replace seven.
4. **Account settings form.** Before: one ~540px centered column, every input full width, default ~32px inputs, next label 8px below the previous input. After: off-white page with white inputs; four titled sections; left 1/3 title + 14px grey helper text, right 2/3 fields; full-width dividers; 48px inputs and buttons; 24px below each input with 8px label→input; action buttons right-aligned below a divider. Mobile: single stack, plan cards stacked with price moved right, full-width stacked buttons with primary on top.
5. **Cart page.** Before: cart stretched edge to edge on a wide browser, labels and prices far apart. After: narrow centered column (640px) with the header constrained to the same width; "TOTAL" small uppercase grey, amount large and bold.
6. **Podcast app.** Designed at phone width first (hero art, overlapping play card, episode list). On desktop: full-width hero band, content column kept at about mobile width and centered, list unchanged.
7. **Invoicing dashboard sidebar.** Fixed-width dark sidebar at both viewport sizes; the main area reflows from 4 invoice cards per row to 2.
8. **Feed action row.** Before: 16px everywhere between thumbs-up, 45, comment, 17, share. After: 4px icon→count, 32px between groups; ownership is obvious.

## Checks

- Every padding, margin, gap, and fixed size in the HTML comes from the spacing scale in [tokens](tokens.md).
- Inside every group, gaps are visibly smaller than the gaps separating that group from its neighbors (vertical and horizontal).
- Every heading has more space above it than below it.
- Every form label is closer to its own input than to the input above.
- List items are spaced at least 1.5× their line height apart.
- Paragraph widths are capped at ≤ 75 characters (≤ 35em).
- Forms, login cards, and checkout columns use a `max-width` and are not stretched to the viewport.
- Sidebars, avatars, and thumbnails have fixed widths; only content areas flex.
- Mobile headline-to-body ratio is lower than desktop (≈1.9×, e.g. 30/16, vs ≈2.5–2.7×), and mobile body text is still 16px.
- Button padding matches the sanctioned per-size table and is not a fixed multiple of font size.
- On mobile, primary actions are full-width and stacked with the primary on top, and wide tables are reduced or scroll with a visible clipped column.
- Compact density appears only where the brief calls for it.
