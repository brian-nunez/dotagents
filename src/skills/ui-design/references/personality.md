# Personality

How to pick a design personality and translate it into concrete, consistent styling decisions. Consult while writing the design brief and again when a mockup "feels off" without an obvious hierarchy or spacing cause.

## Personality is a set of levers, not a mood board

A personality ("secure and professional", "fun and playful") is produced by a handful of concrete choices. Decide each lever explicitly and record it in the brief.

| Lever | What it controls | Range |
|---|---|---|
| Typeface category | First impression of voice | Serif ↔ neutral sans ↔ rounded sans ↔ geometric display |
| Headline weight | Voice of display text | Light (refined) ↔ Black (loud, tough) |
| Color mood | Emotional temperature | Blue (safe) · gold/black (expensive) · pink/orange (fun) · dark navy/slate (official) |
| Border radius | Formality | Sharp 0 (formal) ↔ Subtle 4px (neutral) ↔ Soft 8px ↔ Round 12px + pill buttons (playful) |
| Copy tone | Relationship with user | Impersonal, full sentences ↔ casual, first-name, contractions |
| Density | Seriousness of task vs. calm | Compact data-dense ↔ generous breathing room |
| Depth style | Tactility | Flat, border-separated ↔ soft shadows, raised/pill controls |
| Imagery | Character carrier | Muted photography, duotone ↔ flat illustration, colorful shapes |
| Uppercase + tracking | Institutional feel | Tracked caps labels/buttons (formal, premium) ↔ sentence case (friendly) |

- Pick the levers so they all point the same way. One playful lever in a formal design reads as a mistake, not as charm.
- When the typeface is neutral, let color and imagery carry the personality. A neutral sans with a strong duotone photo and a yellow CTA still has a clear voice.
- Typeface selection details and pairings live in [typography](typography.md) and [font-pairings](font-pairings.md). Color ramps live in [color](color.md) and [palettes](palettes.md). Radius and shadow scales live in [tokens](tokens.md).

## Lever-by-personality table

| Lever | Formal / serious | Friendly / playful | Premium / elegant | Technical / neutral | Energetic / bold |
|---|---|---|---|---|---|
| Typeface | Sturdy serif headline (FF Meta Serif, Adelle) or corporate grotesque (Aktiv Grotesk); sans body | Rounded or semi-rounded sans (Proxima Soft, Lato, Camphor, Nunito) | Old-style or high-contrast serif (Freight Text, EB Garamond, Cormorant Garamond) or thin geometric sans (Avenir Next) | Screen-tuned neutral sans with tall x-height (Inter, Roboto, Benton Sans, Interstate) | Heavy geometric/grotesque display (Futura Bold, Neue Plak Extra Black, Graphik Black) + neutral body |
| Headline weight | Regular–Semibold | Bold | Light (300) at ≥36px | Medium–Semibold | Extra Bold–Black |
| Color mood | Dark navy, deep teal, slate; muted accent | Bright pink, teal, sky blue, warm yellow; pastel backgrounds | Black/white, gold/tan, deep green; very few hues | Blue or indigo primary, cool blue-grey neutrals | Saturated orange, red, electric violet; high-contrast pairs |
| Radius set | Sharp (or Subtle) | Round (24px cards, pill buttons) or Soft | Sharp or Subtle | Subtle | Soft, or Round if pills are used everywhere |
| Copy tone | "Thank you, Ms. Okafor. Please provide…" | "Sweet, thanks Priya! Where can we send…" | Short, understated, no exclamation marks | Precise, terse, literal labels | Imperative, short, punchy verbs |
| Density | Medium; orderly grids | Generous | Very generous; large empty areas | Compact to medium; tables and panels | Generous hero, compact supporting rows |
| Depth | Flat, hairline dividers | Soft diffuse shadows, raised pill controls, overlapping shapes | Flat or one very soft shadow | Light borders, small shadows (levels 1–2) | Strong shadows or none; bold color blocks instead |
| Imagery | Muted photography fading into white | Flat illustrations, avatars in colored circles, dashed connectors | Black-and-white photography, thin line icons | Product screenshots, simple two-tone icons | Big photos with color overlays, angled shapes |
| Caps & tracking | Tracked uppercase buttons ("LEARN MORE") | Sentence case | Tracked uppercase small labels (0.05em+) | Uppercase only for table headers/labels | Uppercase short CTAs |

