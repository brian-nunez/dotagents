# Information and flows

Read this when organizing a page or journey, establishing navigation, or evaluating whether a redesign makes the user's task easier.

## Start with a task, not a shell

Describe a concrete scenario: trigger, information available, decision, action, and recognizable result. Design feature content and controls before assuming a top navigation, sidebar, dashboard, or card grid is needed.

For a focused page, a short task sequence is enough. For a journey, map only the steps and supporting screens required to explain it. Avoid turning a one-page request into a full product specification.

Distinguish the goal from the mechanism. "Choose the right plan" is a goal; "show three cards" is one possible presentation. Compare mechanisms when the choice is uncertain.

## Organize around questions and decisions

List what the user needs to know at each step. Group information by its use, not automatically by storage structure. Identify information that establishes identity, information for comparison, and supporting detail.

Choose navigation labels matching users' vocabulary. Keep stable destinations separate from temporary commands, filters, and selection controls. An active tab, selected row, and pressed button communicate different kinds of state.

Use progressive disclosure when secondary detail distracts from the task, while retaining a clear way to find it. Confirm that the summary supports the decision and omitted detail remains accessible when needed.

## Define action ownership

For each action, identify:

- What object or group it affects.
- Whether it takes effect immediately, opens another step, or waits for an explicit save.
- What feedback establishes success.
- What cancellation, undo, or correction means within this design.

Use proximity, alignment, enclosure, and separators to make ownership visible. A button below Notifications may appear to save only Notifications. A separator and whole-form action region can establish broader scope without increasing button size.

If domain rules are unknown, ask Brian or frame the interaction as a design hypothesis. Do not invent financial calculations, permission rules, or irreversible business behavior to make a mockup convenient.

## Choose states through the scenario

Select states that could change understanding or task completion:

| Situation | Design question |
| --- | --- |
| First use / empty | Why is this empty, and what useful next step is available? |
| Loading / waiting | What is happening, what remains usable, and how is uncertainty communicated? |
| Success / completed | What changed, and what should happen next? |
| Invalid input | What needs correction, where, and how is entered work retained? |
| No search results | Which filters or query can change, and is this different from first use? |
| Unavailable / read-only | Why is the action unavailable, and what alternative exists? |
| Failure / interruption | What was preserved, and how can the user retry or recover? |
| Many or difficult items | How do scanning, navigation, and controls work at realistic volume? |

Represent relevant states in frames, a state selector, or simulated interactions. Do not add unrelated error screens simply to complete a checklist. Record required but unrepresented states as a limitation.

An empty state should explain the situation and make the next useful action clear. Hide or quiet filters with no meaningful use yet; preserve orientation and understandable navigation.

## Evaluate the flow

Walk through the agreed scenario from the user's entry point. Check that the user can identify where they are, predict the next action, understand the result, and recover from a relevant mistake. Use plain task prompts rather than instructions revealing which control to click.

Mark assumptions that cannot be settled by inspecting the mockup. A successful internal walkthrough establishes that the simulation is coherent, not that real users will succeed.

For input-heavy experiences, continue with [forms-and-actions.md](forms-and-actions.md). For records and comparisons, use [data-heavy-interfaces.md](data-heavy-interfaces.md).
