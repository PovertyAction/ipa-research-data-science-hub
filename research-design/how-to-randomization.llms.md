How-to guide

# Guide to Randomization

Step-by-step instructions for implementing stratified randomization in Stata, including reproducible seed setting, balance checking, and troubleshooting common issues.

------------------------------------------------------------------------

## Authors

- [Rosemarie Sandino]()
- [David Torres](https://poverty-action.org/people/david-francisco-torres-leon)

## Contributors

- [Radhika Jain]()
- [Devika Lakhote]()
- [Laura Feeney]()

## Last Modified

- August 25, 2026

## License

- [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)

> **TIP:**
>
> Randomization is a fundamental technique in impact evaluation that ensures treatment and control groups are comparable, allowing for unbiased estimates of program effects. This guide will help you:
>
> - Understand the principles of randomization and its importance in impact evaluation
> - Implement stratified randomization in Stata to maintain balance across key characteristics
> - Set up reproducible randomization with proper seed management
> - Verify treatment assignment and check for balance across groups

## Problem: Assign Participants to Treatment Groups

You need to randomly assign participants to treatment and control groups while maintaining balance across key characteristics like grade level, school, or other strata.

**Prerequisites:**

- Stata installed with `randtreat` package
- Dataset with participant identifiers and stratification variables
- Basic familiarity with Stata commands

**What you’ll accomplish:**

- Set up reproducible randomization with proper seed management
- Implement stratified randomization to achieve balance
- Verify treatment assignment worked correctly

## Step 1: Set Up Your Environment

**Set Stata version and seed for reproducibility:**

- Use a different seed for each project
- Choose seeds through random methods—such as from random.org or dice rolls
- Set only one seed per do-file
- Always set the Stata version at the beginning since algorithms change between versions

## Step 2: Prepare Your Data

**Example scenario:** School supply program evaluation

- 500 students across 10 schools
- Budget to treat 250 students
- Need to ensure balance across grades

**Create your dataset with participant identifiers and strata:**

``` python
%%stata
clear
set obs 500
generate student_id = _n
generate school_id = ceil(_n/50)         // 10 schools, 50 students each
generate grade = mod(_n-1,5) + 1         // Grades one to five, evenly distributed
```

    . clear

    . set obs 500
    Number of observations (_N) was 0, now 500.

    . generate student_id = _n

    . generate school_id = ceil(_n/50)         // 10 schools, 50 students each

    . generate grade = mod(_n-1,5) + 1         // Grades one to five, evenly distri
    > buted

    . 

## Step 3: Set Random Seed

**Set a random seed for replicability:**

``` python
%%stata
set seed 12345
```

## Step 4: Verify Your Strata

**Check that your stratification variable covers all participants:**

``` python
%%stata
tab grade
```

          grade |      Freq.     Percent        Cum.
    ------------+-----------------------------------
              1 |        100       20.00       20.00
              2 |        100       20.00       40.00
              3 |        100       20.00       60.00
              4 |        100       20.00       80.00
              5 |        100       20.00      100.00
    ------------+-----------------------------------
          Total |        500      100.00

## Step 5: Implement Stratified Randomization

**Assign half of students to treatment within each grade—total treated equals 250. Generate a treatment variable where 1 equals treated and 0 equals control:**

``` python
%%stata

* Install randtreat if not already installed
capture ssc install randtreat

* Use randtreat for stratified randomization by grade
randtreat, strata(grade) unequal(1/2 1/2) generate(treatment)
```

    . 
    . * Install randtreat if not already installed
    . capture ssc install randtreat

    . 
    . * Use randtreat for stratified randomization by grade
    . randtreat, strata(grade) unequal(1/2 1/2) generate(treatment)
    assignment produces 0 misfits

    . 

## Step 6: Verify Balance

**Tabulate treatment by grade and school to verify balance:**

``` python
%%stata
tab treatment grade
tab treatment school_id
```

    . tab treatment grade

               |                         grade
     treatment |         1          2          3          4          5 |     Total
    -----------+-------------------------------------------------------+----------
             0 |        50         50         50         50         50 |       250 
             1 |        50         50         50         50         50 |       250 
    -----------+-------------------------------------------------------+----------
         Total |       100        100        100        100        100 |       500 

    . tab treatment school_id

               |                       school_id
     treatment |         1          2          3          4          5 |     Total
    -----------+-------------------------------------------------------+----------
             0 |        26         27         25         24         18 |       250 
             1 |        24         23         25         26         32 |       250 
    -----------+-------------------------------------------------------+----------
         Total |        50         50         50         50         50 |       500 


               |                       school_id
     treatment |         6          7          8          9         10 |     Total
    -----------+-------------------------------------------------------+----------
             0 |        25         28         25         26         26 |       250 
             1 |        25         22         25         24         24 |       250 
    -----------+-------------------------------------------------------+----------
         Total |        50         50         50         50         50 |       500 

    . 

## Troubleshooting Common Issues

**Not setting a random seed:** Always use `set seed` in Stata to ensure your results are replicable.

**Failing to check balance:** After randomization, verify that treatment and control groups have balance on key variables.

**Confusing unit identifiers:** Double-check IDs—such as village, school, or participant names—to avoid misassignment.

**Contamination:** Monitor to prevent control group members from receiving the treatment.

**Poor documentation:** Keep detailed records of your randomization procedure for transparency and reproducibility.

> **WARNING:**

For more detailed guidance on randomization and power calculations in Stata, see the [Stata power and sample size reference manual Release 18](https://www.stata.com/manuals/power.pdf) [^1].

**Additional Resources:**

Innovations for Poverty Action (IPA). “Randomization Guide with Example Do-files.” IPA Box Resources. <https://ipastorage.box.com/s/sslf9h67yaejnhn3zz02ez3k508irzu8>

Gould, William. “How to Generate Random Numbers in Stata.” Stata Blog. <https://blog.stata.com/2016/03/10/how-to-generate-random-numbers-in-stata/>

StataCorp. “Random Numbers.” Stata Blog. <https://blog.stata.com/tag/random-numbers/>

Back to top

[^1]: StataCorp. 2023. *Stata power and sample size reference manual: Release 18*. https://www.stata.com/manuals/power.pdf