Use the table as a starting point and adjust one or two levers to differentiate from competitors (see below).

## Lever details

### Typeface category

- Serif: elegant, classic, trustworthy, literary. Use for headlines on marketing pages or for long-form reading. Keep application UI text in a sans.
- Rounded sans: playful, soft, approachable. Pairs naturally with pill buttons and illustrations.
- Neutral sans: plain; hands the personality to color and imagery. Default for tools and dashboards.
- Geometric or heavy display sans: modern, fashionable, loud. Use for short headlines only; pair with a neutral body face.
- Prefer families with 5+ weights (ideally 8+) and a tall x-height for UI text. A system font stack reads as neutral and slightly generic; choose a deliberate webfont when personality matters.

### Color mood

| Hue family | Reads as | Typical use |
|---|---|---|
| Blue | Safe, familiar, dependable | Finance, SaaS, communication tools |
| Dark navy / deep teal | Official, secure | Banking, government, identity flows |
| Indigo / violet | Modern, tech-forward | Startups, developer products |
| Green / teal | Growth, health, calm | Wellness, sustainability, money-in states |
| Gold / tan / black | Expensive, sophisticated | Luxury, hospitality |
| Pink / coral | Fun, not too serious | Consumer, lifestyle, tours |
| Orange / red | Energy, urgency | Fitness, food, events |

- Judge colors by how they feel in the actual mockup, not by psychology charts alone. Use the table to explain a choice, not to make it.
- Personality decides the primary hue; the full shade ramps and neutrals come from [color](color.md) and [palettes](palettes.md).
- Tint the neutrals toward the primary (cool blue-grey for blue brands, warm grey for gold/orange brands) so the whole page shares a temperature.

### Copy tone

| Moment | Formal | Neutral | Casual |
|---|---|---|---|
| Button | "Continue" | "Continue" | "Let's go" |
| Confirmation | "Your changes have been saved." | "Changes saved" | "Done! All saved." |
| Error | "The email address entered is invalid." | "Enter a valid email address" | "Hmm, that email doesn't look right." |
| Empty state | "No records are available." | "No invoices yet" | "Nothing here yet. Create your first invoice!" |
| Greeting | "Welcome, Ms. Okafor." | "Welcome back" | "Hey Priya, good to see you!" |

- Words appear on every screen; they shift personality as much as color or type.
- Write real copy in mockups. Placeholder lorem hides tone mismatches.

### Density and depth

- Density: formal and technical products tolerate compact layouts; premium and playful products need generous space. Details in [layout-spacing](layout-spacing.md).
- Depth: flat with hairline dividers reads sober and precise; soft shadows, raised pills, and overlapping shapes read tactile and friendly; strong color blocks with no shadow read bold. Shadow scale in [depth](depth.md).

## Encode the personality as tokens

Write the chosen lever values as custom properties at the top of the mockup so every component inherits them.

```css
/* Technical / neutral — Subtle radius set */
:root { --font-sans: "Inter", system-ui, sans-serif;
        --radius-sm: 2px; --radius: 4px; --radius-lg: 8px; --radius-button: 4px;
        --weight-bold: 600; --weight-display: 600; }

/* Friendly / playful — Round radius set */
:root { --font-sans: "Nunito", system-ui, sans-serif;
        --radius-sm: 8px; --radius: 12px; --radius-lg: 24px; --radius-button: 9999px;
        --weight-bold: 700; --weight-display: 800; }

/* Formal / serious — Sharp radius set; serif headlines via --font-serif */
:root { --font-serif: "Adelle", Georgia, serif; --font-sans: "Source Sans Pro", sans-serif;
        --radius-sm: 0; --radius: 0; --radius-lg: 0; --radius-button: 0;
        --weight-bold: 600; --weight-display: 600; }

/* Premium / elegant — Subtle radius set */
:root { --font-serif: "Cormorant Garamond", Georgia, serif; --font-sans: "Avenir Next", sans-serif;
        --radius-sm: 2px; --radius: 4px; --radius-lg: 8px; --radius-button: 4px;
        --weight-display: 300; --tracking-caps: 0.1em; }
```

