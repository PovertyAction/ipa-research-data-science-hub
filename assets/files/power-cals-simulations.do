/*******************************************************************************
  Title:    power-calcs-simulations.do

  Author:   Cristhian Pulido
  Updated:  November 24, 2024
  Version:  Stata 18
*******************************************************************************/

/*------------------------------------------------------------------------------
   Hypothetical study
--------------------------------------------------------------------------------
   -  Treatment aiming to tackle child stunting (e.g., increase children's
      height) targeting 8-10 year old children
   -  Average height control group = 135 cm
   -  SD height = 15 cm (same for both groups)
   -  Treatment/control size ratio = 1
   
   -  Goal: Estimate the statistical power for a total study sample of 2,500
            and a treatment effect (MDE) of 0.1 SD        
------------------------------------------------------------------------------*/

* Declare design parameters

	local n_study      = 2500
	local mde          = 0.1
	local sd_control   = 15
	local mean_control = 135 	
	
* Compute treatment effect (0.1 SD)

	local treat_effect = `mde' * `sd_control'
	dis `treat_effect'
	
* Declare means for treatment groups (adding up the expected treatment effect)

	local mean_treat = `mean_control' + `treat_effect'
	
********************************************************************************
* 1. Power using standard formulae/commands
********************************************************************************

	power twomeans `mean_control' `mean_treat', n(`n_study') sd(`sd_control')

********************************************************************************
* 2 Monte carlo simulations (simulate command)
********************************************************************************

* Create simulations program

	capture program drop simulation_power
	program define simulation_power, rclass
		version 17    
		syntax	
		
		** Declare design parameters

			local n_study      = 2500
			local mde          = 0.1
			local sd_control   = 15
			local mean_control = 135 	
			local treat_ratio  = 1
					
		** Compute treatment effect (0.1 SD)

			local treat_effect = `mde' * `sd_control'
			dis `treat_effect'
			
		** Declare means for treatment groups (adding up the expected treatment effect)

			local mean_treat   = `mean_control' + `treat_effect'
			
			quietly {
				
			   *----------------- Step 4. Generate pseudo-random data --------------
				clear
				set obs `n_study'
				gen id_child = _n
				gen height_child_cm = rnormal(`mean_control',`sd_control')
				gen treatment = (id_child <= `n_study'/2)
			   *-------------------------------------------------------------------
				
				* Step 5. Assign treatment effect to treatment group
				replace height_child_cm = height_child_cm + `treat_effect' if treatment == 1
				
				* Step 6. Estimate treatment effect
				reg height_child_cm treatment
				ttest height_child_cm, by(treatment)
				
				* Step 7. Store estimation output (specifically, the p-value)
				return scalar sig_effect_5per = (r(p) < 0.05)
			}
	end

* Run simulate command and tabulate power (the % of simulations that found a 
* significant treatment effect)
	
	simulate power = r(sig_effect_5per), reps(100) seed(27112024) : simulation_power
	tabstat power 
	 
	simulate power = r(sig_effect_5per), reps(1000) seed(27112024) : simulation_power
	tabstat power 
	 
	simulate power = r(sig_effect_5per), reps(10000) seed(27112024) : simulation_power
	tabstat power	 