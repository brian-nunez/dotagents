# Forms and actions

Use this reference for new form layouts, choice controls, and action flows.
Design the information, behavior, and visible states before refining surfaces.
Apply [accessibility.md](accessibility.md) to labels, controls, focus, and errors.
Use [responsive-design.md](responsive-design.md) when the arrangement changes.

## Group around the user's task

- Group fields by a meaningful decision: identity, delivery, payment, preferences.
- Give a section a title when it helps users predict its contents.
- Put shared explanations at section level; keep field-specific guidance nearby.
- Make help explain a constraint, consequence, or unfamiliar term.
- Prefer an example format over a vague instruction such as "enter correctly."

Sectioning is complete when a reader can predict where each field belongs.
If categories overlap, resolve the grouping before adding cards or separators.

## Let width and proximity carry meaning

- Give short, constrained values suitably short inputs within a usable target.
- Give variable-length content room for realistic values.
- Keep a field's label closer to its input than to the preceding field.
- Keep its help and error text inside the same perceptual group.
- On wide screens, section explanations can occupy a supporting column.
- Keep actual fields at useful widths instead of stretching them to fill space.
- On narrow screens, place explanations before their fields and preserve order.

Use visible labels for fields. Placeholder examples supplement those labels.
Check long names, translated labels, wrapped help, and multiline errors.

## Make states and recovery explicit

Specify each relevant field state and the transition into and out of it.

| State | Design decision |
| --- | --- |
| Empty | Explain expected input and any necessary constraint. |
| Focused | Show which control receives keyboard input. |
| Filled | Keep the label, value, and editing affordance understandable. |
| Invalid | Identify the problem and describe a feasible correction. |
| Unavailable | Explain the dependency when the reason is not apparent. |
| Submitting | Acknowledge progress and prevent accidental repeat submission. |
| Failed | Preserve entered values and offer an appropriate recovery action. |
| Completed | Confirm the actual outcome and show the next useful step. |

Validate at a moment that helps correction rather than interrupting entry.
Associate field errors with their controls; use a summary for errors across
multiple sections when it helps users locate and resolve them.
Distinguish failures when their recovery differs. Preserve valid input.

## Rank actions and show ownership

- Give the intended next action the strongest appropriate visual treatment.
- Keep alternate actions findable.
- Use specific verbs that describe the outcome: "Save preferences," for example.
- Place a local action near the information it changes.
- If distance makes ownership ambiguous, group the data and action together.
- A quiet inset surface can group payment details without promoting them.
- Separate whole-form actions from the last section so their scope is clear.
- Place actions consistently across related flows.
- Keep cancellation and exit paths clear, accessible, and honest.
- Explain material consequences at the decision point and offer recovery where
  the product supports it. Visual hierarchy must not obstruct the user's choice.

## Use choice cards when their information earns the space

A choice with several meaningful attributes can benefit from a selectable card.
Emphasize the differentiator and soften repetitive units or supporting labels.
Show the selected option with a visible indicator in addition to color.
Preserve the underlying radio-group or checkbox meaning and keyboard behavior.
Distinguish selection from focus: moving focus alone need not look committed.
On narrow screens, rearrange cards into rows when that improves comparison.
For plans, align prices in a column while preserving their association with
each plan, billing period, and relevant conditions.

## Worked example

An account form ends with payment details, notification preferences, and Save.
Give payment details a shared container with their Update action. Keep expiry
secondary to the identifying card information. Place a separator before the
global "Save preferences" action so it does not appear to save notifications
alone. On mobile, stack section descriptions above fields and arrange plan
options as rows with comparable prices. Retain a discoverable cancel path.

For an interactive design simulation, use local representative state to exercise
selection, invalid input, retry, and completion. Label simulated outcomes in the
review context. A confirmation animation does not prove a real save, payment,
permission change, or backend operation. Record unverified behavior as a UX
hypothesis for later implementation or research.

## Completion checks

- Every field has a clear purpose, label, group, and relevant state treatment.
- Each action's scope is apparent from its wording and placement.
- Recovery keeps valid input and tells users what they can do next.
- Choice controls remain usable through keyboard and assistive technology.
- Narrow layouts preserve task order and comparison relationships.
- Demonstrated behavior and assumed product behavior are distinguished.
