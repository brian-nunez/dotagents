# Components

Treatment catalogue per component family: variant menus with concrete values, how to choose, pitfalls. Consult when building or critiquing any concrete component in a mockup.

Scales (spacing, type, radius, shadows, text ladder) live in [tokens.md](tokens.md); values cited here come from those scales. Shading and elevation mechanics: [depth.md](depth.md). Color ramps and on-color text: [color.md](color.md).

## System-wide decisions (make these once, before any component)

Every family below offers the same axes. Pick one setting per axis for the whole product, then apply it everywhere.

| Axis | Options | Rule |
|---|---|---|
| Radius set | one of the four sets in [tokens.md](tokens.md#radius): Sharp (all 0) · Subtle (2/4/8px, button 4px) · Soft (4/8/16px, button 8px) · Round (8/12/24px, button 9999px) | One set across buttons, inputs, badges, cards, tabs, checkboxes. Subtle = neutral, Soft/Round = friendly/playful, Sharp = serious/formal ([personality.md](personality.md)). Nested element radius ≤ its container's. |
| Grey ramp | one tinted 9–10 step ramp (cool ~H210 or warm ~H40) | Every border, fill, divider and text grey comes from it. Saturate the light and dark ends more than the middle. No pure #ccc/#666 next to tinted greys. |
| Surface layering | canvas (`--bg-page`, neutral-050) → white surface (`--bg-surface`) → dark primary | White cards and inputs only gain contrast on an off-white canvas. |
| Depth language | buttons raised, inputs sunken | Raised = drop shadow and/or lighter top edge. Sunken = inset top shadow, or soft fill darker than the surface. |
| Primary | one solid high-contrast fill per view | `--action`: the lightest primary shade whose white label passes 4.5:1 (usually 600–700); light hues use a 300–400 fill with a 900 label. Everything else is quieter. |
| Active state | de-emphasize the inactive items | Inactive siblings drop to `--text-tertiary`; the active item keeps full-strength color and weight plus one indicator (fill, bar, or weight). |
| Label recipe | 12px (or 14px), `--weight-bold`, uppercase, `--tracking-caps`, `--text-tertiary` | Reuse it for table headers, stat labels, nav group headings, card eyebrows. |
| Border weight | 1px `--line` (neutral-200; inputs neutral-300); 2px (`--border-2`) for "thick"; 4px accent bars (6px page top) | If a 1px border is too faint, double its width before you darken its color: a pale 2px border beats a dark 1px one. |

Once a treatment is adopted (e.g., pill buttons), convert every instance, including header CTAs and table containers.

## Buttons

**Hierarchy pyramid** — rank actions by importance on this screen, not by meaning.

| Rank | Treatment on white | On dark/colored bg |
|---|---|---|
| Primary (one per view/region) | Solid `--action` fill, white `--weight-bold` text | Solid **white** fill, brand-colored text |
| Secondary | (A) neutral-100/200 fill, no border, neutral-800 text · (B) white, 1px neutral-300 border, neutral-800 text · (C) white, 1px border + `--shadow-1` (raised) · (D) soft: primary-050/100 fill, primary-800 text | Transparent with light 1px outline and white text, or translucent fill `hsla(0,0%,100%,.15)` with white text |
| Tertiary | Text only: primary-700 or neutral-700, `--weight-bold`; underline on hover | Plain white / same-hue light text |

**Sizes** — tune padding per size; do not scale proportionally. Padding is the sanctioned table in [tokens.md](tokens.md#sanctioned-component-internal-values).

| Size | font-size | padding (v h) | Note |
|---|---|---|---|
| XL | 20px | 16px 32px | marketing heroes |
| L | 18px | 14px 24px | prominent CTAs |
| M (default) | 16px | 12px 16px | height = `--control-h` (40px comfortable; 48px in primary forms and on mobile), matching adjacent inputs |
| S | 14px | 8px 12px | toolbars, compact (`--control-h` 32–40px) |
| XS | 12px | 6px 8px | table rows, inline chips; uppercase labels only |

Proportional scaling (`14px` → `10.5px 14px`) makes sizes read as zoom levels. Match button height to adjacent inputs in the same row.

**Shape and finish variants**

- Square / small / large / pill: per the radius set. Pills read modern and soft; keep secondaries the same shape as the primary.
- Uppercase: add `--tracking-caps`, 12–14px, `--weight-bold`. Reserve for short labels (≤3 words).
- Soft shadow: buttons get `--shadow-1`; secondary option A switches from grey fill to white + `--shadow-1`.
- Raised with highlight: `box-shadow: inset 0 1px 0 var(--primary-400), var(--shadow-1);` (the raised-highlight recipe in [depth.md](depth.md); highlight is a lighter shade of the fill, not white overlay).
- Bottom profile ("key"): `box-shadow: 0 3px 0 var(--primary-800);` (flat solid offset); secondaries get a neutral-300 lip.
- Vertical gradient: lighter top → darker bottom, same hue family, ≤30° hue shift ([depth.md](depth.md)).
- Pressed: drop elevation one level (`--shadow-1` → none), fill one shade darker.
- Icon left: meaning reinforcement (check, plus, download). Icon right: direction (chevron, arrow). Icon 16–20px for 14–16px text, icon-to-text gap 8px (`--space-2`; 4px only for 12–16px icons beside small inline text), same color as label, inside the padding. Test 16/20/24 and keep the one that matches cap height.
- Icon-in-circle: pill button with a 20–24px circle nested at the right end, holding a chevron; circle follows the pill's curve.
- Split CTA: a darker square segment carrying an arrow attached to the button's right end (reads premium/formal with radius 0).

**On gradients/photos**: use black at 15% (`hsla(0,0%,0%,.15)`) or white at 15–20% for secondary chips, so contrast is constant across the gradient.

**Destructive**

- In a list/settings context: tertiary grey text ("Delete listing", "Cancel subscription"), or secondary white with danger-700 text. Move rarely-used destructive links into the section heading row, top-right, baseline-aligned.
- In the confirmation step: destruction becomes primary — solid danger-600 with white text, paired with a plain-text "Cancel".

Pitfalls: rows of solid Buy/Sell or Edit/Delete/Publish buttons (make one solid, demote the rest); semantic color on every button; buttons stretched full width on desktop forms (full width only in narrow cards, mobile, and card-bottom bars).

## Text inputs

Default for primary forms: **48px tall**, 16px text (prevents mobile zoom), 12px horizontal padding, white fill on an off-white canvas. Hero single-field CTAs: 56px. Dense filters/toolbars: `--control-h` (32px compact, 40px comfortable).

| Variant | Treatment | Use when |
|---|---|---|
| Bordered (default) | 1px neutral-300 border + `--shadow-inset` (or a neutral-500 border without the inset, so the border alone reaches 3:1), radius from set | Most app forms |
| Thick border | 2px neutral-200/300, optionally 1px darker bottom | Friendly, chunky personalities |
| No border | white field on grey canvas, separation by contrast only | Clean forms on tinted cards |
| Inset shadow | `box-shadow: var(--shadow-inset);` on light; the inset-well recipe in [depth.md](depth.md) on dark panels | Reinforcing "sunken" against raised buttons; dark panels |
| Box shadow (floating) | no border, `--shadow-2` | Single prominent input (newsletter, search hero) |
| Soft background | neutral-100 fill, no border, on a **white** surface | Login/sign-up cards; inside white modals |
| Soft bg + bottom border | neutral-100 fill + 2px neutral-400 bottom line, top corners rounded | Dense data entry, filled-field look |
| Bottom border only | transparent, 1px neutral-500 underline (it alone identifies the field, so it needs 3:1), square | Minimal/editorial forms; lowest affordance — avoid for long forms |

- Width signals expected length: zip, CVC, quantity, and dates get short fields; email and street get long ones. Don't stretch everything to the container.
- Select chevron: single thin chevron-down, neutral-500, 16px inset from the right; not the double up/down glyph.
- Textareas share border, radius, padding; min 3 lines.
- Wells (grouping a value + its action without card prominence): `--bg-subtle` fill, 1px `--line` border, `--radius`, 12px padding, e.g. payment method row with right-aligned "Update" secondary button.

## Labels, placeholders and help text

Six label approaches:

| Approach | Treatment | Tradeoff |
|---|---|---|
| Label above (default) | 14px, `--weight-medium` or `--weight-bold`, `--text-secondary`; 8px gap to input | Clearest; costs height |
| Small uppercase label above | 12px, uppercase, `--tracking-caps`, `--text-tertiary` | Denser, more formal; keep strings short |
| Label inside input | tall field (64px, `--space-16`); 12px uppercase tracked `--text-tertiary` label top-left, 16px value below | Compact and polished; needs extra height |
| Overlapping label | label sits on the top border, background-masked behind it | Compact; requires a solid surface behind |
| Placeholder as label | `--text-tertiary` text only | Lowest cost, label vanishes on typing — only for 1–2 field forms (search, newsletter) |
| Icon as label | neutral-400 16–20px glyph inside left (user, mail, lock, pin) | Use with placeholder or label; never as the only cue on unfamiliar fields |

- Placeholder is lighter than label; label is lighter than entered value. Placeholders show example format, not instructions.
- Help text: 14px `--text-secondary` below input (or beside the section title in two-column settings layouts).
- Spacing: label→own input 8px; input→next label 24px. The gap within a group is roughly half the gap between groups.
- Connected inputs: stack 2+ fields in one rounded container with 1px internal dividers, each with an inset label; good for card number/expiry/CVC and address blocks.

## Input groups

| Variant | Treatment |
|---|---|
| Attached | input and button share an edge; only outer corners rounded; button height = input height |
| Detached | 8px gap; both fully rounded |
| Inset button | button sits inside the input, inset 4px on all sides, own radius (container radius − inset) |
| Underline + square button | underline input with placeholder label; square button attached right |
| Gapped/ghost | single border wraps the group; button is white with grey text behind a 1px vertical divider (secondary action, e.g. "Apply" coupon) |
| Pill | whole group pill-shaped; button carries the right cap |
| Offset button | button slightly taller than the pill input, overlapping its right end (playful) |
| Icon-only button | square dark block with a white arrow (password-gate submit, search) |
| Addon icon | left segment with 1px divider (plain), or neutral-500 filled segment with white icon (emphasized) |

Button carries the emphasis; the input stays light. Stack input and button full-width below ~400px rather than squishing.

## Validation and errors

Color the error red (danger-700 text, danger-500 border, optional danger-050 tint) in addition to an icon, so it survives color-blindness.

| Placement | Treatment | Tradeoff |
|---|---|---|
| Inline below, plain text | 14px danger-700 text 4–8px under the field, field border danger-500 | Default; nearest and clearest |
| Inline below, solid pill | danger-600 bar with white text, rounded, below the field | Louder; good for single critical fields |
| Connected strip | red bar attached to input bottom, input loses bottom radius | Unambiguous ownership; heavy in long forms |
| Icon + tooltip on focus | "!" circle inside right of field; message tooltip appears on focus | Saves space; message hidden until focus |
| Tooltip right of field | bubble with arrow pointing left | Needs free width; truncates on narrow screens |
| Summary above form | bordered/tinted box with bulleted list of errors, links to fields | Good after submit on long forms; pair with inline |
| Summary below button | same box under the full-width submit | Near the point of action; scrolls away on long forms |

Rules: inline below for most forms; add a summary above for forms taller than a screen. Validate on blur, not on each keystroke. Valid state: green check icon inside the right of the field, no green border flood. Write messages that say how to fix ("Use at least 8 characters"), not "Oops! An error has occurred."

## Checkboxes, radios and selectable cards

- Replace browser defaults. Checkbox: 20–24px box, white fill, 1px neutral-500 border (reaches 3:1 on white in every bundled grey), `--radius-sm`. Checked: primary fill + white check. Radio: same size ring; selected = primary ring with primary dot and a white gap. Unselected rings neutral-500.
- Option layout: title 16px `--weight-bold` `--text-primary`, description 14px `--text-tertiary` indented under the title (aligned with title text, not the control). Item rhythm = `--row-h`.
- **Selectable cards** for important single choices (plans, shipping speed, account type):
  - White card, 1px `--line` border or `--shadow-2`, `--radius-lg`, `--card-pad` padding.
  - Content hierarchy: uppercase tracked grey label (BASIC) → large bold differentiator (30px "5" + bold smaller "GB" + grey "uploads") → small price line ("**$5** / mo", period lighter).
  - Selected: 2px accent border (drawn inside so layout doesn't shift), faint same-hue tint fill, label/text tinted, filled check-circle top-right.
  - On mobile, stack cards and move the price to the right edge of each to form one scannable column.
- Segmented radio (2–3 short options like Round trip / One way): pill or rounded container; active segment raised white or dark inset.

## Selects and dropdown menus

- Closed select: same chrome as text inputs, chevron right. Custom-rendered selects: show leading flag/avatar/icon where it helps recognition.
- Menu surface: white, `--radius`, `--shadow-3`, not border-only. 8px vertical padding; items 40px tall (32px compact), 12–16px horizontal padding; groups separated by 1px dividers or 8px gaps.
- Item states: hover neutral-100 fill; selected = check icon right + `--weight-bold`; destructive item ("Sign out", "Delete") last, in its own group.
- Account menu header: name + @handle at top, then grouped items.
- **Rich dropdown** (navigation/feature menus): wide panel with a small caret pointing at the trigger; 2-column grid of items, each = 20–24px icon in brand color + bold title + 14px `--text-tertiary` description; "NEW" badge on fresh items; secondary links in a bottom band on a neutral-050 background (section change by fill, not border).
- Inverted popovers (datepicker in dark neutral-800 with white numbers, primary circles for range ends and a lighter band between) make a popover pop over light UI; use sparingly, one per product.

## Header navigation

Zones: brand left; global actions (search, notifications, avatar, primary CTA) far right. Variants:

- Logo + search left / nav + actions right.
- Logo + nav left / search + actions right (most common in apps).
- Logo left / nav centered / actions right (marketing).
- Nav left / logo centered / actions right (editorial, commerce).
- Second-row nav: top row logo + search + avatar; second row links, separated by 1px border or fill change.
- No container: items directly on the canvas (lightest weight; good when a hero sits below).

Treatment: white bar with 1px `--line` bottom border or `--shadow-1`, 64px tall; links 14–16px `--weight-medium` `--text-secondary`, active `--text-primary` or primary-700 + indicator. On marketing pages, header "Log in" = text link, "Sign up" = outlined or solid button. Give the header less visual weight than the content's key data — a dark header steals focus from a dashboard; make the header white and move the dark fill to the data band if needed.

## Tabs and horizontal navigation

| Variant | Active treatment |
|---|---|
| Underline (default) | 1px `--line` baseline; active label `--text-primary`/primary-700 with 2–3px bar spanning label width at the baseline; inactive `--text-tertiary` |
| Soft pill | no container; active = neutral-100/primary-050 pill behind bold text (primary-800 on primary-050) |
| Dark pill / dark rounded rect | active = neutral-800 or primary fill, white text (high emphasis; top-level switches) |
| Segmented contained | white bordered container with dividers; active cell neutral-100 (light) or dark fill (strong) |
| Inset segmented | pill container; active is a pill inset 4px inside it (raised white on grey, or dark) |
| Lifted / folder | active has top/left/right border, no bottom, merges with the panel below; inactive grey text on the baseline |
| In front | inactive tabs neutral-100 filled; active white with 2px colored top border, no bottom border |
| With icons | 16–20px icon left of label, or stacked above it in tall cells |

Choose underline for in-page content switching, pills for filters, segmented for 2–4 mutually exclusive views, lifted/in-front only when the tab truly owns the panel below. Pitfall: coloring the active tab while inactive tabs stay dark and bold — demote the inactive ones.

## Sidebar navigation

- Width fixed 256px (224px compact), never a percentage. Items 40px tall (`--control-h`), 12–16px horizontal padding, icon 20px in neutral-400 (lighter than label text so solid icons don't outweigh words).
- Active treatments: full-row fill neutral-100 · fill + 4px left bar · fill + right bar (points to content) · bar only · inset rounded highlight (inset 8px from panel edges, radius from set) · pill highlight · bold only (minimal).
- Container: on its own white panel; directly on the canvas with the content as a white panel (preferred when the sidebar would compete); floating card with border + `--shadow-2`; list-group with 1px dividers.
- Groups: uppercase tracked 12px `--text-tertiary` headings ("TEAM SETTINGS"), separated by 24–32px whitespace or a 1px divider.
- Dark sidebars: inactive text is a light tint of the sidebar hue (not grey), active row one shade lighter than the panel with white text.

## Breadcrumbs, steppers and pagination

- Breadcrumbs: inactive crumbs `--text-tertiary`, current `--text-primary`; separators (chevron, slash, dot) neutral-300 so they recede. Contained variant: white segmented bar with chevron-shaped dividers, current segment neutral-100. Prefix with step numbers ("01") for checkout flows, home icon only for the first crumb to save space.
- Steppers: completed = primary fill + white check; current = white with primary ring + dot; upcoming = neutral-300 outline; connector line neutral-200, primary where complete. "STEP 1 OF 3" uppercase tracked label top-right of the card.
- Pagination: segmented white control (1px dividers, outer radius, `--shadow-1`) with the current page neutral-100 or primary-050; or strip the chrome — plain numbers, current page in a white raised box or circle; or a thin baseline with a dark segment under the current page. Include Previous/Next as text; "< 2 of 10 >" when total matters; "Load more" outlined button for feeds. Truncate with an ellipsis cell beyond 7 pages.

## Cards: stat tiles and KPI bands

- Recipe: uppercase tracked 12–14px label (`--text-tertiary`; on color, a same-hue light tint that passes 4.5:1) → large value 30–36px (light or bold weight; size carries emphasis) → small delta pill ("↑ 1.4%" success-100 bg + success-900 text, arrow icon so direction doesn't rely on color) → optional sparkline with light gradient fill.
- Unit smaller than number: "**82** BPM", "$3,400" (drop needless .00, consistent format across tiles).
- Sibling tiles that summarize one thing can merge into one full-bleed colored band with thin vertical dividers, flush under a white header. Secondary actions inside the band: small translucent pills (black 15%) with a nested chevron circle.
- Pitfall: label larger or bolder than the value; three separate bordered boxes with loud "View all" buttons.

## Cards: preview, listing and content

- Anatomy: image → eyebrow/meta → title (18px `--weight-bold` `--text-primary`) → excerpt (14–16px `--text-secondary`) → meta (avatar 24px + name + timestamp `--text-tertiary`) → action.
- Variants: left image (one-third, bleeds to edges) · right image · top image (bleeds, fixed aspect, `object-fit: cover`) · inset image (padded inside the card with its own radius) · no card (image + text directly on canvas) · thumbnail with wrapped or indented text.
- Meta above title (eyebrow) emphasizes category/context; meta below title emphasizes the author/time.
- Action options: text link "Read more ›" · small button bottom-left · full-width button inside padding · **click-target footer**: full-width band, neutral-050 fill, flush to card edges, 48px tall, centered 14px `--weight-medium` label + chevron.
- Listing card (property, product, rental): uppercase tracked eyebrow ("DETACHED HOUSE · 3,426 SQFT"), price as the largest text, address grey, icon + number facts (bed icon + "**3** Bedrooms") instead of "Bedrooms: 3", status pill top-right, heart icon on image corner, optional full-width primary bar flush to the bottom.
- Lock image aspect ratios across a grid so titles align.

## Cards: profile

- Avatar (64–96px) left of name + role, bio, then a stats row of 3 pairs: small grey label above bold dark value.
- Cover band variant: image or tinted band on top; avatar straddles the band edge, centered, with `border: 4px solid #fff` (card color) to separate overlapping photos.
- Avatar breaking out above the card's top edge adds depth; stacked follower avatars overlap with the same white ring.
- Contact rows: drop "Name:/Email:" labels; let format and position identify data (name large, role in accent, email/phone small grey).

## Pricing

- Tier cards: uppercase tracked plan name → price as largest type (48–60px, period "/ mo" small grey) → one-line description → feature list with check icons, numbers bold ("**5** Projects") → CTA.
- Featured plan: emphasize by size and elevation, not color alone — taller card overlapping neighbours (negative margin −16 to −24px top/bottom), `--shadow-2` while siblings sit flat with a 1px `--line` border, 4px top accent bar or "Most popular" badge, solid primary CTA while others get secondary buttons.
- Alternatives: single centered card; horizontal card (price | features | button); comparison matrix (feature rows × plan columns with price + button header, check icons); radio-row table of tiers; variable pricing with a slider above a big live price.
- Colored-panel variant: card body in a muted brand color, white text, same-hue tint for "$" and sublabels, white footer with brand-colored CTA text.

## Tables

- Container: white panel, `--radius-lg`, `--shadow-2` or 1px `--line` border, on the canvas.
- Header: 12px uppercase, `--tracking-caps`, `--weight-bold`, `--text-tertiary`, on a neutral-050 band or plain; header alignment matches the column.
- Alignment: text left; numbers, currency and numeric dates right (with `font-variant-numeric: tabular-nums`); relative-date phrases left; actions far right.
- Row height: `--row-h` from the density mode (40px compact, 48px comfortable, 64px airy); padding 16px horizontal. Taller rows + alignment beat grid lines.
- Separation: **zebra** (alternate rows neutral-050, no rules) for wide numeric tables; **horizontal rules** (1px `--line`, no verticals) for text-heavy rows; neither for short lists — use spacing. Never full grids.
- Combined columns: stack non-sortable secondary data under the primary — name (16px `--text-primary`) over role/ID (14px `--text-tertiary`); amount over currency. Reduces 7 columns to 5.
- Enrich: 32–40px avatars before names; status as soft pills; severity color on values (green gains, red losses with +/− signs).
- Row actions: one secondary outlined small button or a "•••" menu, never a row of solid buttons. Dragged row: white, `--shadow-4`, handle icon.
- Grouping: rowspan grouping column with a vertical rule, or a thin neutral-050 group header row with a small label.
- Mobile: either horizontal scroll with a visible cut-off at the edge, or keep identifier + key value + chevron and reduce status to a colored dot shown only for states needing attention.

## Badges and status pills

- Default: **light tint bg + dark same-hue text** — `--{status}-100` bg + `--{status}-900` text: success-100 + success-900, danger-100 + danger-900, warning-100 + warning-900. Hits AAA while staying quiet; white text on bright fills fails (yellow needs darkening to muddy olive to pass).
- Size: 12px uppercase `--weight-bold` text, padding 2px 8px (4px 12px for 14px text), `--radius-full` or `--radius-sm`.
- Emphasis ladder: solid fill > tint + 2px border > tint + 1px border > tint > outline-only. Borders are a darker shade of the same hue, never black.
- Variants: icon-left (check, arrow, 8px dot), gradient solid (rare), circle count badge (equal width/height, min 20px, centered digits), "NEW" uppercase tracked accent pill in nav.
- Choose solid only for a single loud signal (unread count); tint for statuses in lists/tables.

## Alerts and banners

| Variant | Treatment |
|---|---|
| Tinted + left accent (default) | hue-100 bg, 4px hue-500 left border, icon in hue-500, title bold hue-900, body hue-900 |
| Tinted + thick border | hue-100 bg, 2px hue-200 border (thicker bottom), icon left |
| Top accent card | white card, 4px top border, icon in a soft hue-100 circle |
| Solid | the hue's lightest shade that passes 4.5:1 with white (usually 600–700) bg, white title, same-hue light-tint body text (measured), white icon |
| Title bar | colored header strip with title, white body |
| Full-width banner | edge-to-edge, no radius, 1px top/bottom borders, tinted |
| Single line | compact bar, one line, soft or dark fill |

Use the semantic ramp's darkest shades for text and lightest for bg. Include an icon (two-tone glyphs from `../assets/icons/` colored with the hue's 500/700). Links inside: underlined, bold, hue-900. Pitfall: flooding a whole page section with saturated red; reserve solid alerts for blocking errors.

## Modals and confirmations

- Overlay: dark shim `hsla(0,0%,0%,.5)` (or a white wash at .7 for light, calm UIs). Modal: white, `--radius-lg`, `--shadow-5`, width 512px (small), 640px (medium) or 768px (large), padding 24px.
- Header: title 18–20px `--weight-bold`, close "×" icon in neutral-500 top-right (meaningful icons need 3:1). Optional icon in a tinted circle left of or above the title (danger-100 circle + danger-600 "!" for destructive).
- Footer: neutral-050 band, 16px 24px padding, actions right-aligned with primary outermost (right); secondary outlined or plain text. Alternatives: left-aligned (primary first), full-width split 50/50 flush to edges, full-width stacked with primary on top (mobile).
- Destructive confirmation: title names the action ("Deactivate account"), body states the consequence, primary = solid red with the verb ("Deactivate"), cancel = plain text. Optional 4px red top border.
- Keep alignment consistent across the whole product.

## Empty states

- Replace "No contacts found." with: illustration or 48–64px icon in a soft brand-tint circle, one-line benefit-oriented message, one primary button ("+ Add contact").
- Hide tabs, filters, search and duplicate header CTAs that do nothing with zero data.
- First-run screens can be larger and left-aligned: heading 24px, description, one CTA, a very low-contrast decorative illustration bleeding off an edge.

## Activity feeds

- Rows: 32–40px avatar, actor bold + action text, timestamp 14px `--text-tertiary` below or right-aligned; card with dividers or spacing.
- Timeline: avatars or 8px dots on a 2px neutral-200 vertical line; alternating sides only for marketing/history pages.
- Action rows (like/comment/share): icon→count 4–8px, group→group 24–32px.

## Testimonials

- Quote in a contrasting voice: serif italic 18–20px, `--leading-normal`, `--text-primary`.
- Decorative quote glyph: 3–4× text size (72px `--text-7xl` over 18–20px quotes), pale tint (primary-200 or neutral-300), hanging in the left margin or centered above; remove the inline quote marks.
- Attribution stacked: 40–48px avatar, name bold in primary-700, role 14px `--text-tertiary`; no em dash.
- Layouts: left-aligned or centered carousel with dot pagination (active dark, others neutral-300) or arrow buttons hanging half off the card (`margin: 0 -24px`); horizontal card with a tinted avatar panel; cards with the avatar straddling a tinted bottom band. On colored bands, secondary text is a same-hue light tint, never grey.

## Heroes and marketing sections

- Hero variants: text left + image right (default), mirrored, centered over a cover image (needs overlay `hsla(0,0%,0%,.55)` or colorized/low-contrast image — see [imagery.md](imagery.md)), centered with image below cropped by the fold, image above, embedded sign-in form card, embedded newsletter input group.
- CTA pair: solid primary + outlined/ghost secondary, primary first; or single large CTA. Header CTA on cover images: outlined white.
- Overlap the hero edge with a search/form card (`margin-bottom: -64px`) for layering.
- Sections: alternate white / neutral-050 / one dark or brand band to separate sections without borders. Feature blocks: 48px tint circle with a 24px icon → title 18px bold → body 16px `--text-secondary` → text link. Layouts: single feature + image, 2/3-up icon columns, 3×2 grid with icons left or stacked, cards on grey, split page with full-bleed image, long bulleted feature list in columns with one CTA.
- Constrain paragraphs to `max-width: 34em` even when sibling grids are full width. Center only short (≤3 line) blocks.

## Forms in layout: sign-in and multi-section

- Sign-in: narrow centered card (`max-width` 448–512px) on the canvas; or two-pane card (form right, benefits/testimonial/image left on a tinted pane); or full-page split (form column ~40%, image 60%). Inputs soft-filled inside white cards, white bordered directly on the canvas. Remember-me checkbox and "Forgot?" link on one row; full-width primary; sign-up prompt below in a darker strip.
- Settings/multi-section: two-column bands — left third holds section title (18px) + 14px `--text-tertiary` description, right two-thirds holds fields; 1px dividers spanning both columns between bands. Alternatives: anchor-link TOC left, each section in its own card, horizontal labels right-aligned to fields, tabbed or vertical-nav multipage.
- Form actions: 1px divider above, right-aligned, Cancel (secondary) then Save (primary, outermost). Mobile: stacked full-width, primary on top.

## Checkout and order summaries

- Emphasize one side: the emphasized panel is a raised white card (`--shadow-2`) while the other sits on the canvas. Order summary emphasized when reviewing; details form emphasized when the form is long.
- Summary anatomy: line items (48–64px thumbnail, title bold, variant `--text-tertiary`, price right-aligned) → discount input group (gapped/ghost "Apply") → Subtotal/Taxes rows grey → divider → TOTAL uppercase grey label + large bold amount, currency prefix small grey.
- Constrain cart width (640px, `--space-160`); full-width carts push labels and prices too far apart.
- Single-product checkout: card with product image or feature list + big price on a tinted pane, form + button on the other.

## Footers

- Low contrast overall: on neutral-050 or a dark band; column headings 14px bold (`--text-primary`), links 14px `--text-tertiary` (or a measured light tint on dark).
- Variants: site-map columns + about + social icons + legal row · newsletter input instead of about · logo/about left + columns right · centered columns + social + legal · top row logo + newsletter, columns below · compact single row · minimal legal + small link grid.
- Legal row separated by a 1px divider: copyright left, legal links right. Optional low-contrast pattern along the bottom edge.

## App layout shells

Sidebar full-height with top bar to its right (app-first) or top bar full-width with sidebar below (brand-first); constrained centered content column for settings/reading; 3-pane list-detail (mail pattern) with the active list item white on a grey list; card grids on the canvas. Fixed-width nav, fluid content, `max-width` on reading columns.

## Gaps to design yourself

The catalogue above rarely specifies these; apply these defaults consistently.

- **Hover**: buttons one shade darker (`--action` → `--action-hover`) or one elevation step up; secondary neutral-050 fill; rows/menu items neutral-050/100; text links gain underline. Transition 150ms ease-out. Hover never adds layout shift.
- **Focus**: always visible via `:focus-visible`. `outline: 3px solid var(--focus); outline-offset: 2px;` (`--focus` = primary-500, reaching 3:1 on every surface). Always an outline, never a box-shadow. Inputs: border to primary-500 plus the ring. Ring contrast ≥3:1 against adjacent colors; on dark/colored bgs use white or a light tint ring. Never remove outlines without a replacement.
- **Active/pressed**: drop one elevation level, fill one shade darker; no scale transforms larger than 0.98.
- **Disabled**: lower contrast with hand-picked ramp colors, not opacity. On white: neutral-100 fill, neutral-400 text, neutral-200 border, no shadow, `cursor: not-allowed`. On colored bgs: a desaturated same-hue tint (e.g., primary-300 fill with primary-100 text), because opacity lets patterns/gradients show through and reads muddy. Keep text legible (~3:1) and explain why nearby when non-obvious (prefer enabling + validating).
- **Loading**: keep button width fixed, swap label for a 16px spinner + "Saving…"; skeletons are neutral-100 bars at real line heights and radii, gently pulsing.
- **Toggles/switches**: track 40 × 24px pill; off track neutral-500 (3:1 on white), on track `--action` (or success for system on/off); thumb white circle with `--shadow-1`, 2px inset; label left, switch right-aligned in settings rows; take effect immediately (use checkboxes for options saved with a form). Add an on/off icon or text if color is the only cue.
- **Toasts**: white card, `--radius-lg`, `--shadow-3`, max-width 384px, 16px padding; left icon in a semantic tint circle or 4px left accent; title 14–16px bold + optional one-line body; one text-link action ("Undo"); close ×. Bottom-right (desktop) or top-center (mobile), stack with 8px gaps, auto-dismiss 4–6s except errors.
- **Tooltips**: neutral-900 bg, white 14px text, 8px 12px padding, `--radius-sm`, 8px arrow, max-width 256px; appear on hover and focus after ~300ms; never hold essential info.
- **Progress bars**: 8px pill track neutral-200, primary fill, label + percentage above (right-aligned value, tabular numbers); semantic color only for meaning (quota near limit = yellow/red). Ratings-style bars (5★…1★) use an accent fill on a grey track with right-aligned percentages.
- **Sliders**: neutral-200 track, primary fill between handles, 20–24px white handles with `--shadow-1` (or chevron grips), value labels at ends.
- **Avatars**: circle, sizes 24/32/40/48/64/96; define edges with `box-shadow: var(--shadow-image-edge)` instead of a grey border; fallback initials on a tinted circle.

## Worked examples

1. **Brokerage dashboard**: every row had solid blue "Buy" + red "Sell"; headers title-case bold; names truncated. → Buy/Sell become small outlined secondaries, headers become uppercase tracked grey labels, ticker bold over a grey description line, gains in green with % stacked under the amount, summary in one colored panel with tinted labels and large light values.
2. **Product listing actions**: red "Delete", blue "Edit", green "Publish" all solid. → "Publish" solid primary, "Edit" grey-filled secondary, "Delete" plain text link.
3. **Account settings form**: 32px inputs stretched full width, native radios for plans, red filled "Cancel subscription", label-spacing ambiguous. → 48px inputs at content-appropriate widths in a two-column band layout, plan radios become selectable cards with 2px green selected border + check badge, cancel becomes a text link in the plan heading row, payment info in an inset well with a right-aligned outlined "Update", branded `--radius-sm` checkboxes, divider above right-aligned Cancel + Save.
4. **Invoice cards**: "Client: / Amount: / Due:" key-value rows with borders. → Labels removed; name 600 top-left, soft status pill top-right, amount 24px bold, "Due in 2 days" grey; full-width tinted "View Invoice ›" footer as the click target; borders replaced by a `--radius-lg` card with `--shadow-2` on a tinted canvas.
5. **Invoice table**: centered cells, 36px rows, row borders, 7 columns. → Text left, amounts/dates right, 64px rows (airy `--row-h`), zebra stripes, grey caps headers, invoice # stacked under client, currency under amount, avatars, soft status pills; on mobile, client + amount + severity dot + chevron.
6. **Contacts modal**: border on card, header, search band, every row and footer. → Card lifted by `--shadow-5`, search and footer separated by `--bg-subtle` fills, rows separated by 8px spacing, selected row an inset rounded tint.
7. **Status badges**: white text on bright green/amber/pink (2.25, 1.56, 3.14 contrast). → Pale tint backgrounds with dark same-hue text (9.0–12.3 contrast) that stay quiet beside the data.
8. **Nav dropdown**: narrow plain list of links. → Wide rich panel with a caret, 2-column icon + title + description grid, "NEW" badge, secondary links on a tinted bottom band.

## Checks

- One radius set is used across buttons, inputs, badges, cards, tabs and checkboxes.
- Every grey (text, border, fill) comes from one tinted ramp.
- Each view or region has exactly one solid-filled primary action; other actions are outlined, soft or text.
- Destructive actions are solid red only inside confirmation dialogs.
- Button padding matches the sanctioned per-size table (not proportional), and buttons match adjacent input height.
- Primary-form inputs are ≥48px tall with 16px text, and field widths reflect expected content length.
- Gap between an input and the next label is at least double the label-to-input gap.
- Inactive nav items/tabs are visibly lighter than the active one, which carries a single clear indicator.
- Status badges use a `-100` tint background with `-900` same-hue text.
- Table numeric columns are right-aligned and headers use the small uppercase grey label style.
- Tables use zebra stripes, horizontal rules or spacing — never a full grid — and row height equals `--row-h`.
- Alerts pair a tinted background with an icon and an accent border or dark same-hue text.
- Modals are 512/640/768px wide, sit on a shim with `--shadow-5`, and have a separated footer action zone.
- Every interactive element shows a visible focus ring (`--focus`, 3px, offset 2px); disabled states use ramp colors, not opacity, on colored backgrounds.
- Empty states have an icon/illustration, a one-line message and one primary action, with useless filters hidden.
