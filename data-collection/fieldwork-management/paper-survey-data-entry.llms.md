How-to guide

# Paper Survey Data Entry

This guide covers how to manage the full data entry process for paper surveys, from deciding between in-house and outsourced operations to running double entry, reconciliation, and auditing in Stata.

------------------------------------------------------------------------

## Authors

- [Santiago Sanchez Guiu](https://poverty-action.org/people/santiago-sanchez-guiu)

## Contributors

- [Kelly Montaño](https://poverty-action.org/people/kelly-montano)

## Last Modified

- September 4, 2026

## License

- [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)

> **TIP:**
>
> - **Double entry is required.** Research protocols require all paper-based datasets to be entered twice independently and reconciled before analysis.
> - **In-house vs. outsourced entry involves real trade-offs.** In-house operations offer more control; outsourced operations reduce management burden but require rigorous contract oversight.
> - **Auditing verifies the final dataset.** A post-reconciliation audit using a separate team confirms that error rates fall within acceptable thresholds.

## Before You Begin

Paper surveys require a data entry pipeline that moves questionnaires from physical forms into a clean, verified digital dataset. This process has four stages that must occur in sequence: (1) deciding who enters the data, (2) setting up and running the entry operation, (3) reconciling discrepancies between the two entries, and (4) auditing the final dataset. Each stage builds on the previous one; skipping or shortcutting reconciliation leaves systematic entry errors undetected.

## Step 1: Decide Who Will Enter the Data

The first decision is whether to run data entry in-house or to contract it out to an external data entry company. Both options are viable; the right choice depends on team capacity, timeline, and context. The table below summarizes the key considerations for each.

|  | **In-house** | **Outsourced** |
|:---|:---|:---|
| **Main advantage** | Direct control over quality and process | Reduces financial and personnel management burden |
| **Main risk** | Significant management overhead for the research team | Companies may struggle to meet quality standards or withdraw mid-project |
| **Key questions before committing** | Who manages operations? How will computers be maintained? Where will entry take place? How will data entry operators (DEOs) be recruited and compensated? | Does the company have survey data entry experience and references? Will it allow spot-checks? Are re-entry penalties in the contract? Can questionnaires be transported securely? |
| **Best for** | No reliable local companies available; complex instruments requiring institutional knowledge; timelines requiring direct control | Larger operations where managing 20+ DEOs is impractical; projects with clear, well-structured instruments |

Quality standards in research data entry are higher than in most commercial contexts, and external companies frequently struggle to meet them. Teams should build clear re-entry penalties and consequences into contracts before work begins. A data entry company may stop work mid-project if re-entries become unprofitable; contracts must account for this risk explicitly.

> **WARNING:**
>
> The financial and personnel management burden of in-house data entry is significant. Research teams should consult their supervisors before establishing a new in-house operation.

## Step 2: Set Up and Run the Entry Operation

Whether entry is in-house or outsourced, the research team is responsible for the physical, technical, and personnel infrastructure before entry begins.

### Technology setup

Computers for data entry do not need to be high-powered, but they must be reliable and uniform. A set of identical machines running the same operating system reduces troubleshooting time substantially. Retired field laptops are a practical option; if used, wipe the hard drive and reinstall the operating system before use to remove any confidential material from prior projects. Before entry begins:

- Install antivirus software on all entry computers.
- Keep entry computers off the internet to reduce virus risk and limit staff distractions.
- Avoid USB flash drives; use a local network for moving files between machines instead.
- Back up daily to a separate location within the office and weekly to an external location such as Box.

Data files shared between the entry office and the research team must be encrypted before transfer; unencrypted files violate data security protocols and IRB commitments.

### Recruiting and screening data entry operators

Data entry operators (DEOs) should be able to concentrate for extended periods, follow instructions precisely, and flag errors in the questionnaire or interface without attempting to resolve them on their own. Testing applicants is more reliable than CV screening alone. Effective approaches include a timed number-entry test in a spreadsheet and a short test using the actual entry software once the interface is built. A test using a complex survey instrument tends to measure learning speed rather than sustained accuracy; a simpler test of basic numeric entry over a longer period is more predictive of on-the-job performance.

> **TIP:**
>
> **India:** A project hired seven staff from 30 applicants. An initial test using a real, complex survey showed zero predictive value for speed and little for accuracy. A redesigned test using a simple number grid over one hour correlated at approximately 40 percent for both speed and accuracy. The revised test measured concentration rather than learning speed.
>
> **Ghana:** RAs administered two tests: a number-entry spreadsheet test and a test using data entry software. The software test predicted speed better than the spreadsheet test in that context. Neither test clearly predicted accuracy. The best screening approach may be context-dependent.

### Training DEOs

Training should happen as close to survey launch as possible. The research team should be present for all training sessions and for the first several days of entry. A standard training session should cover the following in order:

1.  Introduce the project’s social mission without disclosing the specific research question.
2.  Explain the double-entry process and the accuracy and speed expectations.
3.  Walk through the questionnaire question by question, describing expected responses without entering any data.
4.  Enter several questionnaires together, pointing out common errors and how to flag them.
5.  Have DEOs enter a small set of pre-verified questionnaires so errors can be identified and corrected immediately.

DEOs must know how to flag errors they cannot resolve on their own, whether by alerting a supervisor directly, using a notes field in the entry software, or another agreed-upon method. If surveyors made errors in the field, DEOs are the last line of defense for catching them.

### Questionnaire tracking and physical workflow

Until data has been double-entered and reconciled, the physical questionnaires are the most valuable documents in the project. The team must be able to locate any questionnaire within five minutes at any point during the process. Set up clearly labeled, physically separated areas for questionnaires at each stage:

1.  Waiting for first entry
2.  Waiting for second entry
3.  Waiting for first reconciliation
4.  Waiting for second reconciliation (if applicable)
5.  Waiting for final reconciliation
6.  Finished

Assign DEO pairs to bundles so that one DEO always performs the first entry and the other the second; pairs sign bundles in and out to maintain a clear chain of custody. After entry is complete, re-catalogue all questionnaires, organize them into labeled bundles, and store them in locked cabinets. Store cover pages with identifying information separately from questionnaire content, in line with data security protocols.

## Step 3: Run Double Entry and Reconciliation

Double entry means that two DEOs enter the same questionnaire independently, with neither seeing the other’s work. Reconciliation is the process of identifying and correcting discrepancies between the two entries. IPA uses two Stata commands, `cfout` and `readreplace`, to manage this process.

> **NOTE:**
>
> Once reconciliation is complete, see [Data Integrity](../../data-quality/data-integrity.llms.md) for guidance on backup procedures and secure file storage.

### Compare the two entries with `cfout`

Before running `cfout`, save both raw entry files as Stata `.dta` files:

``` stata
insheet using "my raw first entry.csv", clear
save "first entry.dta", replace

insheet using "my raw second entry.csv", clear
save "second entry.dta", replace
```

Then compare the two entries, excluding any variable expected to differ between entries such as a variable recording the DEO’s name:

``` stata
cfout region-no_good_at_all using "first entry.dta", id(uniqueid)
```

This produces `discrepancy report.csv` with four columns: the unique ID, the variable name, the value from the first entry, and the value from the second. A fifth column is left blank for DEOs to record the correct value after looking up the original questionnaire. Two options are particularly useful: `nopunct` ignores punctuation differences in string variables, and `lower` converts strings to lowercase before comparing to remove capitalization differences.

### Correct discrepancies with `readreplace`

After DEOs have recorded the correct value for each discrepancy, save the report as a CSV with three columns: unique ID, variable name, and correct value. Then apply the corrections:

``` stata
readreplace using "first reconciliation.csv", id(uniqueid)
```

This produces a single-reconciled dataset.

### Run double reconciliation (recommended)

Double reconciliation is recommended: having two separate DEOs each look up discrepancies independently, then comparing their reconciled datasets for any remaining differences. This catches errors introduced during reconciliation itself and is less expensive than re-running the entire entry process if error rates later prove too high.

``` stata
* Save the first reconciliation, then apply the second:
save "first reconciliation.dta", replace
readreplace using "second reconciliation.csv", id(uniqueid)
save "second reconciliation.dta", replace

* Compare the two reconciled datasets:
cfout region-no_good_at_all using "first reconciliation.dta", id(uniqueid)
```

Any remaining discrepancies are reviewed by a fifth person and corrected before producing the final dataset.

> **WARNING:**
>
> Do not reshape the dataset before completing double entry reconciliation. Reshaping can artificially lower the measured error rate by obscuring discrepancies between entries.

## Step 4: Audit the Final Dataset

A data entry audit is a post-reconciliation quality check that involves re-entering a random sample of surveys using a team separate from the original DEO team, then comparing those re-entered values against the final reconciled dataset. The audit team must be independent; it should not include close friends or relatives of anyone on the original entry team, as DEO compensation may depend on audit outcomes.

### How many surveys to audit

The number of surveys to audit is determined by survey length: longer surveys contain more fields per survey, so fewer surveys need to be re-entered to achieve a reliable error rate estimate. The table below, drawn from IPA’s auditing guidelines, shows the recommended minimums for common survey lengths. Audits should be stratified by DEO so that each operator’s work is represented. If certain questions are excluded from the audit (for example, sections that are commonly left blank), document which questions were excluded and why in the project file.

| Questions in survey | Surveys to audit |
|:--------------------|-----------------:|
| 5                   |              267 |
| 10                  |              134 |
| 20                  |               67 |
| 30                  |               45 |
| 50                  |               28 |
| 75                  |               27 |
| 100                 |               21 |
| 150                 |               16 |
| 200                 |               12 |
| 300                 |                9 |
| 400                 |                7 |
| 500                 |                7 |

Table 1: Recommended surveys to audit by survey length (IPA 2011)

### Calculating and acting on the error rate

Use `cfout` to compare the audit re-entries against the final dataset, following the same procedure as in Step 3. The resulting discrepancy report shows whether errors are coming from the original entries or from the audit itself. If the error rate exceeds the project threshold, first check whether the errors are in the audit entries rather than the final dataset, correct any audit errors, and re-run the comparison. If errors remain above threshold after this correction, contact the supervisor and principal investigator to agree on next steps and document the fact that the initial audit exceeded the threshold in the project file. The most common resolution is to have the entry team re-enter the batch or section whose error rate was too high. When working with an external data entry company, include clear contractual provisions for re-entry before work begins; a clear legal agreement prevents disputes and should outline consequences if the company withdraws.

Back to top
