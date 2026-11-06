# Palettes

Guide to the 24 bundled palettes and the 30-ramp swatch library in `../assets/palettes/`: file structure, what each palette suits, grey families, vivid ramps, role mapping, loading into CSS and building a custom palette. Consult it when picking a starting palette for a brief or when assembling one from ramps. The theory behind the ramps is in [color](color.md).

## File structure

- `palette-01.json` … `palette-24.json`, each:

```json
{
  "name": "Palette 8",
  "primary":    { "blue-vivid": { "050": "#E6F6FF", "100": "…", "…": "…", "900": "#002159" } },
  "neutrals":   { "cool-grey":  { "050": "#F5F7FA", "…": "…", "900": "#1F2933" } },
  "supporting": { "cyan-vivid": { … }, "orange-vivid": { … }, "red-vivid": { … }, "yellow-vivid": { … } }
}
```

- Every ramp has exactly 10 shades, keyed `"050"` (lightest, 92–97% L) through `"900"` (darkest, 13–30% L). Values are uppercase hex. The lightest is never white and the darkest is never black.
- `primary` has 1–2 ramps; `neutrals` has 1 ramp; `supporting` has 2–6 ramps.
- `swatches.json` is `{"name": "All ramps", "ramps": {family: shades}}`: 13 hues in regular and vivid versions (26 ramps) plus 4 grey families. Every palette ramp is copied from this library, with one exception (Palette 3's purple, below).
- Data quirks:
  - `palette-03.json` `"purple"` is a unique blue-violet ramp (`#0C008C` → `#5D55FA` → `#E6E6FF`, hue 245→240, 79–100% saturation). It is not in `swatches.json`; regular `purple` there is `#653CAD`.
  - `palette-05.json` uses `blue-grey` as both primary and neutral (a monochrome palette).
- Role meaning:
  - **Primary**: the color that defines the look. Use it for actions, links, active nav, icons, accent borders and emphasized text.
  - **Neutrals**: most text, backgrounds, borders, secondary buttons. With Blue Grey, the dark shades can also be the primary action color.
  - **Supporting**: use sparingly, for standout elements (tags, badges) and semantic states (error, warning, success).

## Swatch library

| Ramp | 900 | 500 | 050 | White text passes 4.5:1 from |
|---|---|---|---|---|
| red | `#610404` | `#BA2525` | `#FFEEEE` | 500 |
| red-vivid | `#610316` | `#E12D39` | `#FFE3E3` | 500 |
| orange | `#572508` | `#C65D21` | `#FFEFE6` | 600 |
| orange-vivid | `#841003` | `#F35627` | `#FFE8D9` | 700 |
| yellow | `#513C06` | `#E9B949` | `#FFFAEB` | 800 |
| yellow-vivid | `#8D2B0B` | `#F0B429` | `#FFFBEA` | 800 |
| lime-green | `#2B4005` | `#7BB026` | `#F2FDE0` | 700 |
| lime-green-vivid | `#1E5303` | `#6CD410` | `#F8FFED` | 800 |
| green | `#05400A` | `#3F9142` | `#E3F9E5` | 600 |
| green-vivid | `#014807` | `#18981D` | `#E3F9E5` | 600 |
| teal | `#014D40` | `#27AB83` | `#EFFCF6` | 700 |
| teal-vivid | `#004440` | `#17B897` | `#F0FCF9` | 700 |
| cyan | `#044E54` | `#2CB1BC` | `#E0FCFF` | 700 |
| cyan-vivid | `#05606E` | `#1CD4D4` | `#E1FCF8` | 800 |
| light-blue | `#0B4F71` | `#3994C1` | `#EBF8FF` | 700 |
| light-blue-vivid | `#035388` | `#2BB0ED` | `#E3F8FF` | 800 |
| blue | `#003E6B` | `#2680C2` | `#DCEEFB` | 600 |
| blue-vivid | `#002159` | `#0967D2` | `#E6F6FF` | 500 |
| indigo | `#19216C` | `#4C63B6` | `#E0E8F9` | 500 |
| indigo-vivid | `#061178` | `#2251CC` | `#D9E8FF` | 400 |
| purple | `#240754` | `#653CAD` | `#EAE2F8` | 300 |
| purple-vivid | `#44056E` | `#8719E0` | `#F2EBFE` | 400 |
| magenta | `#4E0754` | `#A23DAD` | `#F5E1F7` | 400 |
| magenta-vivid | `#6E0560` | `#E019D0` | `#FDEBFF` | 600 |
| pink | `#5C0B33` | `#C42D78` | `#FFE0F0` | 500 |
| pink-vivid | `#620042` | `#DA127D` | `#FFE3EC` | 500 |
| blue-grey | `#102A43` | `#627D98` | `#F0F4F8` | 600 |
| cool-grey | `#1F2933` | `#616E7C` | `#F5F7FA` | 500 |
| grey | `#222222` | `#7E7E7E` | `#F7F7F7` | 600 |
| warm-grey | `#27241D` | `#857F72` | `#FAF9F7` | 600 |

- The last column is the lightest shade that gives white text 4.5:1 (computed). The same shade is the lightest that passes as text on white. Ramps that pass only at 700–800 (yellow, cyan, lime, teal, light blue, orange-vivid) make light-hue buttons: use a 300–400 fill with a 900 label, and measure it (several ramps pass only at 300). Regular light-blue fails with a 900 label at 300 (4.47:1) and 400 (3.41:1): use light-blue 700 with a white label (5.56:1), or a 200 fill with a 900 label (5.79:1).
- 900 text on the 100 tint is 6.3:1 or better in every ramp, so the alert and badge pattern (`-100` bg + `-900` text) always passes.

## The 24 palettes

| # | Primary | Neutral | Supporting | Mood | Good fits | Primary action fill (`--action`) |
|---|---|---|---|---|---|---|
| 1 | cyan | blue-grey | indigo, pink, red, yellow | calm, clinical, trustworthy | health SaaS, analytics, productivity | cyan 300 + 900 label (white label from 700) |
| 2 | blue + yellow-vivid | blue-grey | cyan, red | corporate with energetic contrast | fintech, B2B, marketplaces | yellow-vivid 400 + 900 label |
| 3 | blue-violet purple + teal | blue-grey | light-blue-vivid, red-vivid, yellow-vivid | playful, modern, saturated | startup SaaS, creative tools, dev tools | teal 300 + 900 label (white label from 700) |
| 4 | teal | blue-grey | blue, purple, red, yellow | fresh, healthy | finance, health, wellness | teal 300 + 900 label (white label from 700) |
| 5 | blue-grey (monochrome) | blue-grey | light-blue-vivid, cyan, pink-vivid, red-vivid, yellow-vivid, teal | serious, utilitarian | admin panels, internal tools, dev tools, data-dense apps | blue-grey 600 + white label |
| 6 | red + yellow-vivid | warm-grey | cyan, lime-green | bold, appetizing | food, restaurants, retail, delivery | yellow-vivid 400 + 900 label |
| 7 | cyan | warm-grey | blue, red, yellow, teal | soft, friendly, approachable | consumer, community, hospitality | cyan 700 + white label |
| 8 | blue-vivid | cool-grey | cyan-vivid, orange-vivid, red-vivid, yellow-vivid | crisp, techy, enterprise | dev tools, cloud, enterprise SaaS | blue-vivid 500 + white label |
| 9 | light-blue-vivid | cool-grey | pink-vivid, red-vivid, yellow-vivid, teal | bright, airy | consumer apps, travel, social | light-blue-vivid 300 + 900 label (white label from 800) |
| 10 | indigo | cool-grey | light-blue-vivid, red-vivid, yellow-vivid, teal | deep, premium, authoritative | fintech, banking, legal, B2B | indigo 500 + white label |
| 11 | pink-vivid | cool-grey | purple-vivid, cyan-vivid, red-vivid, yellow-vivid | loud, fun | fashion, social, dating, beauty | pink-vivid 500 + white label |
| 12 | green | grey | purple, red, yellow | natural, eco, plain | sustainability, agriculture, health | green 600 + white label |
| 13 | yellow-vivid + light-blue-vivid | grey | red-vivid, teal | sunny, optimistic | kids, education | light-blue-vivid 800 + white label (or 300 + 900 label) |
| 14 | orange + lime-green | grey | light-blue, red, yellow | earthy, warm, rustic | outdoor, food, farming, travel | lime-green 400 + 900 label (white label from 700) |
| 15 | blue | blue-grey | teal-vivid, red, yellow | calm, professional | fintech, insurance, enterprise | blue 600 + white label |
| 16 | purple + red-vivid | blue-grey | teal-vivid, yellow-vivid | playful, creative, bold | startups, creative tools, events | red-vivid 500 + white label |
| 17 | magenta + orange-vivid | blue-grey | yellow-vivid, red-vivid, green-vivid | vibrant, expressive | beauty, lifestyle, fashion, music | orange-vivid 300 + 900 label (white label from 700) |
| 18 | purple | warm-grey | cyan, red-vivid, yellow, green-vivid | soft, elegant, organic | boutique, wellness, spa | purple 300 + white label |
| 19 | indigo + orange-vivid | cool-grey | magenta-vivid, red-vivid, yellow-vivid, green-vivid | confident, high-contrast | premium tech, sports, analytics | orange-vivid 700 + white label (or 300 + 900 label) |
| 20 | light-blue + green | cool-grey | purple, red, yellow | fresh, eco, healthy | health, finance, climate | green 600 + white label |
| 21 | orange-vivid | cool-grey | indigo, red, yellow, green | energetic, warm, single loud brand | food, sports, consumer | orange-vivid 700 + white label (or 300 + 900 label) |
| 22 | indigo + cyan-vivid | cool-grey | pink-vivid, red-vivid, yellow-vivid, green-vivid | electric, futuristic | dev tools, AI, crypto, gaming | cyan-vivid 400 + 900 label |
| 23 | teal-vivid | grey | yellow-vivid, red-vivid | minimal, "black and mint" | dev tools, fintech | teal-vivid 400 + 900 label (white label from 700) |
| 24 | yellow | grey | blue, orange, red, green | sunny, cheerful | education, kids, community | yellow 400 + 900 label |

- Action fills follow the rule in [tokens](tokens.md#color-roles): the lightest shade whose white label passes 4.5:1 (the swatch table's last column); light hues use a 300–400 fill with a 900 label. Either option in the column passes; pick by the brand's feel.
- Semantic gaps, where the palette has no dedicated ramp:
  - No `green`/`green-vivid` ramp: P3, P4, P23 (teal primary); P5, P7, P9, P10, P13, P15, P16 (teal or teal-vivid supporting); P6 (lime-green supporting); P14 (lime-green primary). Alias `--success-*` to that teal or lime ramp.
  - No green-family ramp at all: P1, P2, P8, P11. Add `green` or `teal` (regular or vivid to match the palette) from `swatches.json` for success.
  - Red as primary: P6 (red), P16 (red-vivid). Alias `--danger-*` to the primary ramp.
  - Yellow as primary: P2, P6, P13 (yellow-vivid), P24 (yellow). Alias `--warning-*` to it.
  - P11: red-vivid sits near the pink primary. Pair error states with an icon and text.

## Grey families

| Family | Hue | Saturation (900 / mid / 050) | 900 / 050 | Tertiary text on white from | Pair with |
|---|---|---|---|---|---|
| Blue Grey | 209–212° | 61% / 22% / 36% | `#102A43` / `#F0F4F8` | 600 | Non-vivid cool primaries (cyan, blue, teal, purple, magenta). Strongly tinted, polished look; dark shades can serve as the action color (P5). |
| Cool Grey | 209–216° | 24% / 10–12% / 33% | `#1F2933` / `#F5F7FA` | 500 | Vivid primaries (blue, light blue, pink) and indigo; its subtle tint lets the vivid color lead. It also calms hot primaries (orange in P21). |
| Warm Grey | 37–43° | 15% / 8% / 23% | `#27241D` / `#FAF9F7` | 600 | Red/yellow brands to reinforce warmth (P6). Cool primaries to make them friendlier (cyan P7) or organic and boutique (purple P18). |
| Grey | 0° | 0% | `#222222` / `#F7F7F7` | 600 | Green, yellow and orange primaries, two warm primaries (P14), and stark minimal brands (P23). A blue or warm tint would clash or muddy them. |

- Choose grey temperature for mood. Matching the primary hue (blue primary + Blue Grey) is the default; contrasting temperature (cyan + Warm Grey) is a deliberate softening.
- Tinted greys raise saturation at 050 so the page background visibly carries the temperature.

## Vivid vs regular ramps

- Regular ramps hold the hue almost fixed: blue 205°, light-blue 200°, red 360°, orange 22°, yellow 42–45°, green 122–126°, purple 261–263°, pink 330°, cyan 184–186°, lime 81–84°.
- Vivid ramps are more saturated throughout and rotate hue across the ramp. Darks move toward a deeper neighbour, lights toward a brighter one:

| Vivid ramp | Hue 900 → 050 |
|---|---|
| yellow-vivid | 15° → 49° (rust → cream) |
| orange-vivid | 6° → 24° (red-brown → peach) |
| red-vivid | 348° → 360° |
| lime-green-vivid | 100° → 83° |
| cyan-vivid | 188° → 171° |
| light-blue-vivid | 204° → 195° |
| blue-vivid | 218° → 202° |
| purple-vivid | 276° → 262° |
| magenta-vivid | 308° → 294° |
| pink-vivid | 320° → 341° |

- Indigo and teal (regular) also drift: 234° → 221° and 170° → 152°.
- Match vividness across a palette. Vivid primaries take vivid red and yellow; calm primaries take regular red and yellow. Use vivid for playful or loud brands, regular for corporate or calm ones.

## Apply a palette to a UI

Apply any palette with the same role mapping (it follows [tokens](tokens.md#color-roles)). A typical dashboard:

| Element | Shade |
|---|---|
| Page background | Neutral 050 |
| Cards, light header | White, neutral 200 border or `--shadow-2` (cards) / `--shadow-1` (header) |
| Brand accent on a light header | 4px top border (6px at page top) and logo mark in primary 400–500 |
| Dark hero | Primary 800–900 (or neutral 900), often a two-tone diagonal of two adjacent dark shades; white text |
| Light hero | Primary 050 (P15) or primary 300–400 (P7, P13) with dark primary text |
| Headings, primary text | Neutral 900 |
| Secondary text | Neutral 700 |
| Tertiary text, placeholders, meta | Neutral 600 (passes 4.5:1 on white and neutral 050 in every family) |
| Disabled text, decorative icons | Neutral 400–500 |
| Inputs, avatar placeholders | Neutral 100 fill, or white with a neutral 300 border |
| Primary CTA | Primary (or second primary) at the "white text from" shade or darker, white label; light hues use a 300–400 fill with 900 label |
| Soft / filter button | Primary 050–100 fill, primary 800 label |
| Calendar selection | Endpoints `--action`; range band primary 050–100 |
| Slider track, toggles | `--action` |
| Active tab, active nav | Primary 700 (or `--action`) |
| Main chart line | Primary 500–600, whichever reaches 3:1 on white (light hues need 700+ or a supporting hue); comparison line neutral 300 |
| Status pills | The semantic ramp (`info` may alias the primary): `-100` bg + `-900` text |
| Tags, categories | A supporting ramp, never the primary: `-100` bg + `-900` text |

- About 90% of pixels are neutral. Primary appears as splashes; supporting colors only on small badges and states.
- With two primaries, split the jobs: one is brand (hero, borders, data), the other is action (CTA, selection). Examples: P14 orange brand / lime action, P19 indigo brand / orange CTA, P22 indigo hero / cyan action, P13 yellow brand / light-blue everything interactive.
- Chart lines need 3:1 on white. Use primary 500–600 when it passes; light hues need 700+ or a supporting color (P24 draws its chart in orange because yellow is too faint).

## Load a palette into CSS

Script-free method: open the palette JSON, copy each hex into a custom property named `--{role}-{shade}`. Copy all 10 shades of every ramp, even unused ones, so later tweaks stay inside the ramp. Map semantic aliases onto the supporting ramps.

```css
/* Palette 8: blue-vivid + cool-grey */
:root {
  --primary-050: #E6F6FF; --primary-100: #BAE3FF; --primary-200: #7CC4FA;
  --primary-300: #47A3F3; --primary-400: #2186EB; --primary-500: #0967D2;
  --primary-600: #0552B5; --primary-700: #03449E; --primary-800: #01337D;
  --primary-900: #002159;

  --neutral-050: #F5F7FA; --neutral-100: #E4E7EB; --neutral-200: #CBD2D9;
  --neutral-300: #9AA5B1; --neutral-400: #7B8794; --neutral-500: #616E7C;
  --neutral-600: #52606D; --neutral-700: #3E4C59; --neutral-800: #323F4B;
  --neutral-900: #1F2933;

  --info-050: #E1FCF8; --info-100: #C1FEF6; --info-500: #1CD4D4; --info-900: #05606E;   /* cyan-vivid */
  --danger-050: #FFE3E3; --danger-100: #FFBDBD; --danger-500: #E12D39; --danger-900: #610316;   /* red-vivid */
  --warning-050: #FFFBEA; --warning-100: #FFF3C4; --warning-500: #F0B429; --warning-900: #8D2B0B; /* yellow-vivid */
  /* …copy every shade of each supporting ramp the same way */

  --action: var(--primary-500);        /* lightest blue-vivid shade with a 4.5:1 white label */
  --action-hover: var(--primary-600);
}
body   { background: var(--bg-page); color: var(--text-primary); }
.btn   { background: var(--action); color: #fff; }
.btn-soft { background: var(--primary-050); color: var(--primary-800); }
.badge-danger { background: var(--danger-100); color: var(--danger-900); }
```

- Use role names (`--primary-*`, `--neutral-*`, `--danger-*`) in components, not family names, so swapping palettes means changing only the `:root` block.
- For a second primary, add `--secondary-050 … 900` and record the new tokens in the brief.
- Optional, if `jq` is available: `jq -r '.primary | to_entries[0].value | to_entries[] | "--primary-\(.key): \(.value);"' palette-08.json`.

## Build a custom palette from swatches.json

1. **Primary.** Pick the ramp whose 500 matches the brand hue. Choose regular for calm brands, vivid for loud ones. Check the "white text from" shade; for light hues, plan dark-label buttons.
2. **Optional second primary.** Use a complementary or contrasting hue (indigo + orange, purple + red, blue + yellow, indigo + cyan) and give it the CTA job.
3. **Neutral.** Choose by temperature and vividness using the grey-family table.
4. **Semantics.** Add red, yellow and green at the primary's vividness. Skip any slot the primary already fills.
5. **Accent.** Add one hue for tags and highlights, clearly distinct from the primary and from the semantic hues.
6. **Assemble.** Write the JSON in the palette shape (or straight to CSS variables). Copy ramps whole; never mix shades from different ramps inside one role.
7. **Verify.** Render a button, soft button, alert, badge and chart line, and check the contrast targets in [accessibility](accessibility.md).
8. **Brand hex not in the library.** Keep the closest ramp and replace its 500 only if the neighbours still step evenly. Otherwise build a new ramp with the method in [color](color.md).

## Worked examples

- **Developer tool, terminal aesthetic:** P23. Grey 900 `#222222` hero with white text, teal-vivid 400 `#2DCCA7` CTA with a teal-vivid 900 `#004440` label, pale mint range tint, yellow-vivid status pills. Teal also signals success.
- **Corporate fintech:** P15. Blue 050 `#DCEEFB` header with blue 900 title, blue 600 `#186FAF` CTA with a white label, blue-grey 050 `#F0F4F8` page, teal-vivid status pills.
- **Kids' learning app:** P24. Yellow 400 `#F7D070` CTA with a dark label, yellow 100 `#FCEFC7` soft button, orange 400 `#E67635` chart line (yellow fails on white), blue status pills.
- **Food ordering:** P6. Red diagonal hero (`#BA2525` / `#A61B1B`), yellow-vivid 400 `#F7C948` CTA with a yellow-vivid 900 `#8D2B0B` label, warm-grey neutrals, cyan tags. Errors reuse the red ramp, paired with an icon.
- **Boutique wellness:** P18. Warm off-white `#FAF9F7` page and `#E8E6E1` inputs, purple 300 `#8662C7` or darker CTA with a white label, cyan slider and pills.
- **Custom: hot consumer brand with calm UI:** orange-vivid primary + cool-grey + indigo accent + red, yellow, green. This is the P21 recipe. Use indigo pills against the warm orange.

## Checks

- The palette's CSS defines all 10 shades (050–900) for each ramp in use, with values copied exactly from the JSON.
- Components reference role variables (`--primary-*`, `--neutral-*`, semantic aliases), never raw hex.
- The page background is neutral 050 and cards are white.
- Text follows the ladder: primary neutral 900, secondary neutral 700, tertiary neutral 600.
- `--action` is the ramp's "white text from" shade with a white label, or a 300–400 light-hue fill with a measured 900 label.
- Tags and categories use a supporting ramp, never the primary; status pills use semantic ramps (info may alias the primary).
- Each semantic state (error, warning, success) maps to exactly one ramp, including states covered by the primary.
- Vivid primaries are paired with vivid semantic ramps; regular primaries with regular ones.
- With two primaries, one owns the CTA and selection states, and the other owns brand surfaces.
- The main chart series is primary 500–600 reaching 3:1 on white (700+ or a supporting hue for light hues), with comparison series in neutral 300.
