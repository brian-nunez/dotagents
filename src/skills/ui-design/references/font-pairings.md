# Font pairings

Catalog of proven typefaces and pairings by use (marketing headlines, long-form articles, application UI) with role sizes, weights, licenses and personality; consult when picking or swapping fonts for a mockup.

General type rules (scale, line-height, measure, tracking) live in [typography](typography.md). Size values come from the scale in [tokens](tokens.md). Match the face to the brief's personality ([personality](personality.md)).

## How to use this catalog

- Pick the category first (headline hero, article, app UI), then a row whose personality matches the brief.
- Start with the listed role sizes and weights, then retune after rendering (see "Retuning after a font swap" in [typography](typography.md)).
- License key: **Free** = open license (OFL / Apache 2.0), loadable from Google Fonts or self-hosted. **Commercial** = paid license (a commercial font service subscription, commercial font stores, or the type foundry).
- In HTML mockups, load free faces directly. For a commercial face, render with its free stand-in (see "Free stand-ins") and name the commercial face in the brief.

## Pairing patterns

| Pattern | Use | How | Examples |
|---|---|---|---|
| Single family, weight contrast | Any; the default | Heavy headline, Regular body, Semibold/Bold button | Proxima Nova, Graphik, Roboto, Neue Plak, Inter |
| Display sans + neutral sans | Marketing heroes | Characterful sans for the headline; workhorse sans for subtitle and button | Freight Sans + Proxima Nova; Harmonia Sans + Graphik; Futura + Trade Gothic Next |
| Serif / slab headline + neutral sans | Marketing with warmth or authority | Serif carries the voice at 48px; sans for everything else | FF Meta Serif + Myriad Pro; Jubilat + Proxima Nova; Adelle + Proxima Nova |
| Serif body + same-family sans | Long-form reading | Serif text face for body; matching sans from the superfamily for title and meta | Freight Text + Freight Sans; Merriweather + Merriweather Sans |
| Sans page + serif italic accent | One component needs a different voice | Serif italic for a testimonial or pull quote only | Graphik + Georgia Italic |

- Contrast pairs in personality and match them in proportion (similar x-height and width).
- Let one face carry character; make the partner a neutral workhorse.
- Use one family for application UI. Keep serifs out of app chrome.
- About half of strong pairings are a single family. Varying weight and size inside a well-built family is enough.

## Marketing headlines (landing hero)

Default role scale: **headline 48px / subtitle 24px / button 20px**. Weights: headline Bold or heavier, subtitle Regular, button Semibold or Bold.

| Headline | Subtitle | Button | License | Personality / best use |
|---|---|---|---|---|
| Proxima Nova Bold 48 | Proxima Nova Regular 24 | Proxima Nova Bold 20 | Commercial | Geometric with humanist softening; friendly, confident startup default. Safest all-rounder. |
| Freight Sans Bold 48 | Proxima Nova Regular 24 | Proxima Nova Bold 20 | Commercial | Calligraphic, slightly condensed humanist; warm, bookish, premium or editorial brand. |
| Futura Bold **36** | Trade Gothic Next Regular 24 | Trade Gothic Next Bold 20 | Commercial | Pure geometric, modernist, fashionable. Very wide in heavy weights, so set the headline at 36. Statements only, never body. |
| Harmonia Sans Black 48 | Graphik Regular 24 | Graphik Semibold 20 | Commercial | Geometric skeleton, humanist warmth; chunky, approachable consumer/tech marketing. |
| Graphik Black 48 | Graphik Regular 24 | Graphik Semibold **18** | Commercial | Crisp neutral neo-grotesque; contemporary, design-literate. Works for marketing and UI. |
| FF Meta Serif Bold 48 | Myriad Pro Regular 24 | Myriad Pro Semibold 20 | Commercial | Sturdy low-contrast wedge serif; authoritative without stuffiness. B2B, serious brands. |
| Roboto Black 48 | Roboto Regular 24 | Roboto Bold 20 | **Free** (Apache 2.0) | Mechanical, neutral, ubiquitous. Choose for reliability when brand voice matters less. |
| Jubilat Semibold 48 | Proxima Nova Regular 24 | Proxima Nova Bold 20 | Commercial | Friendly bulbous slab, retro-American editorial; adds warmth to neutral layouts. |
| Interstate Bold 48 | Interstate Regular 24 | Interstate **Regular** 20 | Commercial | Highway-signage DNA; squarish, technical, industrial or engineering feel. Dense Regular, so the button drops from Bold to Regular (Light is reserved for ≥30px). |
| Neue Plak Extra Black 48 | Neue Plak Regular 24 | Neue Plak Bold 20 | Commercial | Tight, very heavy geometric grotesque; loud, poster-like, high-impact heroes. |
| Adelle Extra Bold 48 | Proxima Nova Regular 24 | Proxima Nova Bold 20 | Commercial | Contemporary sturdy slab; journalistic, trustworthy. |

