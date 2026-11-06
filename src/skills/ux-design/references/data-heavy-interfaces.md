# Data-heavy interfaces

Read for dashboards, metrics, lists, tables, and workflows that act on many records.
Use [responsive design](responsive-design.md) when the same information must work at different widths.

## Start with the decision

Before choosing cards or charts, identify the user's question and resulting action.
For each proposed metric, establish its meaning, unit, time window, comparison, and source of uncertainty.
Distinguish information needed for an immediate decision from supporting evidence and record details.

For an invoice dashboard, useful questions include:

- Which invoices need attention now?
- How much remains unpaid, and over what period?
- Which client or invoice should I open to investigate?

An overdue amount may deserve more emphasis than total revenue in a collection workflow.
Treat assumptions about the most important metric as hypotheses to validate with the intended users.

## Diagnose competing emphasis

If navigation and repeated buttons attract attention before the data, reduce their visual weight.
Give summary values clear prominence, with enough nearby context to interpret them correctly.
Use alignment and spacing before adding stronger emphasis.
A summary and its drill-down action should read as one group; the action can remain visually secondary.

If a screen resembles a database record, regroup its information around user meaning.
A client name can sit above an invoice identifier; an amount can sit beside its currency.
Display labels remain useful where values look similar, unfamiliar units require explanation, or users scan by attribute.
Choose labels according to the scanning task rather than removing them for visual simplicity.

## Tables and lists

Choose a table when users compare records across consistent attributes.
Choose a list or cards when each item needs a richer summary and cross-row comparison matters less.
Before combining columns, check whether users need to sort, filter, export, or compare those attributes independently.

- Right-align comparable numbers and align decimal positions; use tabular numerals where available.
- Use precision appropriate to the decision; keep comparable amounts at consistent precision.
- Place units and currencies where they remain unambiguous, including when records use different currencies.
- Distinguish missing, unavailable, and zero values.
- Keep an identifier visible when names can repeat.
- Use row spacing, subtle striping, or separators according to density and scanning needs.
- Preserve clear header associations and a visible sort state.

Dates can remove mental work when expressed as “Due in 2 days.”
Keep the exact date and relevant time zone available through an accessible detail path.
Use exact dates when users reconcile, audit, schedule, or compare across periods.

Status needs a readable meaning in addition to color.
Use a short label or a recognizable symbol with an accessible name; retain it in compact layouts.
Identical red and yellow dots alone cannot explain two different states.
For interaction and contrast requirements, read [accessibility](accessibility.md).

## Charts

State the question the chart answers before choosing its form.
Use a trend display for change over time and a comparison display for differences between categories.

Check units, time intervals, aggregation, denominators, and comparison periods.
Use consistent scales for comparable views and disclose intentional scale differences.
For bars that encode magnitude by length, use a meaningful zero baseline.
Distinguish missing observations from observed zero values and show uncertainty when it affects the conclusion.
Provide labels and accessible values sufficient to interpret the result without color alone.

## Controls and operational states

Make active filters, search scope, result count, and clearing controls visible together.
Distinguish an empty dataset from no matching results, loading, partial results, and a failed request.
Each state should explain what happened and offer the next useful action.

For selection and bulk actions, make the selected scope explicit: visible rows, a page, or all matching records.
Show the selection count and preserve a clear way to clear it.
Account for unavailable actions, partial success, stale records, and recovery in the design.
Use [forms and actions](forms-and-actions.md) for action hierarchy and confirmation decisions.

## Worked example

An invoice card initially gives “Client,” “Amount,” “Due date,” and “Status” equal weight.
Regroup it into client identity, a prominent formatted amount, a useful due-date phrase, and a labeled status badge.
A quiet footer action makes the detail path recognizable.
In the table, retain separate date columns when users compare deadlines; combine only genuinely supporting attributes.
On mobile, preserve status meaning and exact details even when the overview becomes more compact.

## Review criteria

- The first visible information answers the declared user question.
- Every summary has sufficient units, period, and comparison context.
- Users can identify, compare, sort, and act on the records required by the task.
- Important states remain understandable without color.
- Filters and selections make their scope and effects visible.
- Realistic record volume, long names, unusual values, and missing data preserve interpretation.
- Density is a deliberate tradeoff between scanning, comparison, and visible information.
- Empty, loading, failure, and recovery states preserve a useful next step.
