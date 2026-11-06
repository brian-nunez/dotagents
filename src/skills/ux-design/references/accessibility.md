# Accessibility in the design

Read this for every design before finalizing visual and interaction choices. Treat these checks as part of the experience. They are not a complete conformance audit.

## Preserve meaning across perception and input

Use actual headings, lists, links, buttons, labels, and table structures in interactive HTML. Match the visual and semantic relationship. A heading's semantic level does not require a large visual size.

Choose native HTML controls when they provide the needed behavior. If using a custom widget, implement its expected semantics, state, keyboard behavior, and focus management; a role attribute alone does not provide those behaviors. For an unfamiliar pattern, consult the relevant [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/practices/read-me-first/) before representing it as functional.

For design-tool outputs, annotate essential semantics and keyboard/focus behavior that static frames cannot demonstrate. Keep that annotation separate from a claim of tested accessibility.

## Contrast and color

Use the [WCAG 2.2 quick reference](https://www.w3.org/WAI/WCAG22/quickref/) and specific criterion guidance to verify thresholds and exceptions when needed:

- Normal text needs at least **4.5:1** contrast against its background at Level AA.
- Large text can use **3:1**. Large means at least **18pt (24 CSS px)**, or **14pt bold (approximately 18.67 CSS px)**. Ordinary 18px text is not automatically large.
- Visual information needed to identify relevant controls and states generally needs **3:1** against adjacent colors, subject to the non-text contrast criterion's scope and exceptions.

Measure actual foreground/background pairs, including supporting text, placeholders, states, image overlays, and gradients. Do not infer conformance from token names or judge contrast only by eye. If measurement is unavailable, mark it unverified and choose conservative combinations.

Use text, a recognizable symbol, pattern, or another meaningful distinction alongside color. Identical red and yellow dots are insufficient to communicate distinct statuses on their own. A selected option should remain identifiable without seeing its accent hue.

For photos behind text, inspect the worst relevant crop and responsive position, not just one attractive desktop frame. Use overlays or a separate text surface where needed. See [imagery-and-icons.md](imagery-and-icons.md).

## Keyboard, focus, and controls

Keep all implemented primary interactions operable with a keyboard. Use a logical focus order matching the flow, a visible focus indicator, and focus that is not hidden by sticky content or overlays. Preserve focus cues when styling controls.

For dialogs and transient overlays, define entry focus, contained interaction when appropriate, dismissal, and return focus. Keep cancellation discoverable. Avoid implementing a custom interaction whose keyboard model cannot be reasonably demonstrated in the prototype.

Provide a non-drag alternative for relevant drag interactions. Avoid hover-only discovery of essential actions or instructions; account for keyboard focus and touch. Give icon-only controls an accessible name that describes the action.

Design comfortably sized targets with separation. WCAG 2.2 Level AA's target-size criterion uses **24 by 24 CSS px**, with specified exceptions and a spacing alternative. This is a minimum criterion, not a universal ideal control size; consult its details when target sizing is tight.

## Forms and feedback

Keep labels available after entry; placeholder-only fields lose context. Associate help text and errors with their controls. Group related choices and explain required formats where necessary. Use plain instructions that help someone correct the specific problem.

Preserve entered work after a simulated validation failure. Make success, error, loading, and selection feedback understandable without relying exclusively on color or animation. In HTML, expose relevant updates to assistive technology when the user would otherwise miss them.

Use the [WAI Forms Tutorial](https://www.w3.org/WAI/tutorials/forms/) for labeling, grouping, instructions, notifications, and validation patterns. Continue with [forms-and-actions.md](forms-and-actions.md) for the design's grouping and action scope.

## Reflow, text, and motion

Check zoom, increased text size, and longer content. Avoid clipping important text or locking a control's height so tightly that it cannot accommodate wrapping. Check narrow layouts and intermediate widths; preserve access to meaningful table content even where two-dimensional scrolling is necessary.

Honor reduced-motion preferences in animated HTML. Use motion to explain a change, not as the only indication that something happened. Avoid unnecessary autoplay, flashing, and effects that obstruct reading or task completion.

## Evidence to report

State which checks were actually performed: measured contrast, keyboard walkthrough, visible focus, viewport/zoom inspection, semantic inspection, or static annotation. Report limitations precisely. A polished screenshot, an automated scan, or a sensible component choice does not alone establish full accessibility.
