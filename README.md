### lobsterWalesSim
This repository contains code for a simulation testing framework for the stock assessment model (Stock Synthesis, SS3) of European lobster (*Homarus gammarus*) in Welsh waters. The framework consists of an operating model (OM) based on the [2024 stock assessment](https://github.com/Sustainable-Fisheries-Wales/lobsterWales2024/tree/main) and an estimation model (EM) developed using SS3 to evaluate model misspecification (natural mortality, recruitment steepness, length-at-50% selectivity, and asymptotic length) in EM under two levels (low and high) of recruitment variability and fishing mortality scenarios in OM.  


#### Description

R: This folder contains R files for data processing and model-fitting

`simtest_wales_lobster.R`: a script for running simulation testing

`condition_base_wales_lobster.R`: a script for conditioning OM based on the assessment model

`update_om_wales_lobster.R`: a script for updating OM (sigmaR and F)

`update_em_wales_lobster.R`: a script for updating EM (model mispecification)

`om_scenarios_wales_lobster.R`: a script for specifying OM scenarios

`em_scenarios_wales_lobster.R`: a script for specifying EM scenarios

`generate_om_em_id.R`: a script for generating a scenario ID for OM & EM combinations
