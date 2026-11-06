# Tools and prototypes

Read this when choosing the design artifact, creating it, or deciding what functionality to simulate. Follow the active environment's tool and skill instructions if they differ from an example here.

## Match the artifact to the uncertainty

| Question to answer | Useful artifact | Limitation to state |
| --- | --- | --- |
| Which composition or visual character works? | Design-tool frames or a small set of HTML concepts | Static frames do not establish interaction behavior |
| Can users understand and complete the flow? | Linked frames or interactive HTML with simulated state | The simulation does not establish real service behavior |
| Does content reflow and remain usable? | Responsive HTML or explicit viewport variants | Fixed frames cannot prove intermediate-width behavior |
| How should one existing component change? | Isolated component/state exploration | Surrounding context still needs review |

Honor Brian's requested format. Otherwise, propose the least elaborate available artifact that answers the design questions. Local HTML/CSS/JS is a useful default when real layout and interactions matter and no preferred design tool is available.

Discover the actual tool capabilities before promising editable files, native formats, export, or interactive playback. Use installed tool-specific skills when applicable. If a requested tool is unavailable, explain the limitation and offer a supported alternative; do not label HTML as an editable design-tool document.

## Establish the artifact boundary

Use an isolated folder or new design document that preserves the current application. Follow existing design-artifact conventions. For local HTML, a folder such as `designs/<concept>/` can hold the entry point, local assets, and a short brief; choose another location if the repository requires it.

A self-contained page often needs no framework or package installation. Reuse available project tooling only when doing so does not require changing production code or dependencies. Follow applicable coding instructions when writing mockup code. Keep dependencies proportional to the design question and within existing authorization.

Respect tool-specific authorization for shared documents and remote writes. Obtain explicit approval for a new external side effect when it is not already authorized. Publication is separate from making a reviewable design. If a hosting workflow is required by the environment, keep the scope at design and follow its permission boundaries.

## Build enough interaction to evaluate UX

Use local, fictional data and deterministic states for controls central to the brief. Examples:

- A filter changes the visible example results and can be cleared.
- A selectable plan updates its selected indicator and summary.
- A form demonstrates field errors, preserves entered values, and shows a simulated success state.
- A disclosure reveals relevant detail and exposes its expanded state.
- A dialog supports opening, cancellation, and the expected focus behavior.

Document which interactions are simulated. Avoid network submissions, real payments, actual authentication, or real notifications. Prefer in-memory state; use persistent local storage only when continuity is part of the agreed design question, using fictional data and an understandable reset.

Use native controls as the behavior foundation when possible. A clickable-looking control that does nothing is misleading unless its limit is clear in the design review. A static frame can represent behavior with state frames and explicit annotations rather than pretending it is interactive.

If an interaction requires an unknown product rule, ask about the rule or show it as a provisional hypothesis. The prototype must not silently decide real authorization, billing, or data-retention policy.

## Control fidelity

Choose low fidelity to compare structure quickly. Use realistic content even in rough layouts so hierarchy and content pressure can be evaluated. Increase fidelity when testing visual character, reading, dimensions, or affordance.

Once the direction is agreed, create a coherent polished page rather than leaving disconnected component experiments. Represent necessary states and target viewports at the fidelity needed for review. Avoid spending detail work on a flow that Brian has not agreed to explore.

## Inspect and present

Use the active host's supported browser, preview, screenshot, or rendering workflow. Follow its rules for showing visuals, starting servers, tabs, and local files. This reference does not authorize a particular server, preview tool, plugin installation, or upload.

Inspect the rendered artifact before presenting. In HTML, exercise the primary path, relevant state changes, keyboard operation, and agreed viewport changes where tools permit. In a design tool, inspect all deliverable frames and state variants; distinguish static annotations from tested behavior.

If you cannot render or interact with the artifact, state what remains unverified and still provide the editable file. Do not substitute code inspection for a claim that the page was visually checked.

Deliver the editable source and a usable entry point. Include only notes needed to understand design intent, run the artifact with existing tooling, exercise simulated states, and distinguish it from production functionality.
