#' update the estimation model for European lobster in Welsh waters 
#' 
#' @fore_em A Stock Synthesis forecast list object for em as read in from SS_readforecast
#' @start_em A Stock Synthesis start list object for em as read in from SS_readstarter
#' @dat_em A Stock Synthesis data list object for em as read in from SS_readdat
#' @ctl_em A Stock Synthesis control list object for em as read in from SS_readctl
#' @recdev_early An earliest year for recruitment deviation estimation
#' @new_mod_path_em A directory for Stock Synthesis files of em
#' @m_mult1 A multiplier for female natural mortality under parameter misspecification scenarios
#' @m_mult2 A multiplier for male natural mortality under parameter misspecification scenarios
#' @steep_mult A multiplier for steepness under parameter misspecification scenarios
#' @steep_phase A parameter estimation phase for steepness in Stock Synthesis
#' @sel_mult1 A multiplier for female natural mortality under parameter misspecification scenarios
#' @sel_phase1 A parameter estimation phase for length-at-50% selectivity for fleet1 in Stock Synthesis
#' @sel_mult2 A multiplier for length-at-50% selectivity for fleet1 under parameter misspecification scenarios
#' @sel_phase2 A parameter estimation phase for length-at-50% selectivity for fleet2 in Stock Synthesis
#' @sel_mult3 A multiplier for length-at-50% selectivity for fleet2 under parameter misspecification scenarios
#' @sel_phase3 A parameter estimation phase for length-at-50% selectivity for fleet3 in Stock Synthesis
#' @linf_mult A multiplier for length-at-50% selectivity for fleet3 under parameter misspecification scenarios
#' @linf_phase A parameter estimation phase for Linf in Stock Synthesis
#' @overwrite TRUE or FALSE for overwriting Stock Synthesis files
#' 
#' 
update_em <- function(fore_em=fore_em, 
                      start_em=start_em, 
                      dat_em=dat_em, 
                      ctl_em=ctl_em, 
                      recdev_early=recdev_early,
                      new_mod_path_em=new_mod_path_em, 
                      m_mult1=m_mult1, 
                      m_mult2=m_mult2, 
                      steep_mult=steep_mult, 
                      steep_phase=steep_phase, 
                      sel_mult1=sel_mult1, 
                      sel_phase1=sel_phase1, 
                      sel_mult2=sel_mult2, 
                      sel_phase2=sel_phase2, 
                      sel_mult3=sel_mult3, 
                      sel_phase3=sel_phase3, 
                      linf_mult=linf_mult, 
                      linf_phase=linf_phase, 
                      overwrite=TRUE) {
  
  # forecast
  r4ss::SS_writeforecast(fore_em, dir = new_mod_path_em, writeAll = FALSE, overwrite = overwrite, verbose = FALSE)
  
  # starter  
  start_em$cumreport <- 1
  start_em$last_estimation_phase <- 100 # activate parameter estimation
  r4ss::SS_writestarter(start_em, dir = new_mod_path_em, overwrite=overwrite)
  
  # data
  dat_em$fleetinfo$need_catch_mult <- 0 # remove catch multiplier flags
  r4ss::SS_writedat(dat_em, outfile = file.path(new_mod_path_em, "ss3.dat"), overwrite=overwrite)
  
  # control  
  ctl_em$recdev_early_start <- recdev_early 
  ctl_em$first_yr_fullbias_adj <- ctl_em$last_early_yr_nobias_adj + 1
  ctl_em$last_yr_fullbias_adj <- round(dat_em$endyr - dat_em$Nages/4)
  ctl_em$first_recent_yr_nobias_adj <- dat_em$endyr - 1
  ctl_em$max_bias_adj <- 0.9
  ctl_em$min_rec_dev <- -10
  ctl_em$max_rec_dev <- 10
  
  # remove prefixed recdevs to estimate
  ctl_em$N_Read_recdevs <- 0
  ctl_em$recdev_input <- NULL
  ctl_em$recdev_early_phase <- abs(ctl_em$recdev_early_phase) 
  ctl_em$do_recdev <- 3
  ctl_em$MainRdevYrLast <- dat_em$endyr 
  
  # switch F_method to estimate F based on catch
  ctl_em$F_Method <- 3 
  ctl_em$F_setup <- NULL
  ctl_em$F_setup2 <- NULL
  ctl_em$F_4_Fleet_Parms <- NULL
  ctl_em$F_iter <- 4
  
  # remove catch multipliers & effective sample size
  ctl_em$MG_parms <- ctl_em$MG_parms[-(22:23),]
  ctl_em$MG_parms_tv <- NULL
  ctl_em$Variance_adjustment_list$value[ctl_em$Variance_adjustment_list$factor==4] <- 1
  
  # param misspecification scenarios
  # 1.natural mortality
  ctl_em$MG_parms$INIT[1] <- ctl_em$MG_parms$INIT[1] * m_mult1
  ctl_em$MG_parms$INIT[13] <- ctl_em$MG_parms$INIT[13] * m_mult2
  
  # 2.steepness -> estimated -> change & fix
  ctl_em$SR_parms$INIT[2] <- ctl_em$SR_parms$INIT[2] * steep_mult
  ctl_em$SR_parms$PHASE[2] <- ctl_em$SR_parms$PHASE[2] * steep_phase
  
  # 3.selectivity params -> estimated -> change & fix
  ctl_em$size_selex_parms$INIT[7] <- ctl_em$size_selex_parms$INIT[7] * sel_mult1
  ctl_em$size_selex_parms$LO[7] <- ctl_em$size_selex_parms$LO[7] * sel_mult1
  ctl_em$size_selex_parms$HI[7] <- ctl_em$size_selex_parms$HI[7] * sel_mult1 
  ctl_em$size_selex_parms$PHASE[7] <- ctl_em$size_selex_parms$PHASE[7] * sel_phase
  ctl_em$size_selex_parms$INIT[26] <- ctl_em$size_selex_parms$INIT[26] * sel_mult2
  ctl_em$size_selex_parms$LO[26] <- ctl_em$size_selex_parms$LO[26] * sel_mult2
  ctl_em$size_selex_parms$HI[26] <- ctl_em$size_selex_parms$HI[26] * sel_mult2
  ctl_em$size_selex_parms$PHASE[26] <- ctl_em$size_selex_parms$PHASE[26] * sel_phase
  ctl_em$size_selex_parms$INIT[45] <- ctl_em$size_selex_parms$INIT[45] * sel_mult3
  ctl_em$size_selex_parms$LO[45] <- ctl_em$size_selex_parms$LO[45] * sel_mult3
  ctl_em$size_selex_parms$HI[45] <- ctl_em$size_selex_parms$HI[45] * sel_mult3
  ctl_em$size_selex_parms$PHASE[45] <- ctl_em$size_selex_parms$PHASE[45] * sel_phase
  
  # 4.asymptotic length (growth param Linf)
  ctl_em$MG_parms$INIT[3] <- ctl_em$MG_parms$INIT[3] * linf_mult1
  ctl_em$MG_parms$INIT[15] <- ctl_em$MG_parms$INIT[15] * linf_mult2
  
  r4ss::SS_writectl(ctllist = ctl_em, outfile = file.path(new_mod_path_em, "ss3.ctl"), verbose = FALSE, overwrite = overwrite)
}
