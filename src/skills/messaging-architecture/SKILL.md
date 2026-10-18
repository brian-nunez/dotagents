---
name: messaging-architecture
description: Shape an audience-first message before writing its slides, diagrams, talk track, or document.
disable-model-invocation: true
---

# Message architecture

Help the user decide what an audience needs to understand, in what order, and why each part belongs. Build the message before producing the artifact. The result may become a presentation, diagram set, talk, memo, or another format; the reasoning process is the same.

The paired examples below use a request-review process to illustrate good and bad choices. They are not a required topic or sequence.

Keep a compact working brief throughout the exchange: audience and what they already believe; intended understanding, decision, or action; current human behavior and proposed change; central message; agreed sequence and section count; approved wording; exclusions; consequential claims and their status; and format or style constraints. This is working memory, not a questionnaire or a section to recite in every response. After a correction, replace the superseded assumption, update the brief, and revise every affected part of the message. Make the change visible to the user in a sentence so both sides know what is now agreed.

## 1. Establish the brief

Recover what the user has already said, including corrections and explicit exclusions. In a fresh session, start from the user's rough notes or source material; if neither exists, ask for them. Ask only for missing information that would materially change the message. Prefer a small batch of focused questions over a questionnaire, beginning with the question that would most affect the framing.

Find out:

- Who is the audience? What do they already know, assume, care about, or doubt? What should they understand, decide, or do afterward?
- What do the relevant people do today, and where is the time, risk, or confusion?
- What changes under the proposal, and what remains a human responsibility?
- What is established, what is intended, and what is merely proposed? What evidence supports consequential claims?
- What source material is authoritative when accounts differ? What format, length, level of detail, and visual style has the user requested?

Reflect the known facts and open decisions briefly. Continue when you can state the intended outcome, the human before-and-after, and the scope without guessing. If a missing choice would change the direction, resolve it with the user before building the sequence.

**Good:** "You've said reviewers sort requests manually and will still decide exceptions. These directors already know the queue is slow; are they concerned that automation would remove reviewer judgment?" This uses known context and tests the audience assumption that could change the framing.

**Bad:** "Describe every workflow, stakeholder, system, metric, and technical dependency before I begin." This burdens the user and postpones a useful first pass.

## 2. Build the message spine

Write one plain-language sentence expressing the central change and why it matters to the audience. Then propose the smallest sequence of distinct ideas that makes that sentence credible. Make each idea answer an audience question and create a reason for the next one. Start with the whole flow before zooming into its parts; a technical detail earns a place when it helps the audience understand or trust the change.

Show the user:

1. **Central message:** one sentence.
2. **Sequence:** one takeaway per section, with the audience question it answers and a short explanation of its place in the flow.
3. **Boundaries:** claims or topics deliberately outside this version.

Include the human perspective where it matters: who starts the process, who acts differently, who reviews or decides, and what they receive. Adapt the sequence to the subject; a current-state/problem/change/handoff/feedback arc is useful only when those are genuinely the story.

Present the sequence as a compact ordered map or table, so the user can judge its pacing and connections without parsing paragraphs. Agree on the sequence and pacing before expanding it when the user is co-designing the message. Record the agreed version in the working brief. If two genuinely different orders would both work, recommend one and explain the tradeoff briefly. If the user requests a complete first pass, proceed with clearly identified assumptions instead of forcing an approval round.

**Good:** "Manual sorting delays decisions → a first pass separates routine requests → reviewers decide exceptions." Each beat advances the central message.

**Bad:** "Executive overview → platform components → architecture → value proposition." These are topic labels; they do not show the audience why one idea follows another.

## 3. Expand one section at a time

For each agreed section, provide:

- **Takeaway title:** the conclusion the audience should remember, not a topic label.
- **Audience question:** the question this section answers.
- **Visible content:** the minimum words or visual relationship needed on the artifact.
- **Talking points:** the supporting explanation, examples, and evidence that should not crowd the artifact.
- **Human action or handoff:** who does what at this point, when it matters to the message.
- **Proof:** the source, demonstration, observation, or clearly identified uncertainty supporting the takeaway.
- **Transition:** why the next section follows.

