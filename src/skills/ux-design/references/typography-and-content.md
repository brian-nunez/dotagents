# Typography and content

Use this reference for text-heavy screens, content hierarchy, and interface copy.
Use [accessibility.md](accessibility.md) for contrast, focus, and text adaptation.
Use [responsive-design.md](responsive-design.md) to adapt roles across widths.

## Assign roles before choosing sizes

Define reusable roles such as page title, section label, body, value, metadata,
field label, help, and action. Several roles may share a size and differ in
weight, spacing, or contrast. Semantic heading structure remains meaningful
even when a page heading is visually modest.

- Emphasize the content that answers the user's immediate question.
- Reduce competing emphasis before increasing the primary element again.
- Keep supporting text readable as its prominence decreases.
- Use labels when they resolve ambiguity or support scanning.
- For displayed data, combine natural units with values where this is clearer:
  "3 bedrooms" can communicate more directly than a separate label and value.
- Preserve field labels and necessary context.

## Build a useful type scale

Choose a small set of sizes with distinct jobs in the actual interface.
Keep smaller increments where dense UI requires them and larger increments
where differences become negligible. A mathematical ratio can suggest
candidates; useful roles determine the final choices.

- Compare actual letterforms, numerals, punctuation, and available language sets.
- Judge a font at its intended size rather than from a large specimen alone.
- Retune size and weight after changing families; equal numbers can look unequal.
- Adapt large headings independently from body text on narrow screens.
- Test text expansion and user text settings before accepting a compact fit.

Evaluate serif, rounded, geometric, or light-weight typography for the audience.
These styles are not universal signals of trust or quality. Many weights offer
flexibility rather than proof of fitness.

## Make sustained reading easy

Constrain paragraph measure to a comfortable reading width even when adjacent
images or tables need a larger canvas. Adjust width, size, and line height
together. Long lines and small text usually need more help tracking between
lines; large headings often benefit from tighter leading.

- Keep section headings closer to the text they introduce than the prior block.
- Give separate list items more separation than wrapped lines within one item.
- Use left alignment for sustained left-to-right reading; match other scripts.
- Center short independent statements only while their wrapping remains clear.
- Inspect heading wraps for awkward fragments and unintended emphasis.
- Prefer editing vague or inflated copy over shrinking it into the available box.

## Align for recognition and comparison

Align neighboring text of different sizes by baseline when it forms one line.
Optical adjustment can refine a mathematically correct but uneven alignment.

For comparable numeric values, use consistent precision, units, and periods.
Right alignment and tabular numerals can make magnitude comparison easier.
When precision varies, check decimal alignment rather than assuming that right
edges alone solve it. Distinguish quantities from identifiers: account numbers
and postal codes follow their identification context rather than arithmetic.
Make missing, zero, estimated, and unavailable values visibly distinguishable.

## Make links and letter spacing intentional

Links inside prose need a recognizable treatment among surrounding words.
Navigation and content lists can use a quieter treatment when their structure
already signals interaction. Keep links discoverable before interaction and
provide visible keyboard focus as well as pointer feedback. Essential actions
must not depend on discovering a hover-only change.

Start with the typeface's intended spacing. Adjust a display heading if its
body-oriented spacing looks loose; consider additional tracking for short
uppercase labels. Inspect the actual font and language. Letter spacing cannot
repair a display face that is unsuitable for small interface text.

## Use content that exposes design decisions

Write meaningful representative copy for the specified product and audience.
Include varied lengths and realistic constraints so the layout reveals where
it fails. Mark illustrative names, metrics, quotes, and claims as examples in
the review context. Obtain real support before presenting factual marketing
claims, customer endorsements, or testimonials as authentic.

Use action labels that describe results, status text that explains outcomes,
and errors that help recovery. Preserve the user's terminology unless a clearer
term is justified. Remove repetition that adds no information.

## Worked example

A conference page contains a title, date, venue, description, audience list,
testimonial, and email signup. Keep date and venue with the title. Constrain
description width, distinguish audience items with spacing, and give the quote
a separate voice without overwhelming the main message. Make signup the clear
action. On mobile, reduce headline prominence independently and stack signup
controls when needed. Use an explicitly illustrative quote until approved real
testimony is supplied; its visual treatment does not establish authenticity.

## Completion checks

- Text roles and heading structure communicate a coherent reading order.
- Body copy remains readable at representative widths and text settings.
- Related values use comparable formats, precision, units, and alignment.
- Links and actions remain discoverable through pointer and keyboard use.
- Realistic copy exposes wrapping limits; illustrative claims stay identifiable.
