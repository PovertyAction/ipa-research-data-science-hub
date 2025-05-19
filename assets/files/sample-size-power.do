/*******************************************************************************
  Title:    power-calcs-basic.do

  Author:   Cristhian Pulido
  Updated:  November 14, 2024
  Version:  Stata 18
			
  Outline:  1. Sample size given an MDE (and power)
            2. Power sensitivity tables and graphs
			3. MDE given a sample size (and power)
			3. Power given a sample size and MDE
*******************************************************************************/

* Stata's power command 

	help power

********************************************************************************
**#  Estimating the sample size for a given effect size and power
********************************************************************************

/*------------------------------------------------------------------------------
	Underlying assumptions
--------------------------------------------------------------------------------	
	- Effect size (MDE) = 0.2 S.D.
	- Statistical power = 80%
	- Variance of the outcome variable: 1 S.D
	- A single treatment group (and a control group)
	- A single post-treament data collection (endline)
	- Program was randomized at the individual (child) level
	- Perfect compliance
	- No attrition
	- No additional controls
------------------------------------------------------------------------------*/

	power twomeans 0 0.2 , power(0.8) sd(1)
	
// The required study sample size to achieve a power of 80% is 788 students (394
// in the treatment group, 394 in the control group)

/*------------------------------------------------------------------------------
    Q: What if we expected a larger treatment effect of 0.4 SD?
	A: The required sample size would decrease to 200
------------------------------------------------------------------------------*/		
	
	power twomeans 0 0.4 , power(0.8) sd(1)
	
/*------------------------------------------------------------------------------
    Q: What if we expected a smaller treatment effect of 0.1 SD?
	A: The required sample size would increase to 3,142
------------------------------------------------------------------------------*/		
	
	power twomeans 0 0.1 , power(0.8) sd(1)	
	
/*------------------------------------------------------------------------------
    Q: What if we want to increase the statistical power to 90%?
	A: The required sample size would increase to 1,054
------------------------------------------------------------------------------*/	
	
	power twomeans 0 0.2 , power(0.9) sd(1)

/*------------------------------------------------------------------------------	
	Q: What if the variance of the outcome is larger than expected, say 2 SD?
	A: The required sample size would increase to 1,572
------------------------------------------------------------------------------*/
	
	display sqrt(2)
	power twomeans 0 0.2 , power(0.8) sd(1.4142136)
	
/*------------------------------------------------------------------------------	
	Q: What if 60% of the sample is assigned to the treatment group?
	A: The required sample size would increase to 820 (492 students in the
	   treatment group and 328 in the control group).
------------------------------------------------------------------------------*/
	
	display 60/40
	power twomeans 0 0.2 , power(0.8) sd(1)	nratio(1.5)
	
/*------------------------------------------------------------------------------	
	Q: What if 60% of the sample is assigned to the control group?
	A: The required sample size would increase to 820 (328 students in the
	   treatment group and 492 in the control group).
------------------------------------------------------------------------------*/
	
	display 40/60	
	power twomeans 0 0.2 , power(0.8) sd(1)	nratio(0.6666)
	
/*------------------------------------------------------------------------------	
	Q: What if we want to reduce the probability of a false positive to 1%?
	A: The required sample size would increase to 1,172
------------------------------------------------------------------------------*/
	
	power twomeans 0 0.2 , power(0.8) sd(1) alpha(0.01)
	
********************************************************************************
**#  Power sensitivity tables and curves
********************************************************************************	
	
	power twomeans 0 0.2 , power(0.8) sd(1)
	
/*------------------------------------------------------------------------------
    Q: What if we want to calculate the sample size for effects ranging from
	   0.1 SD to 1 SD?
	A: Use the -graph- or -table- options with the power command
------------------------------------------------------------------------------*/		
	
	power twomeans 0 (0.1(0.1)1), power(0.8) sd(1) graph
	power twomeans 0 (0.1(0.1)1), power(0.8) sd(1)	
	
********************************************************************************
**#  Estimate the minimum treatment effect given a fixed sample size and power
********************************************************************************	
	
/*------------------------------------------------------------------------------
	Underlying assumptions
--------------------------------------------------------------------------------	
	- Study sample size = 1000
	- Statistical power = 80%
	- Variance of the outcome variable: 1 S.D
------------------------------------------------------------------------------*/

	power twomeans 0 , n(1000) power(0.8) sd(1)	
	
/*------------------------------------------------------------------------------
    Q: Which MDEs can we detect with 100, 300, 500, 700, 900 students?
	A: Smaller samples can detect larger effects. As we increase the sample,
	   we're able to detect smaller treatment effects.
------------------------------------------------------------------------------*/

	power twomeans 0 , n(500(250)1500) power(0.8) sd(1) graph
	
/*------------------------------------------------------------------------------
    Q: Which MDEs can we detect if we deviate from the 50/50 sample allocation 
	   to treament and control?
	A: The smallest effect is detected with a 50/50 allocation (or ratio = 1)
------------------------------------------------------------------------------*/

	power twomeans 0 , n(1000) power(0.8) sd(1) nratio(.5(.25)2) graph		

********************************************************************************
**#  Estimate the statistical power given a fixed sample size and MDE
********************************************************************************	
	
/*------------------------------------------------------------------------------
	Underlying assumptions
--------------------------------------------------------------------------------	
	- Study sample size = 1000
	- Effect size = 0.2 S.D
	- Variance of the outcome variable: 1 S.D
------------------------------------------------------------------------------*/

	power twomeans 0 0.2 , n(1000) sd(1)
	
/*------------------------------------------------------------------------------
    Q: What happens to power if we try different sample sizes (smaller and 
	   larger than 1,000)?
	A: Smaller samples lead to less power. As we increase the sample size, we're
	   able to reach a larger probability of avoiding a type II error (false 
	   negative).
------------------------------------------------------------------------------*/
	
	power twomeans 0 0.2 , n(100(100)1000) sd(1) graph

/*------------------------------------------------------------------------------
    Q: What happens to power if we try different effect sizes (smaller and 
	   larger than 0.2)?
	A: Smaller effect sizes are less harder to detect (so less power). If we 
	   expect a larger treatment effect, we have more power.
------------------------------------------------------------------------------*/
	
	power twomeans 0 (0.05(0.05)0.3) , n(1000) sd(1) graph
	