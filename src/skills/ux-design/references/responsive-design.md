# Responsive design

Read when an interface must work across viewport sizes, zoom levels, or input methods.
Keep the user's task and information relationships intact as the arrangement changes.

## Choose changes from content

Identify what must remain visible, what can move, and what can be reached through details.
Rank information by task rather than screen width.
Validate any assumption that mobile is only for reviewing information.

Choose breakpoints where the actual composition stops working.
Look for cramped controls, broken groups, awkward wrapping, excessive empty space, and hidden comparisons.
Check intermediate widths as well as the narrowest and widest targets.

## Match sizing to the element

Use fixed or bounded widths for content with a useful intrinsic size, such as a sidebar or a short form.
Let flexible regions consume additional room when that improves the task.
Set minimums from legibility and interaction needs, and maximums from reading or comparison needs.
Shrink elements when available space requires it, rather than following arbitrary column fractions.

Examples of useful composition choices:

- Keep a readable form width while moving section explanations into a supporting column.
- Give navigation enough width for its actual labels and let the main workspace flex.
- Allow an article image to span wider than its paragraphs.
- Wrap repeated items when their useful minimum width no longer fits.

For grouping and reading measure, use [hierarchy and layout](hierarchy-and-layout.md) and [typography and content](typography-and-content.md).

## Adapt proportions deliberately

Large display headings often need to shrink more than body text.
Tune font size, line height, wrapping, and spacing together so the reading order remains clear.
Preserve comfortable body reading rather than shrinking every element to retain a desktop composition.
Tune text size and padding independently while preserving usable targets.

Allow long and translated text without clipping essential meaning.
Check increased text size and zoom without requiring users to recover hidden actions or information.
Interaction-specific checks belong in [accessibility](accessibility.md).

## Summaries and navigation

If stacked summary cards consume most of the first screen, reduce their repeated structural space.
Keep label and value grouped while moving their detail action beside them.
This shortens summaries while preserving hierarchy.

Choose navigation according to the routes users need frequently.
A collapsed menu can save space, but place essential task actions where users can still discover them.
Keep the current location and a route back evident.
Test expanded navigation, long labels, and keyboard movement.

## Forms and choices

Stack desktop section explanations above their fields when side-by-side presentation becomes cramped.
Preserve stronger separation between sections than between a field and its own label or help.
Keep actions visibly attached to their scope: a payment-method update belongs to that method, while Save applies to the form.

For plan choices, replace squeezed columns with rows when comparison improves.
A row can group plan identity and benefits on the left, with prices aligned in one column on the right.
Keep the selected state evident through more than color and retain units and billing periods.
Preserve action priority when actions stack.
Use [forms and actions](forms-and-actions.md) for behavior and action ownership.

## Tables on narrow screens

Choose an approach from the comparison the user needs, rather than from visual preference.

| Approach | Useful when | Preserve or test |
| --- | --- | --- |
| Horizontal scrolling | Users need the full cross-column comparison | Clear overflow cue, row identity, reachable actions, keyboard access |
| Prioritized columns with details | An overview can answer the immediate question | Essential identifiers, status meaning, dependable detail path |
| Stacked record summaries | Users inspect records individually | Labels for ambiguous values, manageable height, recognizable actions |
| Alternative comparison view | Selected attributes or records drive the task | Consistent values, units, and an understandable path to full data |

Horizontal scrolling needs a visible indication that more content exists.
Retain row context for offscreen values.
If columns are removed, ensure their information is still available when needed for the task.
Do not require users to open every record to perform a comparison the overview is meant to support.
For data interpretation decisions, read [data-heavy interfaces](data-heavy-interfaces.md).

## Worked example

A desktop invoice dashboard stacks into a very tall header and a clipped table on a narrow screen.
Collapse secondary navigation, place summary actions beside their values, and retain readable invoice cards.
Then choose table scrolling if users compare deadlines across invoices.
If the task is a quick status review, show identity, amount, and labeled status, with details one action away.
A smaller screen does not itself justify hiding deadlines.

## Review criteria

- Users can complete the same required tasks across the supported compositions.
- Information priority and action ownership survive rearrangement.
- Intermediate widths, long localized text, and larger text remain usable.
- Zoom preserves reading and operation without accidental clipping or overlapping controls.
- Touch and keyboard operation both expose navigation, details, and actions.
- Reading order, focus order, and visual order remain coherent.
- Tables preserve the comparisons required by the task.
- Loading, empty, error, expanded, and selected states fit each composition.
