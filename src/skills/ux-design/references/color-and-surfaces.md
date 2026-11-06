# Color and surfaces

Use this reference when choosing a palette, diagnosing visual competition, or defining surface depth.
For contrast requirements and non-color cues, read [accessibility.md](accessibility.md).

## Assign color a job

Define the roles needed by the actual interface before expanding its palette:

- Canvas and surfaces: distinguish the page, contained content, and temporary layers.
- Text: distinguish primary content from supporting information without losing legibility.
- Boundaries: identify inputs, groups, and separators where spacing alone is insufficient.
- Actions: distinguish primary, secondary, selected, hovered, pressed, and disabled states.
- Status: support success, warning, error, and informational meanings.
- Categories: distinguish peer series or groups without implying status or priority.

Choose a restrained neutral foundation and sufficient accents. Keep status meanings consistent across screens.

For each family, choose useful light, middle, and dark anchors in real components.
Test the light anchor as a tinted background, the middle anchor as an accent, and the dark anchor as text.
Fill the remaining gaps with visibly distinguishable shades rather than arbitrary increments.

## Judge shades in context

Inspect colors at their intended area, adjacency, and text size.
A saturated swatch may be attractive while becoming distracting across a large panel.
A subtle border may disappear when placed beside an uploaded image or another tinted surface.

Use color models and generated ramps to propose candidates; tune the candidates visually and measure contrast.
Equal numerical changes do not guarantee equal perceived differences between hues.
Adjust saturation or hue as needed to preserve the intended character of light and dark shades.

Select neutral temperature deliberately:

- Use a slight cool tint when it supports the product's palette and tone.
- Use warm neutrals when they fit the content, photography, or desired atmosphere.
- Keep neutral temperature consistent unless a contrasting region has a clear purpose.

Evaluate each theme on its own surfaces; changing a background changes the apparent relationships.

## Preserve hierarchy on colored surfaces

Choose supporting text relative to its background.
On a colored panel, a compatible tint can feel more coherent than an unrelated grey.
Measure the actual foreground/background pair after reducing emphasis.
Use weight, grouping, or placement when further contrast reduction would impair reading.

For a secondary status badge, try dark colored text on a pale tint.
This can preserve the status cue while keeping the primary page action more prominent.
Use a stronger fill when the status itself requires immediate attention.
Pair status color with explicit wording or another independently interpretable cue.

## Make surface depth explain structure

Assign depth according to the relationship between elements:

- Keep ordinary page content near the base surface.
- Give menus enough separation to read as temporary content above that surface.
- Give dialogs clear foreground separation while preserving an understandable background context.
- Use a lifted treatment during dragging when it explains which item is being moved.

Choose a small set of elevations and apply them consistently.
Where shadows are useful, combine a soft spread with a tighter contact shadow only if both improve separation.
Reduce the contact shadow's prominence as the apparent elevation increases.
A restrained top highlight and lower shadow can suggest a raised control; inset treatments reverse that relationship.

Use overlap to clarify layering or connect neighboring regions.
Preserve readable edges, comfortable spacing, and unclipped content at narrow widths.
Use tonal surfaces or spacing when shadows add noise.

Choose borders when they make the interface easier to interpret.
Inputs, dense data, adjacent similar surfaces, and selected regions can benefit from explicit boundaries.
Remove a border when existing spacing or surface contrast already supplies the same separation.

## Diagnose before adding decoration

| Symptom | Inspect and adjust |
| --- | --- |
| Every section demands attention | Reduce large accent fills and strengthen the intended priority. |
| Supporting text looks disabled | Recheck its color against the actual surface; use another hierarchy cue. |
| Badges dominate a table | Try a pale tint, readable dark text, and quieter surrounding boundaries. |
| Surfaces look muddy | Check neutral temperature, overlapping tints, and unnecessary shadow layers. |
| A panel appears detached | Reconsider elevation, overlap, and spacing relative to its parent context. |

## Review criteria

- Confirm that each recurring color has a defined role and consistent meaning.
- Confirm that the principal action remains identifiable among status and category colors.
- Check text, control boundaries, selection, and focus on the surfaces where they actually appear.
- Check that information remains understandable without distinguishing hues.
- Verify that surface depth matches stacking and interaction behavior.

For density-specific boundaries, read [data-heavy-interfaces.md](data-heavy-interfaces.md).

## Optional local references

If available, `/home/brian/Downloads/RefactoringUI` contains editable palette references and examples.
Use them for comparison; the skill remains usable without that folder or its assets.
The supplied `.json` palette files contain comments and trailing commas, so strict JSON import requires conversion.
Preserve palette scope when reusing names: local `grey` or `purple` aliases can differ from global swatch definitions.
