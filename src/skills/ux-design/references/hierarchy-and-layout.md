# Hierarchy and layout

Read this when deciding what receives attention, which elements form a group, how dense the page should be, and how content uses available space.

## Allocate attention deliberately

Identify what the user should notice first, supporting information needed next, and actions that should remain discoverable. Evaluate the complete page rather than styling components independently.

Use size, weight, contrast, position, whitespace, enclosure, and repetition together. When an important element does not stand out, inspect what competes with it. Softer navigation or a quieter secondary action may solve the problem without enlarging the main content.

Keep supporting text readable. Small or faint text is not the only way to reduce emphasis. Consolidating repeated information or changing position can reduce competition without sacrificing legibility.

Separate semantic structure from visual emphasis. A page heading can be visually modest while remaining the correct heading in the document structure. A critical value can be visually strong without becoming a heading.

## Make relationships unambiguous

Use less space within a meaningful group than between groups. A label should be closer to its field than to the preceding field. A heading should associate with the content below rather than the paragraph above.

Apply this horizontally: pair related icon/text or value/unit elements, then separate the pairs. Equal spacing everywhere can erase meaning even when geometry is consistent.

Use enclosure when proximity alone cannot establish ownership, such as a distant Update button beside payment details. Choose the least distracting treatment that explains the relationship: spacing, a surface, a separator, or a border. Every group does not need a raised card.

## Give content the space it needs

Constrain reading and form widths to their content. A full-width navigation bar does not require full-width paragraphs or fields. Move explanatory copy into another column when that improves balance without stretching the task area.

Use fixed or bounded widths for elements that should remain stable, and flexible space for elements that benefit from growth. A percentage-width sidebar may become too narrow to read or waste useful space. A bounded login form should shrink when constrained, not merely because a grid breakpoint changed.

Use a grid to coordinate alignment where helpful. Let content's minimum useful dimensions determine when the grid changes. See [responsive-design.md](responsive-design.md).

## Establish spacing and sizing roles

Choose a small scale with distinguishable steps. Tighter steps are useful for small controls; larger dimensions need larger jumps to make comparison meaningful. Give commonly used spacing levels a role rather than accumulating nearly identical values.

For example, explore 4, 8, 12, 16, 24, 32, 48, and 64 as initial spacing candidates, then adapt to the existing system and actual content. These numbers are a starting vocabulary, not a requirement or complete sizing system.

Give a new composition generous space, then remove what impairs scanning or forces unnecessary scrolling. For expert data work, deliberately choose compact spacing where simultaneous visibility matters. Judge density by task and reading effort.

## Balance optical weight

An icon, large solid area, or bold numeral may attract more attention than neighboring text at the same nominal size. Quiet its contrast, change its visual mass, or adjust its relationship to the content.

A subtle separator can gain definition through more weight rather than a harsh color. Inspect at the intended display size; equal bounding boxes do not guarantee optical balance.

## Diagnose common symptoms

| Symptom | Check first | Useful intervention |
| --- | --- | --- |
| Everything appears equally important | Too many strong headings, accents, or controls | Rank content; soften competing groups |
| A form feels confusing | Similar gaps above and below labels | Tighten label-to-field relation; separate groups |
| The page looks stretched | Containers fill the viewport by default | Bound task widths; use adjacent supporting content where useful |
| Many boxes make the page noisy | Every relationship has a border and a surface | Remove redundant separators; retain boundaries explaining scope |
| A clean screen is slow to use | Too much travel or vertical space | Reconsider density around the comparison or action |
| A sidebar dominates the task | Contrast, width, or large navigation blocks | Quiet the shell and emphasize content |

## Review criteria

- A quick scan reveals primary content and the next action.
- Group membership and action scope are clear without explanation.
- Content widths suit reading, entry, and comparison needs.
- Spacing forms a coherent system and preserves relationships.
- Density is intentional; decoration and navigation do not dominate the task.
