# Imagery and icons

Use this reference when choosing, placing, cropping, or reviewing images and icons.
For accessible names, non-color cues, and interaction requirements, read [accessibility.md](accessibility.md).

## Establish the image's purpose

Choose imagery that explains content, establishes relevant context, or supports the intended tone.
Use text and layout alone when an image would merely occupy unused space.

For photography, assess:

- Subject relevance: whether the image supports the actual offering or task.
- Composition: whether the subject, focal point, and direction suit the available space.
- Quality: whether lighting, sharpness, and resolution hold up at the displayed size.
- Consistency: whether neighboring images have compatible treatment and visual weight.
- Authenticity: whether the image creates an accurate expectation of the product or service.

Use available real content early enough to expose layout assumptions.
Identify composition assumptions when final assets are unknown.

## Protect text over images

Inspect the full area behind the text, including both bright and dark regions.
Check the image at every crop used by the design; a desktop-safe crop can become unreadable on a narrow screen.

Choose a treatment suited to the content:

- Reposition the text into a predictable quiet area when the composition allows it.
- Add a dark or light overlay when it creates a stable text background.
- Use a local gradient when only part of the image needs adjustment.
- Reduce image contrast or apply a restrained color treatment when detail competes with the message.
- Place the text on a separate surface when image variation remains unpredictable.

Use subtle text shadows only when they improve the actual letter/background separation.
Verify the resulting contrast rather than assuming an overlay or shadow solves it.

## Respect optical size

Inspect icons and images at the size where users will see them.
A vector stays geometrically sharp when enlarged, but its detail and stroke weight can still look inappropriate.
Choose an icon variant drawn for the intended size where the existing visual system supplies one.
When only a small icon is available, a larger containing shape can add presence while preserving its optical scale.

Simplify a detailed mark for very small uses when the original loses its recognizable silhouette.
Check the simplified mark at the target size.
Match apparent weight and alignment across the icon family; equal bounding boxes can still look unequal.

## Make product screenshots readable

Decide what the screenshot needs to communicate: a specific feature, a workflow, or the overall product structure.
Crop to the relevant region when detailed controls or text carry the message.
Use a responsive capture when it preserves the intended composition with less downscaling.
Give a full interface capture enough room if its details must remain readable.

Use a clearly simplified representation when only the general structure matters.
Avoid presenting tiny interface text as though viewers are expected to read it.

## Handle unpredictable content

Design image containers for the range of user content the product accepts.
Choose a consistent aspect ratio when a list or grid needs stable geometry.
Use cropping for interchangeable photographic thumbnails when it preserves their purpose.
Use a fit-within treatment for logos, documents, diagrams, or products whose complete outline matters.

Provide a useful fallback for absent or failed images.
Test unusually wide, tall, bright, dark, transparent, and low-resolution content.
Use a subtle boundary or inner edge treatment when an image otherwise disappears into its surrounding surface.
Keep that treatment quiet enough to avoid fighting the image's own colors.

Allow focal-point adjustment when cropping can routinely remove the subject and the product supports that interaction.

## Distinguish icon meaning from decoration

Give a meaningful icon an accessible name through the control or content it represents.
Hide purely decorative icons from assistive technology when nearby text already communicates their meaning.
Prefer a visible label when a symbol is unfamiliar, ambiguous, or consequential.

Treat two-tone art as layered geometry whose colors need deliberate roles.
Choose tones that maintain the silhouette and internal distinction at the intended size.
Reduce an icon's visual weight when it competes with adjacent text; check that the icon still performs its function.

Raw SVG assets may omit accessible names and component behavior because those depend on their use.
Supply those decisions in the final interface rather than assuming the asset already provides them.

For crop behavior across widths, read [responsive-design.md](responsive-design.md).

## Review criteria

- Confirm that every prominent image contributes to the content or task.
- Check focal points and text readability across intended crops and widths.
- Inspect icons at actual size for recognizable detail, consistent weight, and alignment.
- Confirm that screenshots communicate their intended detail without requiring magnification.
- Check realistic uploaded content, missing images, and transparent backgrounds.
- Verify meaningful icon labels and decorative icon handling.

## Optional local references

If available, `/home/brian/Downloads/RefactoringUI` contains a two-tone icon collection and visual examples.
Follow the supplied asset terms when incorporating files.
The skill requires no source images, proprietary fonts, icon package, or local reference folder.
