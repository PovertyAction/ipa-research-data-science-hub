How-to guide

# Dashboards for Decisions

How to design dashboards that drive decisions rather than merely display numbers: starting from the decision, selecting metrics that are actionable, laying out for a five-second read, and setting thresholds that indicate what to do next.

------------------------------------------------------------------------

## Authors

- Yuri M. Leomo

## Contributors

- [Kelly Montaño](https://poverty-action.org/people/kelly-montano)

## Last Modified

- August 25, 2026

## License

- [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)

> **TIP:**
>
> - **A dashboard should be designed backward from the decision.** Its purpose is to answer “what should be done?”, not “what happened?”
> - **Every metric should be actionable.** A number that would not change any decision does not belong on the dashboard.
> - **The signal should be obvious.** Thresholds, ordering, and a single highlight color turn a wall of numbers into a decision.

## The purpose of a dashboard

A dashboard places the few numbers that matter in one location, updated regularly, so that they can be acted on. Its value lies not in how much it shows but in how quickly it moves the viewer from looking to deciding. The common failure is a dashboard that is comprehensive but unusable: dozens of metrics, no hierarchy, and no indication of what is acceptable and what requires attention.

## 1. Start from the decision

The first step is to identify the decision the dashboard supports and who makes it: who consults it and how often, what decision it informs (“Which site should be visited next?”), and what action follows from each likely reading. When no decision can be named, the result is a report rather than a dashboard, which is a legitimate output but should be designed as one.

## 2. Select actionable metrics (CART)

Sound monitoring metrics are **Credible**, **Actionable**, **Responsible**, and **Transportable** (Gugerty and Karlan 2018). On a dashboard, the actionable criterion does most of the work: a metric belongs only if a plausible value would change what someone does.

Each candidate can be tested against four questions: 1. Would a poor reading trigger a specific response (actionable)? 2. Is it measured well enough to be trusted (credible)? 3. Is it worth the cost of collection (responsible)? 4. Does it mean the same thing across sites and over time, so that comparisons are fair (transportable)?

The aim is a short set of metrics that map directly to the decision, not everything that happens to be collected.

## 3. Lay out for a five-second read

Each screen should function like a billboard, comprehensible in roughly five seconds and explorable in more detail where needed. Several layout choices support this:

- The most important number belongs **top-left,** where the eye lands first.
- **Related metrics should be grouped** so the layout reads as a few blocks rather than a grid of cells.
- **Lists should be ordered by the value that matters** (the worst-performing site first), not alphabetically.
- **Each view should carry one idea.** A screen that answers two unrelated questions should be split.
- **Comparison matters as much as level.** A number means little without a target, a prior period, or a peer for reference.

The visual craft behind these choices, including decluttering, preattentive cues, honest axes, and color, is covered in [Data Visualization Principles](../../../data-science/data-visualization/communicating/data-visualization-principles.llms.md).

## 4. Turn numbers into signals

A dashboard earns its value when it conveys what a number *means*, not only what it is. Two techniques do most of the work:

1.  Thresholds defined in advance (acceptable, watch, act) allow cells that cross the “act” line to be flagged with a single alert color, which turns a table into a list of required actions.
2.  Pairing each key number with direction, through an arrow, a sparkline, or a comparison to the previous period, conveys whether a value is rising, which is often more decision-relevant than its level.

> **WARNING:**
>
> When half the dashboard is red, nothing reads as urgent. Emphasis should be reserved for the few cells that genuinely require action, following the same discipline as spending a highlight color on a single bar. Thresholds should be set before the data are seen, so the rule remains honest.

## 5. Keep it maintainable

A dashboard is useful only while it stays current. It should be connected to a data source that updates on the cadence the decision requires, and each metric’s definition should be documented so the numbers mean the same thing in a later period. A simple dashboard that is always up to date is more useful than an elaborate one that no one refreshes. Common no-code and low-code tools include linked spreadsheets, [Datawrapper](https://www.datawrapper.de/), Google Looker Studio, and Power BI. Custom, reproducible dashboards can be built in code using the Python lessons in this section.

> **TIP:**
>
> In monitoring trainings with government partners, IPA teams have built simple facilitator dashboards around a single decision: who needs support. Rather than reporting every indicator collected, these dashboards surface a small set of CART-aligned metrics (attendance, session length, cost, and post-test gains), sort facilitators by the metric in question, and flag the outliers. A manager can then identify the row that requires attention within seconds. The dashboard succeeds not because it shows a great deal, but because it answers one decision clearly.

## References

Few, Stephen. 2006. *Information Dashboard Design: The Effective Visual Communication of Data*. Sebastopol, CA: O’Reilly.

Gugerty, Mary Kay, and Dean Karlan. 2018. *The Goldilocks Challenge: Right-Fit Evidence for the Social Sector*. New York: Oxford University Press.

Knaflic, Cole Nussbaumer. 2015. *Storytelling with Data: A Data Visualization Guide for Business Professionals*. Hoboken, NJ: Wiley. https://www.storytellingwithdata.com/.

## Additional Resources

Datawrapper Academy. <https://academy.datawrapper.de/>.

Back to top