- Ratio headline : subtitle : button ≈ 2 : 1 : 0.83.
- The subtitle stays Regular in almost every pairing.
- Proxima Nova is the default secondary face for display headlines.
- Set the wordmark in the headline family when no logo font is given.

## Long-form articles

Default role scale: **title 48px / body 18px / meta (byline, date, read time) 16px**. Meta shares the body weight.

| Body | Title | Meta | License | Personality / best use |
|---|---|---|---|---|
| Freight Text Book 18 (serif) | Freight Sans Book 48 | Freight Sans Book 16 | Commercial | Elegant old-style serif; literary, magazine feel. |
| Source Sans Regular 18 | Source Sans **Light** 48 | Source Sans Regular 16 | **Free** (OFL) | Humanist, slightly narrow, very readable; graceful Light at large sizes. |
| Open Sans Regular 18 | Open Sans **Light** 48 | Open Sans Regular 16 | **Free** (Apache 2.0) | Open, neutral, friendly humanist; safe free default. |
| Merriweather Regular **16** (serif) | Merriweather Sans Light 48 | Merriweather Sans **14** | **Free** (OFL) | Robust screen serif, very large x-height; comfortable small, so body drops to 16. Only 4 weights: an article-only exception to the 5+ weights rule. |
| Proxima Nova Regular 18 | Freight Sans **Bold** 48 | Proxima Nova Regular 16 | Commercial | Heavy humanist title over a geometric body; punchy and warm. |
| Franklin Gothic Book 18 | Franklin Gothic **Demi** 48 | Franklin Gothic Book 16 | Commercial | Classic American newspaper grotesque; Demi titles read as headline news. |
| Camphor Regular 18 | Camphor **Light** 48 | Camphor Regular 16 | Commercial | Soft rounded-terminal humanist; calm, friendly, refined Light titles. |

- Choose the title voice: **Light 48** for an airy, editorial feel; **Bold/Demi 48** for a punchy news feel.
- Keep body at Book or Regular (Light and thinner only at ≥30px). Never Medium or heavier.
- Use a serif body only when the family has a matching sans for title and meta.
- Body 18px is the article default, one step above the 16px UI default.

## Application UI (dashboards, forms, settings)

One family for the whole interface. No serifs. Role sizes for a settings screen, on the [tokens](tokens.md) scale:

| Role | Size | Weight |
|---|---|---|
| Top nav links | 14px | Medium / Bold |
| Page header | 16px (or larger, up to 24px) | Regular |
| Tabs | 14px | Medium; active tab underlined in brand color |
| Section heading | 16px | Bold |
| Field labels | 14px (12px only as uppercase tracked labels) | Medium |
| Helper text | 14px | Regular, `--text-secondary` |
| Buttons | 14px (compact) or 16px | Medium / Bold |

Bold means the project's single `--weight-bold` (600 or 700).

| Family | License | Personality / best use |
|---|---|---|
| Inter | **Free** (OFL 1.1) | Built for screens; tall x-height, neutral, precise, tabular-friendly. Top free UI pick. |
| Roboto | **Free** (Apache 2.0) | Neutral, mechanical, familiar from Android. |
| Source Sans | **Free** (OFL) | Humanist, slightly narrow, readable; good for denser UIs. |
| Open Sans | **Free** (Apache 2.0) | Open, friendly, very legible; wide default spacing. |
| Lato | **Free** (OFL) | Semi-rounded, warm, slightly playful; bold weights stay friendly. Full 18 styles from a commercial font service, 10 on Google Fonts. |
| Proxima Nova | Commercial | Clean, versatile, very legible geometric-humanist; rounds and softens numbers and nav. |
| Graphik | Commercial | Crisp, clean, versatile neo-grotesque with many weights (Thin to Super). |
| Avenir Next | Commercial | Geometric clarity, humanist proportions; polished, premium, spacious per weight. |
| Aktiv Grotesk | Commercial | Contemporary Helvetica/Arial alternative; neutral, corporate. |
| Benton Sans | Commercial | Compact American grotesque; businesslike, good for dense data UIs. |
| Soleil | Commercial | Geometric with round bowls; clean, light, optimistic. |
| Camphor | Commercial | Soft humanist; calm, friendly. |
| Neue Plak Text | Commercial | Text cut of Neue Plak with more open spacing; modern geometric. |
| Effra | Commercial | Geometric-humanist; sturdy, friendly, slightly quirky. |

