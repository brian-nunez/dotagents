# Design review and iteration

Read this before presenting a design and when making substantive revisions. Review the artifact against the brief before asking Brian to spend attention on it.

## Review in order of consequence

1. **Task:** Can the intended user recognize the purpose, find the primary action, understand the result, and recover from a relevant mistake?
2. **Information:** Is the necessary content present, accurately framed, and grouped around user decisions? Is anything essential hidden or misleading?
3. **Interaction:** Is action scope clear? Do controls, states, feedback, and navigation behave coherently within the simulation?
4. **Composition:** Are hierarchy, reading, alignment, density, and boundaries effective at the target sizes?
5. **Access:** Are relevant color, keyboard, focus, labeling, target, and reflow checks addressed? Use [accessibility.md](accessibility.md).
6. **Character:** Do type, color, shape, imagery, and copy support the agreed direction? Remove decoration that obscures meaning.

Fix a broken task before refining a shadow. Conversely, do not dismiss legitimate visual feedback when visual character is part of the agreed outcome.

## Use realistic stress cases

Select cases relevant to the brief rather than testing every conceivable condition:

- A long name/title, large value, mixed currency, or missing image.
- No items, no matching results, or many items.
- A validation failure and correction without losing entered work.
- A selected, focused, expanded, disabled, or read-only state that could be ambiguous.
- A narrow and intermediate viewport, longer localized copy, or increased text size.

Check each simulated primary control and the state transition it promises. For static designs, inspect each delivered state/frame and note which interactions are specified rather than exercised. Do not claim browser, device, keyboard, or screen-reader testing that was not performed.

## Identify the kind of finding

- **Observed problem:** demonstrable clipping, broken interaction, ambiguous ownership, unreadable content, missing required information, or a failed criterion.
- **Design tradeoff:** competing useful outcomes, such as simultaneous visibility versus spaciousness.
- **Preference:** a visual choice Brian controls, such as stronger editorial character.
- **Hypothesis needing evidence:** an assumption about users' priorities or behavior.

Use those distinctions to decide whether to fix directly, explain a tradeoff, ask Brian, or propose a targeted evaluation. Avoid presenting stylistic preference as a universal usability rule.

## Ask feedback that changes the next revision

Show or link the actual artifact through the supported host workflow. Explain the primary decisions briefly. Ask about unresolved aspects rather than requesting generic approval of "the design."

Useful questions include:

- "Does the opening section communicate the decision this user needs to make?"
- "Which information would you need before choosing this plan?"
- "Does this feel too dense for the intended audience, or does the simultaneous visibility help?"
- "Where would you expect Update to apply, and where would you expect Save to apply?"

When evaluating comprehension, ask a task prompt before explaining the intended interaction. Brian's stakeholder feedback and a walkthrough with an intended user answer different questions; record which evidence you have.

## Iterate with a hypothesis

Translate feedback into a specific change and expected benefit. For example: "The primary action competes with the sidebar. Reduce navigation contrast so the task area receives attention first."

Change the relevant relationships, then inspect again. Preserve accepted decisions and the existing brief unless new information actually changes them. Compare alternatives when the tradeoff is unresolved; avoid producing variants that differ only cosmetically.

For "make it pop," ask which content should draw attention and what should recede. For "too plain," inspect character through existing type, surfaces, and content before adding unrelated artwork. For "too busy," inspect hierarchy and repetition before hiding useful information.

Update a compact decision record with choices and unresolved questions when useful across iterations. Do not accumulate an elaborate process log or manufacture acceptance from a lack of response.

## Completion criteria

The artifact is ready for review when it represents the agreed primary task, relevant states, content pressure, visual direction, and target layouts; material observed problems have been addressed; and inspection limits are stated.

After a visually meaningful revision, inspect the affected final render before presenting it. Earlier screenshots and layout assertions do not verify the revised appearance. If final rendering cannot be inspected, state that specific limitation instead of describing the revised appearance as verified.

Acceptance comes from Brian or from judgment he explicitly delegated. If feedback remains pending, deliver the artifact as ready for review and identify the question to resolve next. Keep production implementation decisions outside the design handoff unless separately requested.
