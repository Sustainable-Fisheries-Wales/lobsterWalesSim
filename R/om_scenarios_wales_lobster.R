#' identify OM scenario to set multiplier values for fishing mortality and recruitment deviation (F_multi, sigmaR_dev)
#' @scenario_om scenario id for OM
#' 
#' 
om_scenario <- function(scenario_om = scenario_om) {
  
  if (scenario_om==0) { F_multi <- 1; sigmaR_dev <- 1 }
  if (scenario_om==1) { F_multi <- 0.5; sigmaR_dev <- 0.25 }
  if (scenario_om==2) { F_multi <- 0.5; sigmaR_dev <- 0.95 }
  if (scenario_om==3) { F_multi <- 0.5; sigmaR_dev <- 2.125 }
  if (scenario_om==4) { F_multi <- 1.5; sigmaR_dev <- 0.25 }
  if (scenario_om==5) { F_multi <- 1.5; sigmaR_dev <- 0.95 }
  if (scenario_om==6) { F_multi <- 1.5; sigmaR_dev <- 2.125 }
  
  return(c(F_multi, sigmaR_dev))
}
