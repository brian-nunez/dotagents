# UX Patterns and Page Archetypes

Process rules plus playbooks for forms/settings, dashboards/data UIs, content/marketing pages, navigation, responsive adaptation and UX copy; consult when choosing a layout for a screen type, planning a design cycle, or critiquing a mockup against its archetype.

Values cited below come from the canonical scales in [tokens.md](tokens.md). Color mechanics live in [color.md](color.md), elevation in [depth.md](depth.md), component recipes in [components.md](components.md), contrast rules in [accessibility.md](accessibility.md).

## Design process principles

- **Start with a feature, not the shell.** Design the primary feature first (e.g. "search for a flight": from, to, depart, return, search button). The grayscale directions explore structurally different layouts *of that feature*, not of the app chrome. Decide nav, sidebar, container width and logo placement only after 2–3 features exist; until then you lack the information to choose.
  - Before: three directions that differ only in the shell (top nav + filter sidebar, left sidebar + table, hero + card grid) wrapped around grey placeholder bars.
  - After: three directions of the search itself (single centered card; split form + live results; inline one-row bar) with real fields. The chosen one is a white card on a light blue-grey page — heading, two full-width city fields, depart/return side by side, full-width dark "Search Flights" button. No nav, no logo. It can ship as the whole page.
- **Detail comes later.** In the first pass, ignore typefaces, shadows, icons. Sketch layout at block level; treat sketches and wireframes as disposable.
- **Grayscale first.** Build hierarchy with spacing, contrast and size only. Add color last, and only where grey accents already marked primary elements (button, selected border, check badge, toggle). Layout, size and spacing must not change when color arrives.
- **Design the smallest useful version (be a pessimist).** Omit features outside the brief's current scope. The minimal version must look complete on its own.
  - Before: comment box with an attachment drop zone inside the textarea.
  - After: avatar + textarea + "Some HTML is OK." hint + "Post Comment" button. Nothing looks missing; attachments become a later cycle.
- **Make it real early, in cycles.** Render each simple version as an HTML mockup with real content and edge cases → screenshot it → fix what the rendered version reveals → next feature or state. Do not try to resolve every interaction in the abstract. Production code is out of scope; the mockup is where the design becomes real.
- **Design real edge cases in every cycle.** For each screen, render at least:

| Case | What to render |
|---|---|
| Long content | 40+ char names, 3-line titles, long emails; truncate or wrap deliberately |
| Volume | 0, 1, 7 and 2000 items; pagination/virtual scroll; counts like "2,000 contacts" |
| Collisions | Two events in the same calendar slot; duplicate names |
| Errors | Inline field error position and copy; failed save; offline |
| Empty | First-use state with illustration + one CTA; hide tabs/filters/search |
| Loading | Skeletons matching final layout; no layout shift on load |
| Permissions | Read-only and disabled states with a reason |

- **Use realistic content.** Write plausible names, amounts, dates and copy in the domain's voice. No lorem ipsum: real text exposes wrapping, line length and label problems. Also design with *imperfect* data — an ideal-data mock hides the empty state users actually see first.

## Action hierarchy per screen

- Give each screen **one primary action**; a few secondary; any number of tertiary.

| Level | Treatment | Example |
|---|---|---|
| Primary | Solid, high-contrast fill | Filled brand button "Save Settings" |
| Secondary | Outline, or low-contrast tinted fill | White button, 1px light border, dark text |
| Tertiary | Styled as a link | "Cancel subscription" text link |

- Rank by importance, not semantics. A destructive action that is not the screen's goal gets secondary/tertiary styling (e.g. tertiary = plain grey text, secondary = white button with red text). Put the big red treatment on the confirmation step, where destruction *is* the primary action.
- On colored/dark backgrounds: primary = white solid button with brand-colored text; secondary = outline or translucent fill; tertiary = plain white text.
- Repeated per-row actions (Buy/Sell on every table row) are secondary at most: small outline buttons, never solid fills.
- Before: listing card with red "Delete Listing", blue "Edit", green "Publish", all solid. After: "Delete Listing" as a text link, "Edit" pale grey-blue fill with dark text, "Publish" the only solid button.
- Pitfall: two solid buttons of equal weight side by side. Demote one.