- Every UI pick shares three traits: large x-height, open apertures, many weights.

## License and family facts

| Family | Class | License | Styles (weights) |
|---|---|---|---|
| Proxima Nova | Geometric-humanist sans | Commercial | 16 (8 + italics) |
| Freight Sans / Freight Text | Humanist sans / old-style serif | Commercial | 12 (6 + italics) each |
| Futura | Geometric sans | Commercial | 12 (6 + obliques) |
| Harmonia Sans | Geometric-humanist sans | Commercial | 10 (5 + italics) |
| Graphik | Neo-grotesque | Commercial | 18 (9 + italics) |
| FF Meta Serif | Humanist serif | Commercial | 12 (6 + italics) |
| Jubilat | Slab serif | Commercial | 24 (12 + italics) |
| Interstate | Grotesque | Commercial | 16 (8 + italics) |
| Neue Plak | Geometric grotesque | Commercial | 7 (no italics) |
| Neue Plak Text | Geometric grotesque | Commercial | 10 (5 + italics) |
| Adelle | Slab serif | Commercial | 14 (7 + italics) |
| Franklin Gothic | Grotesque | Commercial | 10 (5 + italics) |
| Camphor | Humanist sans | Commercial | 10 (5 + italics) |
| Avenir Next | Geometric-humanist sans | Commercial | 16 (8 + italics) |
| Aktiv Grotesk | Neo-grotesque | Commercial | 16 (8 + italics) |
| Benton Sans | Grotesque | Commercial | 16 (8 + italics) |
| Soleil | Geometric sans | Commercial | 12 (6 + italics) |
| Effra | Geometric-humanist sans | Commercial | 10 (5 + italics) |
| Trade Gothic Next, Myriad Pro | Grotesque, humanist sans | Commercial | secondary roles only |
| Roboto | Neo-grotesque | Free, Apache 2.0 | 12 (6 + italics) |
| Open Sans | Humanist sans | Free, Apache 2.0 | 10 (5 + italics) |
| Source Sans | Humanist sans | Free, OFL | 12 (6 + italics) |
| Merriweather (+ Sans) | Screen serif (+ sans) | Free, OFL | 8 (4 + italics); article-only exception to the 5+ weights rule |
| Inter | Neo-grotesque for screens | Free, OFL 1.1 | 12+ (6 weights + italics; variable today) |
| Lato | Semi-rounded humanist | Free, OFL | 18 (9 + italics) |

## Free shortlist

Use these when the mockup must run without paid licenses. All are on Google Fonts.

| Need | Pick | Setup |
|---|---|---|
| App UI | Inter (or Roboto) | 400 / 500 / 600 or 700 (one bold per project) |
| Marketing headline | Roboto Black 48 + Roboto Regular 24 + Roboto Bold 20 | single family |
| Article, sans | Source Sans or Open Sans: Light 48 / Regular 18 / Regular 16 | single family |
| Article, serif | Merriweather Regular 16 body + Merriweather Sans Light 48 title + 14 meta | superfamily |
| Friendly UI | Lato | 400 / 700 (900 for display ≥30px) |
| Characterful serif accent | EB Garamond, Alegreya, Cormorant Garamond | 10 styles each; popular |
| Web-safe serif accent | Georgia Italic | testimonial/quote voice, no load needed |