- Radius sets (Sharp, Subtle, Soft, Round) and shadow levels come from [tokens](tokens.md); pick one set, copy all its values, and do not mix.

## Map product type and audience to a personality

| Product / audience | Default personality | Notes |
|---|---|---|
| Bank, insurance, government, legal | Formal / serious | Trust over delight; Sharp or Subtle radius set; dark blue or teal |
| B2B SaaS, admin tools, developer tools, dashboards | Technical / neutral | Blue/indigo primary, Subtle radius set, compact density allowed |
| Consumer social, community, education for kids, casual games | Friendly / playful | Rounded type, pill buttons, illustrations, casual copy |
| Luxury retail, hospitality, fine dining, architecture, wealth | Premium / elegant | Light headlines, gold or monochrome, generous space |
| Fitness, events, music, launches, youth marketing | Energetic / bold | Black-weight headlines, saturated color, big imagery |
| Healthcare, mental health | Friendly but calm | Soft radius set, muted teal/green, plain warm copy, generous space |
| Bookkeeping, finance for small business | Formal leaning premium | Serif headline + sans UI works well |

- Combine personalities deliberately when the audience calls for it (e.g., "technical + friendly" = neutral sans, Soft radius set, warm copy). Name the blend in the brief.

## Decide by looking at what the audience already uses

1. If the user has a clear gut feeling, take it and translate it into lever values.
2. Otherwise, list 3–5 sites or apps the target audience uses daily (not competitors). Note their typeface category, radius, color mood, and copy tone.
3. Match the overall seriousness of that set: mostly "serious business" → lean formal/technical; mostly humorous and casual → lean friendly/playful.
4. Check 1–2 direct competitors only to avoid them. Change at least two levers (e.g., hue family and radius) so the result does not read as a lesser copy.
5. Write the final lever values into the brief ([brief-template](brief-template.md)) before any high-fidelity work.

- Discovery questions for this live in [discovery](discovery.md).

## Consistency rules

- Use one radius style across the whole interface. Mixing square and rounded corners almost always looks worse than either alone.
  - Buttons, inputs, checkboxes, cards, badges, and modals all come from the same radius set in [tokens](tokens.md).
  - Scale radius with element size inside one set: e.g., Subtle = checkbox 2px (`--radius-sm`), button/input 4px (`--radius`), card 8px (`--radius-lg`). A small control with a smaller radius than its card is still "one style"; a square card holding pill buttons is not, unless pills are the declared button style everywhere.
  - Once a pill shape is adopted for one button, convert every button (primary CTA in the header included) to pills.
- Use one copy tone everywhere: headlines, buttons, empty states, errors, and confirmation dialogs.
- Change color and tone together. A casual message in a dark official panel, or a formal message on pink, sends mixed signals.
- Reuse the brand primary for small custom controls (checked checkbox fill, active step, focus ring) so the personality reaches the details.
- After swapping typefaces, retune weights and sizes. One family's Bold can look like another's Black; drop to Semibold when needed.
- Keep display weights (Thin/Light/Black) for headlines ≥ 30px. Body and UI text use `--weight-normal` 400, optional `--weight-medium` 500, and one `--weight-bold` (600 or 700) regardless of personality (see [hierarchy](hierarchy.md)).

## Applying a single lever to one component

Personality can shift inside a page for one block, as long as the shift is intentional and repeated wherever that block appears.

