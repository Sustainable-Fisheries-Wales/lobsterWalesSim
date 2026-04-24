#' generate a scenario id for model folders natural mortality (m), steepness (st), selectivity (sl), asymptotic length (linf), and effective 
#' sample size (ess) that produce -/+ 10% bias in spawning stock biomass estimates in the terminal year in EM parameter 
#' misspecification scenarios for each OM scenario with varying fishing mortality and recruitment variability (sigmaR)
#' 
#' @scenario_m a flag for natural mortality misspecification (0=base, -1=underestimation, 1=overestimation)
#' @scenario_st a flag for steepness
#' @scenario_sl a flag for selectivity
#' @scenario_linf a falg for asymptotic length
#' @scenario_ess a flag for effective sample size for size composition data
#' @scenario_om scenario id for om
#' 
#' 
scenario_id <- function(scenario_m = scenario_m, 
                        scenario_st = scenario_st, 
                        scenario_sl = scenario_sl, 
                        scenario_linf = scenario_linf, 
                        scenario_ess = scenario_ess, 
                        scenario_om = scenario_om) {
  
  if (scenario_om==0) { f_scen <- 0; r_scen <- 0 } # 0=base; 1=lower; 2=higher
  if (scenario_om==1) { f_scen <- 1; r_scen <- 1 } 
  if (scenario_om==2) { f_scen <- 1; r_scen <- 0 }
  if (scenario_om==3) { f_scen <- 1; r_scen <- 2 }
  if (scenario_om==4) { f_scen <- 2; r_scen <- 1 }
  if (scenario_om==5) { f_scen <- 2; r_scen <- 0 }
  if (scenario_om==6) { f_scen <- 2; r_scen <- 2 }
  if (scenario_m==0) { m_scen <- 0; est_scen <- 0 } 
  if (scenario_m==-1) { m_scen <- 1; est_scen <- 1 } 
  if (scenario_m==1) { m_scen <- 2; est_scen <- 1 } 
  if (scenario_st==0) { st_scen <- 0; est_scen <- 0 } 
  if (scenario_st==-1) { st_scen <- 1; est_scen <- 1 } 
  if (scenario_st==1) { st_scen <- 2; est_scen <- 1 } 
  if (scenario_sl==0) { sl_scen <- 0; est_scen <- 0 } 
  if (scenario_sl==-1) { sl_scen <- 1; est_scen <- 1 } 
  if (scenario_sl==1) { sl_scen <- 2; est_scen <- 1 } 
  if (scenario_linf==0) { g_scen <- 0; est_scen <- 0 } 
  if (scenario_linf==-1) { g_scen <- 1; est_scen <- 1 } 
  if (scenario_linf==1) { g_scen <- 2; est_scen <- 1 } 
  if (scenario_ess==0) { data_scen <- 0 } 
  if (scenario_ess==-1) { data_scen <- 1 } 
  if (scenario_ess==1) { data_scen <- 2 }
  
  x_scen  <- 0 # tv
  
  return(c(data_scen, est_scen, f_scen, r_scen, x_scen, m_scen, st_scen, sl_scen, g_scen))
}