Move from the overall flow to internal mechanisms only when the audience needs those mechanisms to believe or use the message. Define a technical term in ordinary language before relying on it. Put depth that supports the speaker but not the audience's immediate understanding in talking points or an appendix. Keep agreed section counts and boundaries stable; propose a change when the message genuinely needs one.

For quantitative or consequential claims, verify against available sources or identify the claim as needing confirmation. Omit an unverified claim if it is not needed; ask about it if the message depends on it. Keep current, intended, and proposed states distinct in the working brief; surface that distinction in the audience-facing message when it changes what the audience would conclude. Treat a style reference as guidance for presentation, not as evidence about the subject.

**Good:** Title: "Reviewers keep exception decisions." Visible content: a clear handoff from first-pass sorting to reviewer judgment. Talking points: which exceptions need judgment and why. Proof: the proposed review rules or a verified walkthrough. Transition: how reviewers use the result.

**Bad:** Title: "Human in the Loop." Visible content: every policy detail and system step in small text. No clear decision, handoff, or transition.

## 4. Design visuals when requested

Start with what a visual must explain: a sequence, boundary, comparison, handoff, hierarchy, or feedback loop. Choose the smallest form that makes that relationship easier to see. Give each visual one main message and labels the intended audience can understand. State the visual's message in one sentence before drawing it; the approved sequence determines the drawing, not the other way around.

When a reference image expresses the user's style, carry over its design principles without copying its content or adding decorative text. Before delivery, render and inspect every visual at its intended viewing size. Trace each arrow and decision from start to finish; verify that reading order, labels, spacing, and connections express the agreed message without ambiguity, crossing, or clipping. Revise anything that requires a spoken apology to understand.

**Good:** One left-to-right diagram: request → first-pass sorting → reviewer decision, with the human handoff labeled where it occurs.

**Bad:** Equal-sized boxes for every internal component, crossing arrows, and a reviewer icon disconnected from the decision. It displays inventory instead of explaining the process.

## 5. Check the whole message

Read only the section titles. They should convey the argument in order. Then give a short spoken retelling without notes: can the intended audience understand why this matters, what changes, what remains human, and why the conclusion follows? Check that every section earns its place, terminology is consistent, evidence supports consequential claims, and the ending delivers the understanding, decision, or action established in the brief. Apply user corrections across the whole sequence, not only to the section being discussed.

Present the revised sequence or artifact for the user's judgment. For subjective communication work, use their feedback on a concrete draft before adding more process or formal evaluation.

If the user requests a finished file, create it in the requested format using the appropriate artifact workflow, then inspect the saved result. The message architecture remains the source of truth for its content; successful file creation alone is not proof that the communication works.

**Good:** The titles alone read: "Manual sorting delays decisions → routine requests receive a first pass → reviewers decide exceptions." The ending asks for the intended decision, if one was requested. Any time-savings claim has a source or is marked for confirmation.

**Bad:** The titles read: "Overview → Architecture → Benefits → Summary," with an unsupported "10× faster" claim introduced at the end. The audience cannot reconstruct the argument.

## Small examples

Raw notes: "Reviewers spend hours sorting requests. A service can do the first pass, but people must decide exceptions."

Working brief: operations directors know the backlog but worry about losing human judgment; the desired decision is whether to try a monitored rollout; reviewer exception decisions remain in scope for people; time savings are not yet verified.

Central message: "Automate the first pass so reviewers can spend their time on decisions that require judgment."

Possible sequence: current review → sorting bottleneck → automated first pass → reviewer decision → how a monitored rollout would test the change. The close asks for the rollout decision, not a generic endorsement of automation. This sequence is a candidate to test with the user, not a template to impose on other topics.

Another topic: "An on-call handoff depends on memory, so the next engineer repeats discovery work." A fitting sequence could be current handoff → information lost → shared handoff record → receiving engineer confirms ownership → incident review improves the record. Here the change is a team practice, not an automation story; the same audience-first method still applies.