Other popular, many-style free sans-serifs worth testing: Montserrat, Raleway, Poppins, Nunito, Fira Sans, Work Sans, Ubuntu, Titillium Web, Muli.

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
```

## Free stand-ins for commercial faces

Approximate, for rendering mockups; name the intended commercial face in the brief.

| Commercial | Free stand-in |
|---|---|
| Proxima Nova, Avenir Next | Montserrat (wider) or Nunito Sans |
| Graphik, Aktiv Grotesk | Inter |
| Freight Sans, Camphor | Source Sans |
| Freight Text, FF Meta Serif | Merriweather |
| Benton Sans, Franklin Gothic | Source Sans / Roboto Condensed for headlines |
| Futura | Jost |
| Jubilat, Adelle | Roboto Slab or Zilla Slab |

## System font stack fallback

Use as the floor when no webfont is chosen, and always as the fallback after a chosen face.

```css
:root {
  --font-sans: "Inter", -apple-system, "Segoe UI", Roboto, "Noto Sans", Ubuntu,
               Cantarell, "Helvetica Neue", sans-serif;
  --font-serif: "Merriweather", Georgia, "Times New Roman", serif;
  --font-mono: ui-monospace, "SFMono-Regular", Menlo, Consolas, monospace;
}
```

- The system stack is familiar to users but has no brand character and renders differently per OS. Replace it when the brief asks for any personality.

## Finding more fonts in a font directory

Filter recipe for a free directory (Google Fonts style):
1. Category: **Sans Serif** (for UI and most body text).
2. Sort: **Popularity**.
3. Number of styles: **10+** (strict) or **8+** (looser). Weights plus italics; many styles signal careful craft.
4. Result: from ~900 families down to ~50–60 candidates, led by Roboto, Open Sans, Lato, Montserrat, Source Sans, Raleway, Poppins, Ubuntu, Nunito, Fira Sans.

Filter recipe for a commercial font service:
1. Classification: **Sans Serif**.
2. Recommended for: **Paragraphs** (legible at small sizes).
3. Weight: **regular / middle**. Width: **normal / middle**.
4. x-height: **tall** (tall x-heights read better on screens).
5. Number of styles: **10+**.
6. Result: from ~1,600 families down to ~24 (Acumin, Fira Sans, Source Sans, Paralucent, Mr Eaves Sans and similar).

Then:
- Preview candidates with real UI copy at 14px and 16px, not a pangram at 48px.
- For a serif with personality, sort by popularity in the serif category and take from the top.
- Inspect admired sites with the browser inspector and read `font-family` on headings and body; note the fallback stack too.
- Reject: under 5 weights, condensed or short x-height faces for body, display faces at small sizes.

## Worked examples

1. **Invoicing dashboard:** system stack → Proxima Nova applied everywhere. Picked by filtering for sans-serif, paragraph use, normal width and tall x-height. Nav, headings and numbers become rounder and friendlier. Free render: Inter or Montserrat.
2. **Conference landing page:** system font → Graphik everywhere (headline Graphik Light 48/48, `--leading-none`; body Regular 18/29, `--leading-relaxed`), plus Georgia Italic 20/30 for the testimonial alone. The face was found by inspecting an admired site's `--font-family-sans-serif`. After the swap, bold meta and H2 dropped to semibold and the headline moved from Extralight to Light.
3. **Coworking hero, slab warmth:** Proxima Nova Bold 48 headline → Jubilat Semibold 48 over Proxima Nova Regular 24 subtitle and Bold 20 button. Same layout, warmer and more editorial.
4. **Modernist hero:** Futura Bold at 48 overflowed and felt heavy → Futura Bold 36 with Trade Gothic Next Regular 24 / Bold 20.
5. **Blog post, free stack:** Open Sans everywhere → Merriweather Regular 16 body with Merriweather Sans Light 48 title and 14 meta. The large x-height allows the smaller body size.
6. **Technical brand hero:** Interstate Bold / Regular / Bold read too dense → Interstate Bold 48 / Regular 24 / Regular 20.

## Checks

- Every family in the mockup has 5+ weights (exception: Merriweather, 4 weights, for article pages only).
- Application UI screens use one sans-serif family with no serif in chrome.
- Marketing heroes follow ~48 / 24 / 20 px (or 36 headline for a very wide face) with a Regular subtitle.
- Article body is 16–18px in Book or Regular; title and meta come from the same family or superfamily.
- A serif body appears only alongside its matching sans companion.
- At most two families appear on a page, plus one optional accent face for a single component.
- Every `font-family` declaration ends with a system stack and a generic family.
- Fonts used in an HTML mockup are actually loaded (link or @font-face) and render, not falling back silently.
- Any commercial face named in the brief has a free stand-in noted for the mockup.
- Body and UI faces have a tall x-height and normal width; condensed faces appear only in headlines.
