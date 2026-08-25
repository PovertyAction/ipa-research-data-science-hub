Explanation

# About Research Design

------------------------------------------------------------------------

## Authors

- [Niall Keleher](https://poverty-action.org/people/niall-keleher)

## Contributors

- [David Torres](https://poverty-action.org/people/david-francisco-torres-leon)
- [Cristhian Pulido](https://poverty-action.org/people/cristhian-pulido)
- [Kelly Montaño](https://poverty-action.org/people/kelly-montano)

## Last Modified

- August 25, 2026

## License

- [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)

Research design is a key ingredient for reliable, policy-relevant research and data science projects. It determines whether you can credibly measure and attribute observed changes to your intervention, rather than to other factors. When design is weak, no amount of analysis can recover the lost credibility, and the consequences are real: resources directed toward ineffective programs, better alternatives crowded out, and policies built on unreliable evidence. This page provides an overview of key research design considerations and links to detailed guidance on specific topics.

## What is impact evaluation?

Impact evaluation asks a deceptively simple question: did this program work? A program’s impact is defined as the difference between the outcomes observed among participants and the outcomes those same participants *would have experienced* had the program never existed, the **counterfactual**. Because the counterfactual is never directly observable, every evaluation method is a strategy for constructing a credible substitute from available data.

To estimate the counterfactual, researchers select a **comparison group** whose outcomes proxy what would have happened to participants. When that group differs systematically from participants -in observable characteristics like income or education, or in unobservable ones like motivation- any difference in outcomes may reflect those pre-existing differences rather than the program itself. This is **selection bias**, and it is the central methodological problem that research design must solve.

> **TIP:**
>
> The Balsakhi tutoring program in Vadodara, India, provided remedial instruction to at-risk primary school students. Because the same dataset was analyzed using different evaluation methods, it illustrates clearly how the choice of comparison group shapes results.
>
> A **before-versus-after** design estimated an impact of 26.42 test-score points, but this ignores natural academic progress over the school year. A **simple difference** between participants and non-participants produced -5.05 points, almost certainly misleading because children receiving the Balsakhi were selected for being lower-performing. A **difference-in-differences** design estimated 6.82 points. A **randomized evaluation** of a similar program produced 0.28 standard deviations: a credible result grounded in a defensible comparison.
>
> Every method rests on assumptions that should be stated, examined, and defended, not taken for granted.

## Methods for estimating impact

**Quasi-experimental methods** -such as difference-in-differences, regression discontinuity, and instrumental variables- do not involve random assignment. They rely on statistical techniques and specific features of program design to construct a credible comparison group, and each makes assumptions that cannot be directly tested. For descriptions of each approach, see the DIME Wiki’s [Experimental Methods](https://dimewiki.worldbank.org/Experimental_Methods) and the DIME Wiki’s [Quasi-Experimental Methods](https://dimewiki.worldbank.org/Quasi-Experimental_Methods).

**Randomized controlled trials (RCTs)** assign candidates to treatment or control through a lottery, making both groups statistically equivalent at baseline on observed and unobserved characteristics. This is the only method that eliminates selection bias without assumptions about unobservable factors. For a discussion of common concerns about RCTs -including ethics, external validity, and cost- see [Addressing Common Criticisms of Randomized Controlled Trials](../research-design/addressing-rct-criticisms.llms.md).

Impact evaluations are not the only tool in the research toolkit. IPA’s work spans a range of study types depending on what a given question requires: pilot studies and A/B tests to develop and iterate on program designs; descriptive and process studies to understand context and diagnose gaps; long-term panel surveys and administrative datasets to track outcomes over time; and evidence synthesis to consolidate what is already known. Good research design means choosing the right approach for the question, not defaulting to any single method.

> **TIP:**
>
> A good evaluation asks questions that are policy relevant, answers them in an unbiased and definitive way, and shares the results regardless of the findings. Studies that find no impact can be just as useful as those that do. The point is to learn and improve, not to validate.
>
> A related question is whether findings from one context can inform decisions in another. Rigorous impact evaluations are designed not to replace local knowledge but to complement it: underlying human behaviors tend to generalize more than specific programs do, and a focus on mechanisms -*why* something worked- is usually more useful than asking whether an identical program produced identical results elsewhere. For a practical framework for thinking through generalizability, see Bates and Glennerster (2017) in the Additional Resources below.

## Pages in this section

Good research design requires working through several interconnected decisions before data collection begins. The pages below cover the key elements, from choosing a research method to powering your study, designing randomization, and developing valid measures.

**[Research Methods in Impact Evaluation](../research-design/research-methods.llms.md)**. An overview of quantitative, qualitative, and mixed methods approaches: what each does, what questions it answers, and how they work together to generate rigorous, policy-relevant evidence.

**[Sample Size and Power Calculations](../research-design/sample-size-power.llms.md)**. A study must be adequately powered to detect effects worth detecting. Key decisions include the minimum policy-relevant effect size, expected outcome variance, and how clustering, attrition, and non-compliance affect the required sample. See also the [How-to Guide to Power Calculations](../research-design/how-to-power-calculation.llms.md).

**[Randomization](../research-design/randomization.llms.md)**. The level and method of random assignment shape statistical power, spillover risk, and implementation feasibility. Key decisions include whether to randomize at the individual or cluster level, whether to stratify, and how to handle design variations such as phased rollout or encouragement designs. See also the [How-to Guide to Randomization](../research-design/how-to-randomization.llms.md).

**[Measurement and Survey Design](../research-design/measurement.llms.md)**. Valid and reliable measurement of outcomes is essential for credible evaluation. This covers indicator selection, instrument design, sources of measurement error, and how to connect measurement choices to a theory of change.

**[Addressing Common Criticisms of Randomized Controlled Trials](../research-design/addressing-rct-criticisms.llms.md)**. A discussion of the most frequently raised concerns about RCTs in development research, with context for how thoughtful design addresses them.

## References

Banerjee, Abhijit, Shawn Cole, Esther Duflo, and Leigh Linden. 2007. “Remedying Education: Evidence from Two Randomized Experiments in India.” *Quarterly Journal of Economics* 122, no. 3: 1235–1264. <https://doi.org/10.1162/qjec.122.3.1235>

Bates, Mary Ann, and Rachel Glennerster. 2017. “The Generalizability Puzzle.” *Stanford Social Innovation Review*, Summer 2017. <https://ssir.org/articles/entry/the_generalizability_puzzle>

Gertler, Paul J., Sebastian Martinez, Patrick Premand, Laura B. Rawlings, and Christel M.J. Vermeersch. 2016. *Impact Evaluation in Practice*. 2nd ed. Washington, DC: World Bank and Inter-American Development Bank. <https://www.worldbank.org/en/programs/sief-trust-fund/publication/impact-evaluation-in-practice>

## Additional Resources

Abdul Latif Jameel Poverty Action Lab (J-PAL). “Introduction to Randomized Evaluations.” J-PAL Research Resources. <https://www.povertyactionlab.org/resource/introduction-randomized-evaluations>

Bates, Mary Ann, and Rachel Glennerster. 2017. “The Generalizability Puzzle.” *Stanford Social Innovation Review*, Summer 2017. <https://ssir.org/articles/entry/the_generalizability_puzzle>

World Bank Development Impact Evaluation (DIME). “Experimental Methods.” DIME Wiki. <https://dimewiki.worldbank.org/Experimental_Methods>

World Bank Development Impact Evaluation (DIME). “Quasi-Experimental Methods.” DIME Wiki. <https://dimewiki.worldbank.org/Quasi-Experimental_Methods>

Back to top