## Forms and settings pages

- **Group fields into titled sections** (e.g. Basics, Profile, Billing, Notifications). Space between groups must exceed space within a group.
- **Two-column settings layout on desktop:** left ~1/3 column holds the section title (18px) and helper text (14px, secondary grey); right ~2/3 holds fields. Run a 1px divider across *both* columns between sections so title ownership is unambiguous.
- **Input width signals expected length.** Size fields to their content (postal code narrow, email medium, bio full). Do not stretch every input to the column; fill leftover width with the label/helper column instead.
- **48px input height** with 16px text and 12px horizontal padding. Match adjacent buttons to 48px.
- **Label spacing:** label → its input 8px; input → next label 24px (compact variant: 8px within, 16px between). Add the space *below inputs*; do not touch label-to-input spacing.
- **Off-white page behind white inputs** (`--bg-page`, a tinted `--neutral-050`) so fields read as distinct entry wells.
- **Plan/option cards instead of radio lists** when the choice matters:
  - Name: 12–14px uppercase, bold, `--tracking-caps`, `--text-tertiary`.
  - Differentiator: number 30px bold; unit bold, smaller; repeated word ("uploads") grey.
  - Price: small bold amount, lighter "/ mo".
  - Selected: 2px accent border, pale tint fill, tinted text, filled check-circle top-right.
- **Low-emphasis wells** for a value + its action (payment card + "Update"): `--bg-subtle` fill, 1px `--line` border, `--radius`, 12px padding; value left, outline button right, vertically centered. A white card would pop too much.
- **Supporting values:** identifying value at 16px dark; supporting value (expiry date) at 14px secondary grey.
- **Custom checkboxes/radios:** 20–24px, `--radius-sm` from the project's radius set, checked state filled with `--action`. Help text under each option: 14px secondary grey, indented to the label.
- **Selects:** single chevron-down icon, inset 16px from the right edge.
- **Save/Cancel placement:** a full-width divider above the workflow buttons scopes them to the whole form. Right-align with primary outermost: `[Cancel] [Save Settings]`. Either side is acceptable if it is identical across the app; pick once and record it in the brief.
- **Destructive actions:** tertiary link placed in the subsection header row (e.g. "Cancel subscription" right-aligned on the "Change Plan" heading baseline) + a confirmation dialog: title, short body, tinted footer band with plain "Cancel" and red filled "Deactivate".
- **Mobile stacking:** single column; section title + helper above fields; side-by-side fields stack; secondary buttons go full-width; workflow buttons full-width, stacked, **primary on top**.

### Worked example: account settings page

Before → after, in order:

1. Page `#FFFFFF` with white inputs → page `--bg-page`; inputs stay white and now separate from the page.
2. One unbroken stack of 14 fields → four titled sections, each with 18px title and 14px grey helper text.
3. Every input stretched across a ~540px column → 12-column grid, title+helper in left 1/3, fields in right 2/3, 1px dividers spanning both columns.
4. Inputs ~32px → 48px; text 16px; buttons in the field stack also 48px.
5. Native double-arrow select → chevron-down, 16px inset.
6. Input → next label 8px → 24px; label → own input stays 8px.
7. Dark-grey filled "Change your password" / "Change picture" / "Update" → white outline buttons, 1px light border, 16px medium text, `--radius`. Red filled "Cancel Subscription" → 14px medium link in primary-700.
8. Three radio rows ("Basic - 1 GB uploads ($5/mo)") → three plan cards, `--radius-lg`, uppercase tracked names, 30px bold numbers, green 2px selected border + tint + check badge.
9. "Cancel Subscription" moved to the right end of the "Change Plan" heading row.
10. Payment title, card number, expiry all equal → more space under the title; expiry 16→14px, black→`--text-secondary`; whole block in a `--bg-subtle` well with "Update" right-aligned.
11. Notification help text at label size → 14px grey; checkboxes enlarged, `--radius-sm`, checked fill = `--action`.
12. Save/Cancel left-aligned under the last section → divider above, right-aligned, Save (primary) outermost.
13. Neutral greys → blue-tinted greys (text `#576272`, page ~`#F3F6FA`, then mapped onto the `--neutral-*` ramp), with more saturation at the light and dark ends.
14. Mobile (400px): single stack; plan cards stack and move price to the right edge of each card (prices form one scannable column); buttons full-width, Save on top.

