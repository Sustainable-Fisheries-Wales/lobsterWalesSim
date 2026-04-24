#' set multiplier values for natural mortality (m), steepness (st), selectivity (sl), asymptotic length (linf), and effective 
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
em_scenario <- function(scenario_m, scenario_st, scenario_sl, scenario_linf, scenario_ess, scenario_om) {
  if (scenario_om==0) {
    # natural mortality
    if (scenario_m==0) { m_mult1 <- 1; m_mult2 <- 1 }
    if (scenario_m==-1) { m_mult1 <- 095; m_mult2 <- 0.95 }
    if (scenario_m==1) { m_mult1 <- 1.05; m_mult2 <- 1.05 }
    # steepness
    if (scenario_st==0) { steep_mult <- 1; steep_phase <- 1 }
    if (scenario_st==-1) { steep_mult <- 0.7; steep_phase <- -1 }
    if (scenario_st==1) { steep_mult <- 1.3; steep_phase <- -1 }
    # selectivity
    if (scenario_sl==0) { sel_mult1 <- 1; sel_mult2 <- 1; sel_mult3 <- 1; sel_phase <- 1 }
    if (scenario_sl==-1) { sel_mult1 <- 0.9; sel_mult2 <- 0.9; sel_mult3 <- 0.9; sel_phase <- -1 }
    if (scenario_sl==1) { sel_mult1 <- 1.2; sel_mult2 <- 1.2; sel_mult3 <- 1.2; sel_phase <- -1 }
    # asymptotic length
    if (scenario_linf==0) { linf_mult1 <- 1; linf_mult2 <- 1 }
    if (scenario_linf==-1) { linf_mult1 <- 0.96; linf_mult2 <- 0.96 }
    if (scenario_linf==1) { linf_mult1 <- 1.08; linf_mult2 <- 1.08 }
    # effective sample size
    if (scenario_ess==0) { ess <- 100 }
    if (scenario_ess==-1) { ess <- 20 }
    if (scenario_ess==1) { ess <- 200 }
  }
  if (scenario_om==1) {
    # natural mortality
    if (scenario_m==0) { m_mult1 <- 1; m_mult2 <- 1 }
    if (scenario_m==-1) { m_mult1 <- 1.15 ; m_mult2 <- 1.15 }
    if (scenario_m==1) { m_mult1 <- 0.87 ; m_mult2 <- 0.87 }
    # steepness
    if (scenario_st==0) { steep_mult <- 1; steep_phase <- 1 }
    if (scenario_st==-1) { steep_mult <- 1.157; steep_phase <- -1 } # not biased enough
    if (scenario_st==1) { steep_mult <- 0.8; steep_phase <- -1 }
    # selectivity
    if (scenario_sl==0) { sel_mult1 <- 1; sel_mult2 <- 1; sel_mult3 <- 1; sel_phase <- 1 }
    if (scenario_sl==-1) { sel_mult1 <- 0.92; sel_mult2 <- 0.92; sel_mult3 <- 0.92; sel_phase <- -1 }
    if (scenario_sl==1) { sel_mult1 <- 1.22; sel_mult2 <- 1.22; sel_mult3 <- 1.22; sel_phase <- -1 }
    # asymptotic length
    if (scenario_linf==0) { linf_mult1 <- 1; linf_mult2 <- 1 }
    if (scenario_linf==-1) { linf_mult1 <- 0.98; linf_mult2 <- 0.98}
    if (scenario_linf==1) { linf_mult1 <- 1.03; linf_mult2 <- 1.03}
    # effective sample size
    if (scenario_ess==0) { ess <- 100 }
    if (scenario_ess==-1) { ess <- 20 }
    if (scenario_ess==1) { ess <- 200 }
  }
  if (scenario_om==2) {
    # natural mortality
    if (scenario_m==0) { m_mult1 <- 1; m_mult2 <- 1 }
    if (scenario_m==-1) { m_mult1 <- 1.4; m_mult2 <- 1.4 }
    if (scenario_m==1) { m_mult1 <- 0.85; m_mult2 <- 0.85 }
    # steepness
    if (scenario_st==0) { steep_mult <- 1; steep_phase <- 1 }
    if (scenario_st==-1) { steep_mult <- 1.157; steep_phase <- -1 } # not biased enough
    if (scenario_st==1) { steep_mult <- 0.47; steep_phase <- -1 }
    # selectivity
    if (scenario_sl==0) { sel_mult1 <- 1; sel_mult2 <- 1; sel_mult3 <- 1; sel_phase <- 1 }
    if (scenario_sl==-1) { sel_mult1 <- 0.98; sel_mult2 <- 0.98; sel_mult3 <- 0.98; sel_phase <- -1 }
    if (scenario_sl==1) { sel_mult1 <- 1.015; sel_mult2 <- 1.015; sel_mult3 <- 1.015; sel_phase <- -1 }
    # asymptotic length
    if (scenario_linf==0) { linf_mult1 <- 1; linf_mult2 <- 1 }
    if (scenario_linf==-1) { linf_mult1 <- 0.97; linf_mult2 <- 0.97 }
    if (scenario_linf==1) { linf_mult1 <- 1.013; linf_mult2 <- 1.013 }
    # effective sample size
    if (scenario_ess==0) { ess <- 100 }
    if (scenario_ess==-1) { ess <- 20 }
    if (scenario_ess==1) { ess <- 200 }
  }
  if (scenario_om==3) {
    # natural mortality
    if (scenario_m==0) { m_mult1 <- 1; m_mult2 <- 1 }
    if (scenario_m==-1) { m_mult1 <- 1.23; m_mult2 <- 1.23 }
    if (scenario_m==1) { m_mult1 <- 0.87; m_mult2 <- 0.87 }
    # steepness
    if (scenario_st==0) { steep_mult <- 1; steep_phase <- 1 }
    if (scenario_st==-1) { steep_mult <- 1.157; steep_phase <- -1 } # not biased enough
    if (scenario_st==1) { steep_mult <- 0.47; steep_phase <- -1 }
    # selectivity
    if (scenario_sl==0) { sel_mult1 <- 1; sel_mult2 <- 1; sel_mult3 <- 1; sel_phase <- 1 }
    if (scenario_sl==-1) { sel_mult1 <- 0.98; sel_mult2 <- 0.98; sel_mult3 <- 0.98; sel_phase <- -1 }
    if (scenario_sl==1) { sel_mult1 <- 1.012; sel_mult2 <- 1.012; sel_mult3 <- 1.012; sel_phase <- -1 }
    # asymptotic length
    if (scenario_linf==0) { linf_mult1 <- 1; linf_mult2 <- 1 }
    if (scenario_linf==-1) { linf_mult1 <- 0.993; linf_mult2 <- 0.993 }
    if (scenario_linf==1) { linf_mult1 <- 1.008; linf_mult2 <- 1.008 }
    # effective sample size
    if (scenario_ess==0) { ess <- 100 }
    if (scenario_ess==-1) { ess <- 20 }
    if (scenario_ess==1) { ess <- 200 }
  }
  if (scenario_om==4) {
    # natural mortality
    if (scenario_m==0) { m_mult1 <- 1; m_mult2 <- 1 }
    if (scenario_m==-1) { m_mult1 <- 1.23; m_mult2 <- 1.23 }
    if (scenario_m==1) { m_mult1 <- 0.87; m_mult2 <- 0.87 }
    # steepness
    if (scenario_st==0) { steep_mult <- 1; steep_phase <- 1 }
    if (scenario_st==-1) { steep_mult <- 1.157; steep_phase <- -1 } # not biased enough
    if (scenario_st==1) { steep_mult <- 0.68; steep_phase <- -1 }
    # selectivity
    if (scenario_sl==0) { sel_mult1 <- 1; sel_mult2 <- 1; sel_mult3 <- 1; sel_phase <- 1 }
    if (scenario_sl==-1) { sel_mult1 <- 0.98; sel_mult2 <- 0.98; sel_mult3 <- 0.98; sel_phase <- -1 }
    if (scenario_sl==1) { sel_mult1 <- 1.005; sel_mult2 <- 1.005; sel_mult3 <- 1.005; sel_phase <- -1 }
    # asymptotic length
    if (scenario_linf==0) { linf_mult1 <- 1; linf_mult2 <- 1 }
    if (scenario_linf==-1) { linf_mult1 <- 0.974; linf_mult2 <- 0.974 }
    if (scenario_linf==1) { linf_mult1 <- 1.07; linf_mult2 <- 1.07 }
    # effective sample size
    if (scenario_ess==0) { ess <- 100 }
    if (scenario_ess==-1) { ess <- 20 }
    if (scenario_ess==1) { ess <- 200 }
  }
  if (scenario_om==5) {
    # natural mortality
    if (scenario_m==0) { m_mult1 <- 1; m_mult2 <- 1 }
    if (scenario_m==-1) { m_mult1 <- 1.185; m_mult2 <- 1.185 }
    if (scenario_m==1) { m_mult1 <- 0.85; m_mult2 <- 0.85 }
    # steepness
    if (scenario_st==0) { steep_mult <- 1; steep_phase <- 1 }
    if (scenario_st==-1) { steep_mult <- 1.157; steep_phase <- -1 } # not biased enough
    if (scenario_st==1) { steep_mult <- 0.7; steep_phase <- -1 }
    # selectivity
    if (scenario_sl==0) { sel_mult1 <- 1; sel_mult2 <- 1; sel_mult3 <- 1; sel_phase <- 1 }
    if (scenario_sl==-1) { sel_mult1 <- 0.988; sel_mult2 <- 0.988; sel_mult3 <- 0.988; sel_phase <- -1 }
    if (scenario_sl==1) { sel_mult1 <- 1.03; sel_mult2 <- 1.03; sel_mult3 <- 1.03; sel_phase <- -1 }
    # asymptotic length
    if (scenario_linf==0) { linf_mult1 <- 1; linf_mult2 <- 1 }
    if (scenario_linf==-1) { linf_mult1 <- 0.994; linf_mult2 <- 0.994 }
    if (scenario_linf==1) { linf_mult1 <- 1.013; linf_mult2 <- 1.013 }
    # effective sample size
    if (scenario_ess==0) { ess <- 100 }
    if (scenario_ess==-1) { ess <- 20 }
    if (scenario_ess==1) { ess <- 200 }
  }
  if (scenario_om==6) {
    # natural mortality
    if (scenario_m==0) { m_mult1 <- 1; m_mult2 <- 1 }
    if (scenario_m==-1) { m_mult1 <- 1.29; m_mult2 <- 1.29 }
    if (scenario_m==1) { m_mult1 <- 0.42; m_mult2 <- 0.42 }
    # steepness
    if (scenario_st==0) { steep_mult <- 1; steep_phase <- 1 }
    if (scenario_st==-1) { steep_mult <- 1.157; steep_phase <- -1 } # not biased enough
    if (scenario_st==1) { steep_mult <- 0.65; steep_phase <- -1 }
    # selectivity
    if (scenario_sl==0) { sel_mult1 <- 1; sel_mult2 <- 1; sel_mult3 <- 1; sel_phase <- 1 }
    if (scenario_sl==-1) { sel_mult1 <- 0.98; sel_mult2 <- 0.98; sel_mult3 <- 0.98; sel_phase <- -1 }
    if (scenario_sl==1) { sel_mult1 <- 1.1; sel_mult2 <- 1.1; sel_mult3 <- 1.1; sel_phase <- -1 }
    # asymptotic length
    if (scenario_linf==0) { linf_mult1 <- 1; linf_mult2 <- 1 }
    if (scenario_linf==-1) { linf_mult1 <- 0.997; linf_mult2 <- 0.997 }
    if (scenario_linf==1) { linf_mult1 <- 1.01; linf_mult2 <- 1.01 }
    # effective sample size
    if (scenario_ess==0) { ess <- 100 }
    if (scenario_ess==-1) { ess <- 20 }
    if (scenario_ess==1) { ess <- 200 }
  }
  return(c(m_mult1, m_mult2, steep_mult, steep_phase, sel_mult1, sel_mult2, sel_mult3, sel_phase, linf_mult1, linf_mult2, ess))
}