- Testimonials: set the quote in a serif italic (e.g., Georgia Italic 20/30) inside an otherwise sans page. Serif reads as more trustworthy; italic reads as conversational.
- Headline voice: Light weight = clean, minimal, sophisticated; Black weight = tough, exuberant. Try both before settling.
- Accent bar: a 6px brand-colored bar across the top of a text-only page adds identity without imagery (details in [finishing-touches](finishing-touches.md)).

## Pitfalls

- Choosing personality from color psychology charts alone. Use how the colors feel in context, then confirm against the audience's sites.
- Letting framework defaults decide the personality. Default 4px radius + system font + default blue reads as "unfinished", not "neutral".
- Playful radius with formal copy, or premium serif headline with cartoon icons.
- Copying the market leader's palette and type. The result looks second-rate.
- Applying the personality only to the hero. Forms, tables, toasts, and error copy must carry it too.

## Worked examples

1. **Savings product vs. peer community landing page.**
   - Formal version: light-weight large headline, small grey body, dark teal "LEARN MORE" button with a 2px radius, uppercase and tracked, lock-icon logo, soft misty photo fading to white.
   - Playful version: bold dark headline, teal-blue "SIGN UP FOR FREE" button, flat cartoon avatars in colored circles joined by dashed lines and chat bubbles, light-blue diagonal background shape, "Log in" as a text link beside an outlined "Sign up" button.
   - Same layout skeleton; every lever flipped.
2. **Identity-verification step, tone + color.**
   - Before (formal): dark blue (≈#1e4a8c) panel, vertical stepper, copy "Thank you Ms. Okafor. To confirm your identity, please provide a phone number where we can send you a verification code."
   - After (casual): white panel, pink stepper line and "Continue" button, copy "Sweet, thanks Priya! Just to make sure this is really you, where can we send you a verification code?"
   - Color and wording moved together; the component structure did not change.
3. **Radius sweep on one hero.** Small radius on a yellow "Book a Demo" button over a duotone photo reads neutral. Pill "START FREE TRIAL" with a circular arrow icon plus large-radius stat cards on a lavender circle reads playful. A square slate "Learn more" with a darker square arrow segment and a widely tracked uppercase wordmark reads like an investment firm.
4. **Luxury venue.** Thin geometric sans headline, thin line-art icon, black-and-white aerial photo, pale gold "MAKE A RESERVATION" button (uppercase, small, tracked) with a darker gold square arrow segment. Few hues, lots of space.
5. **Invoicing dashboard consistency pass.** Secondary "View all" chips become 24px-tall pills (`--radius-full`). The header "+ New Invoice" (144 × 40) is then converted to a pill as well, and the table panel adopts the cards' `--radius-lg`. One shape language end to end.
6. **Settings form details.** Custom checkboxes get `--radius-sm` (2px in the Subtle set) beside the 4px inputs and buttons, and their checked fill uses the same blue as the primary "Save Settings" button. The brand reaches the smallest control.
7. **Conference landing page voice.** Headline tried in Medium, Black, then set in Light 48/48 (`--leading-none`) to match a "clean and minimal" brief. The testimonial moves to Georgia Italic for trust and warmth; everything else stays in one neutral sans (Graphik).

## Checks

- The brief lists an explicit value for each lever: typeface category, headline weight, color mood, radius, copy tone, density, depth style.
- Every lever value points to the same personality (or a named, deliberate blend).
- `:root` sets one named radius set (Sharp, Subtle, Soft or Round) with its exact values, and every corner uses it; no square containers sit next to rounded or pill controls.
- If any button is a pill, every button in the interface is a pill.
- Copy tone is identical across headlines, buttons, helper text, errors, and dialogs.
- Weights other than 400, 500 and the project's single bold value appear only on text ≥ 30px.
- The primary brand color appears in at least one small control state (checked box, active step, focus ring).
- The design differs from the closest direct competitor in at least two levers.
- When the typeface is neutral, color or imagery visibly carries the personality.
- Framework default styling (system font + default blue + default radius) is not left unexamined anywhere in the mockup.