## Dashboards and data-heavy UIs

- **Audit what the page emphasizes.** If chrome (dark header, solid "View all" buttons) out-shouts the data, invert it: white header, data in a colored band.
- **Summary band:** merge sibling stat cards into one full-bleed band directly under the header (gap 56px → flush) so it reads as one at-a-glance unit. A subtle horizontal gradient (slightly lighter/brighter hue on the left) adds glow.
- **Stat tile layout:** label above value.
  - Label: 14px bold uppercase, `--tracking-caps`, `--leading-tight` (single line), color derived from the band hue and measured at ≥4.5:1 (see [accessibility.md](accessibility.md) — hue rotation).
  - Value: 36px, *light* weight; size carries emphasis.
  - Action: small pill (24px tall, `--radius-full`) in black at 15% opacity with white 14px bold text and a chevron in a 20px circle, also black 15%. Translucent black adapts to every point of a gradient.
- **Reshape data for users; the UI need not mirror the schema.**
  - Drop `Label:` prefixes when format or context identifies the value ($ amount, a person's name under "Recent Invoices").
  - Relative dates for deadlines: "Due in 2 days", "Due yesterday", "16 days ago". Familiar absolute dates for history: "Aug. 10, 2018".
  - Drop needless decimals: "$3,400.00" → "$3,400"; keep the format consistent across tiles.
  - Merge non-sortable secondary columns into two-line cells: primary 16px dark over secondary 14px grey (invoice # under client; currency under amount).
  - Add avatars (32px circles) when rows represent people or companies.
- **Make the key value the heaviest element** in each card (amount 24px medium); name 16–18px semibold; due phrase 14px grey; status pill top-right, aligned with the name.
- **Status pills with tinted backgrounds:** `--{status}-100` background + `--{status}-900` text, 12px uppercase or 14px, bold, `--radius-full`. Green = paid/approved, yellow = pending, red = overdue/declined.
- **Card click affordance:** full-width tinted footer band (48px tall, flush to card edges) with centered 14px medium "View Invoice ›".
- **Tables:**
  - Left-align text; right-align numbers and numeric dates so digits line up; header alignment matches its column.
  - Row height = `--row-h` (64px airy for overview tables, 48px comfortable, 40px compact); let alignment keep columns ordered.
  - Zebra stripes (`--bg-subtle`) instead of row borders; header row on the same tint.
  - Headers: 14px (12px in denser tables) bold uppercase, tracked, `--text-tertiary` — same recipe as stat labels.
  - Contain the table in a white panel with the same radius as cards (`--radius-lg`).
- **Fewer borders:** remove container borders; separate white cards from an off-white/tinted page by background contrast plus `--shadow-2`. Progression for lists: border → shadow → tinted band → spacing (`margin-bottom: 8px` between rows).
- **Mobile tables:** either horizontal scroll with a visible cut-off cue (clip a column mid-word at the edge), or — for overview pages — keep only identifier + key value (client name over invoice #, amount over currency) with a row chevron for drill-down.
- **Status dots on mobile:** reduce pills to small colored dots and show them only for states needing attention (pending, overdue); absence means "fine".

### Worked example: invoicing dashboard

1. Dark slate header (`~#3B5683`) + three bordered white stat cards → white header with dark nav text; stats merged into one full-bleed slate band (`~#3D5A87`) with a faint left-to-right gradient, flush under the header.
2. Stat label 18px black over value 16px → label 14px bold caps tracked; value 36px light white.
3. Label grey-white (muddy) → same-hue `#698FB5` (too low contrast) → hue-rotated pale cyan `#BBE8FC`.
4. Solid dark-blue "View all" buttons (loudest element) → 24px pills, black 15%, `--radius-full`, nested chevron circle. Header "+ New Invoice" becomes a matching 144×40 dark pill.
5. Recent cards with bordered "Client: / Amount: / Due Date: / Status:" rows → no labels; bold name, 24px medium amount, grey "Due in 2 days", status pill top-right; full-width tinted 48px footer "View Invoice ›"; `--radius-lg`.
6. Solid status pills (red `#F24141`, yellow `#BFA02C` needing darkening to muddy `#8E720B` to pass at 4.60:1) → pale tint backgrounds with dark text (e.g. `#6F2323` on pale pink).
7. Table: all cells centered, 36px rows, row borders, 7 columns → text left / numbers and dates right, 64px rows (airy `--row-h`), zebra stripes, tracked caps headers in `--text-tertiary`, 5 columns (avatar+client/#, issued, due, amount/currency, status).
8. Container borders removed; page tinted pale blue-grey (~`#E8EDF4`); cards on `--shadow-2`; all greys pushed toward blue.
9. Mobile (400px): 64px header with menu button; "View all" moved to the right of each value (stat height ~106 → ~70px); cards stack; table reduced to client + amount + severity dots + chevrons.

## Content and marketing pages

- **Line length 45–75 characters**; set paragraph `max-width` in em (20–35em). Constrain paragraphs even when sibling grids run wider (`max-width: 34em` intro over a full-width 3-column feature row).
- **Couple size and measure:** after narrowing the column, raise body size (16 → 18px) and recheck the measure (34em ≈ 620px at 18px).
- **Line-height:** article body `--leading-relaxed` 1.625 (18/29); UI body 1.5; small text 1.625; headings 24–36px 1.25; headlines ≥48px 1 (48/48); very wide measures up to 2 ([typography.md](typography.md)).
- **Heading spacing:** more above than below: 32–48px above, 12px below. Equal space makes headings float.
- **Emphasis by weight, not size:** H2 28px regular → 18px bold; CTA lead-in 22px regular → 16px semibold on one line.
- **Collapse metadata** into one line with a "•" separator, bold if it belongs to the title, tight under the headline.
- **List spacing:** items at least 1.5× their line height apart (e.g. 24px line-height → 36px bullet pitch, a 12px gap).
- **Icon bullets:** replace default bullets with filled brand-color circles + white check (or semantic icons per item), aligned to the first line.
- **Testimonial voice:** switch the quote to a serif italic (e.g. Georgia Italic 20/30) for a trustworthy, conversational voice; remove inline quotes and em dash; hang an oversized pale quote glyph (72px) in the left margin; attribution = 40px avatar + semibold 16px name in brand color stacked over a 14px grey title.
- **CTA prominence:** the page's single action gets the largest control: input 38 → 56px tall (the hero single-field height), `--radius`, real placeholder ("Enter your email address"), semibold button label.
- **Gradient to support a form:** vertical page gradient from white at the top (crisp text) to `--neutral-050` by the time it reaches the white input; replace the input border with `--shadow-2`.
- **Accent bar:** a 6px full-width brand-color bar across the top of a text-only page (also works on cards, alerts, active nav).
- **Center only short blocks** (≤2–3 lines). If one block in a centered row runs long, rewrite it shorter rather than left-aligning the whole row.
- **Mobile type ratio:** shrink headings faster than body. Desktop 48/18 (2.67×) → mobile 30/16 (≈1.9×); body stays 16px on every viewport. Stack input + button and meta items.

### Worked example: conference pre-launch page

1. ~710px column, ~110–120 chars/line → ~460px, then body 15 → 18px and column 34em (≈620px).
2. Tight line-height (~1.3) → body 18/29 (`--leading-relaxed`), headline 48/48 (`--leading-none`).
3. Size-only hierarchy (28px regular H2, 26px date/location lines) → H2 18px bold; date + venue merged into one 18px bold line with "•".
4. All text black → 3 tiers: `--text-primary` headline, `--text-secondary` body, `--text-tertiary` meta (lightest grey still ≥4.5:1).
5. Headline medium → light weight (elegant/minimal voice); after the font swap, retune bold to semibold where it reads too heavy.
6. Equal space around headings → meta tight under headline, larger gap before body, large gap above H2, small below.
7. Round bullets with item gap = line gap → teal check-circle icons, items 1.5× their line height apart.
8. Sans 20px quote wrapped in quote marks, "— Name, Title" on one line → Georgia Italic 20/30, hanging pale-teal glyph (~51×38px), avatar + teal semibold name over grey title.
9. 38px bordered input, no placeholder → 56px borderless input with `--shadow-2`, `--radius`, placeholder, larger semibold button.
10. White page → white-to-`--neutral-050` vertical gradient; greys pushed to navy (a navy-tinted neutral ramp); 6px primary-700 top bar.
11. Mobile: headline 30px on 3 lines, body 16px, meta stacked onto two lines.

## Navigation and information architecture

- Defer nav structure until a few features exist; then derive sections from real features, not guesses.
- **Active state by de-emphasizing the rest:** inactive links soft grey-blue, active keeps its color and weight; optionally a 2–3px accent underline at the nav's bottom edge sized to the label. Keep inactive links ≥4.5:1 (see [accessibility.md](accessibility.md)).
- **Page and section titles act like labels in app UIs:** a "Manage Account" h1 drops 24 → 16px so tabs and content lead. Choose the tag for semantics, style for hierarchy.
- Tabs: active = darker text + underline or grey pill; inactive = secondary grey.
- Sidebars get a **fixed width** (256px; 224px compact); the main area reflows. Do not size sidebars as a percentage.
- One full-width element (nav bar, hero band) does not oblige content to go full-width; constrain content columns.
- **Rich dropdowns:** wide panel, 2-column items with icon + bold title + one-line grey description, a "NEW" badge where relevant, secondary links on a tinted bottom band.
- **Link hierarchy:** color + underline inside prose; weight/darker color for primary in-app links; ancillary links styled only on hover.
- Hide tabs, filters and search on empty screens; show one CTA.
- Mobile: collapse complex nav behind a menu button when mobile use is mostly "check the overview"; push creation flows to desktop only if the brief confirms it.

## Responsive adaptation checklist

- Design the ~400px layout first when feasible; port to desktop and fix only what felt compromised.
- Give components a `max-width` at their optimal size; shrink only when the viewport forces it.
- Return two-column settings to one stack; title + helper above fields; liberal space plus dividers between sections.
- Stack side-by-side fields, input groups and meta lines; make secondary and workflow buttons full-width; primary on top.
- Use freed horizontal space instead of adding height: move price to the right of each stacked plan card; move "View all" beside the stat value — without breaking label-above-value.
- Measure scroll cost before the first real content; collapse nav if stacking it pushes data below the fold.
- Tables: horizontal scroll with a cut-off cue, or reduce to identifier + key value + chevron.
- Status: pill → dot, attention states only.
- Shrink large type faster than small type; recheck ratios rather than scaling em-locked values.
- Tune button padding per size instead of scaling proportionally (16px text: `12px 16px`; 14px: `8px 12px`; 12px: `6px 8px`; see [tokens.md](tokens.md#sanctioned-component-internal-values)).
- Keep every tap target ≥44px tall after stacking (see [accessibility.md](accessibility.md)).

## Copywriting for UX

- **Personality via tone.** Formal: "Thank you Ms. Okafor. To confirm your identity, please provide a phone number where we can send you a verification code." Casual: "Sweet, thanks Priya! Just to make sure this is really you, where can we send you a verification code?" Change tone together with color and radius; record the chosen voice in the brief.
- **Label-free phrasing:** merge label and value into a phrase and emphasize the number: "In stock: 12" → "**12** left in stock"; "Bedrooms: 3" → bed icon + "**3** bedrooms".
- **Emphasize the label only when users scan for it** (spec sheets: "**Depth:** 7.6 mm"); keep the value only slightly lighter.
- **Relative, computed phrasing** removes mental math: "Due in 2 days", "Yesterday".
- **Concise centered text:** centered blocks stay ≤2–3 lines; rewrite rather than wrap.
- **Empty-state copy** invites the next step: "Add a new contact and start messaging." + "+ Add contact", not "No contacts found."
- **Specific button labels:** verb + object ("Save Settings", "Create discount", "Schedule showing").
- **Helper text** under section titles explains consequence ("This information will be shown publicly…"); proofread it — typos survive into mockups.

## Worked examples

- **Brokerage dashboard:** same-weight nav, label = value summary box, solid blue Buy and red Sell on every row → active nav dark/others grey; summary in a blue panel with tiny tracked light-blue labels and large light white values; table headers tiny grey caps; ticker bold over grey description (no truncation); gain stacked over %; Buy/Sell as small outline buttons.
- **Contacts empty state:** centered grey "No contacts found." → lavender circle with person illustration, "Add a new contact and start messaging.", brand-purple "+ Add contact" button.
- **Discounts admin empty state:** header button + tabs + filter + search + small empty message with a duplicate CTA → tabs, filters, search and header button removed; larger heading "Create a discount code", grey description, one "Create discount" button, faint oversized price-tag illustration bleeding off the right edge.
- **Billing address form:** 20px between label and input and 20px below input (labels float) → 8px label→input, 24px between groups.
- **Feed action row:** 16px between icon and count and 16px between groups → 4px within, 32px between.
- **Cart page:** cart stretched across the full browser width → 640px centered column; "TOTAL" small grey caps, amount large bold.
- **Account title:** "Manage Account" at 24px light competing with tabs → 16px, reads as a label; tabs and form lead.
- **Plan selector:** four radio rows "Hobby - 1 GB ($5/mo)" … → four cards with uppercase tracked names, large "1 GB", "**$5** / mo"; selected = 2px teal border + check badge; unselected = `--shadow-2`, no border.

## Checks

- The screen has exactly one solid, high-contrast primary action.
- Destructive actions outside a confirmation dialog are styled secondary or tertiary.
- Mockup content is realistic; no lorem ipsum, and at least one long name and one error/empty state are rendered.
- Form inputs are ≥44px tall (48px default) and their widths vary with expected content length.
- Space below each input before the next label is at least 2× the label-to-input gap.
- Settings sections pair a title + helper column with a fields column on desktop and stack on mobile.
- Save/Cancel sit under a divider and follow one placement rule across all screens in the mockup.
- Stat tiles put a small de-emphasized label above a larger value; no label outranks its value.
- Table text columns are left-aligned and numeric/date columns right-aligned, headers matching.
- Status values use tinted-background pills with dark same-hue text, plus a word or icon.
- Deadlines display as relative phrases and amounts share one decimal format.
- Paragraph measures fall between 45 and 75 characters (20–35em).
- Headings have more space above than below (32–48px above, 12px below); list items sit at least 1.5× their line height apart.
- Mobile layouts stack input groups and workflow buttons with the primary on top, and headline/body ratio is smaller than on desktop while body text stays 16px.
- Empty states show one CTA and hide tabs, filters and search.
