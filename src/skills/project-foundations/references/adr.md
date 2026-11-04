# Architecture Decision Records

Every ADR uses the full MADR template in [`adr-template.md`](adr-template.md), copied verbatim from [adr/madr](https://github.com/adr/madr/blob/8135ed2e01503be852769402ec3eeb585bfe75a2/template/adr-template.md) (MADR 4, dual-licensed MIT or CC0-1.0).

## When to write one

An ADR records a decision that is costly to reverse or that shapes the code beyond one module: datastore, service boundaries, protocols, auth model, hosting, a core dependency, a cross-cutting convention. Choices the code makes obvious and that a single change can undo stay out.

## Writing it

*   Start from a copy of `docs/adr/adr-template.md`. Fill every section, including the ones the template marks optional; delete a section only when it truly has nothing to say for this decision.
*   Replace every `{…}` placeholder and remove all of the template's HTML comments.
*   **Context and Problem Statement**: the forces at play and the question being decided, in project terms. A reader who was not there understands why a decision was needed.
*   **Considered Options**: at least two genuine alternatives that were viable. Each gets its own `Pros and Cons of the Options` subsection with concrete arguments, including the chosen option's downsides.
*   **Decision Outcome**: the chosen option and the justification, tied to the decision drivers.
*   **Consequences**: what gets easier and what gets harder, including the cost accepted.
*   **Confirmation**: how compliance is checked: a test, a lint rule, a review checklist item.
*   Front matter: `status`, `date` (the day it was last updated), `decision-makers`; `consulted` and `informed` when others were involved.
*   Facts come from the interview and the code. Missing facts are asked for; an ADR is never completed by guessing.

## Files

*   `docs/adr/adr-template.md`: a verbatim copy of [`adr-template.md`](adr-template.md), so future records start from the same template.
*   Records: `docs/adr/NNNN-title-with-dashes.md`, numbered from `0001` in order of acceptance. The title names the problem and solution: `0003-use-postgresql-for-primary-storage.md`.
*   `docs/adr/README.md` is the index:

    ```markdown
    # Architecture Decision Records

    Decisions that shape this project, in [MADR](https://adr.github.io/madr/) format. New records start from [`adr-template.md`](adr-template.md).

    | ADR | Title | Status | Date |
    | --- | ----- | ------ | ---- |
    | [0001](0001-use-postgresql-for-primary-storage.md) | Use PostgreSQL for primary storage | accepted | 2026-11-03 |
    ```

*   With no decisions yet, create the template copy and `docs/adr/README.md` with the heading, the paragraph and an empty table. Records are written only for real decisions.

## Lifecycle

*   An accepted ADR is immutable apart from its `status`. A changed decision gets a new ADR; the old one's status becomes `superseded by ADR-NNNN` and the new one links back to it under `More Information`.
*   Update the index whenever a record is added or its status changes.
