#' update the operating model for European lobster in Welsh waters 
#' 
#' @fore_em A Stock Synthesis forecast list object for om as read in from SS_readforecast
#' @start_em A Stock Synthesis start list object for om as read in from SS_readstarter
#' @dat_em A Stock Synthesis data list object for om as read in from SS_readdat
#' @ctl_em A Stock Synthesis control list object for om as read in from SS_readctl
#' @nyears The number of years to extend for simulations
#' @iter_i An itereation number
#' @nboot The number (nboot-2) of bootstrapped data files to generate for em
#' @ess An effective sample size
#' @new_mod_path_em A directory for Stock Synthesis files of om
#' @sigmaR_dev A multiplier to adjust sigmaR under om scenarios
#' @F_mult A multiplier to adjust fishing mortality under om scenarios
#' @scenario An ID for om-em scenarios
#' @inityr_recdev The initial year to estimate recruitment deviation
#' @inityr_fore The initial year of forecasting
#' @overwrite TRUE or FALSE for overwriting Stock Synthesis files
#' 
update_om <- function(fore_om=fore_om, 
                      start_om=start_om, 
                      dat_om=dat_om, 
                      ctl_om=ctl_om, 
                      nyears=nyears, 
                      iter_i=iter_i,
                      nboot=nboot, 
                      ess=ess, 
                      new_mod_path_om=new_mod_path_om, 
                      sigmaR_dev=sigmaR_dev, 
                      F_mult=F_mult,
                      scenario=scenario, 
                      inityr_recdev=inityr_recdev, 
                      inityr_fore=inityr_fore, 
                      overwrite=TRUE) {
  
  # forecast
  fore_om$Bmark_years <- fore_om$Bmark_years + nyears # update benchmark year for forecasting
  fore_om$FirstYear_for_caps_and_allocations <- fore_om$Bmark_years[1] + 1 # update quota allocation year
  attributes(fore_om$FirstYear_for_caps_and_allocations) <- NULL
  fore_om$ForeCatch$year <- fore_om$FirstYear_for_caps_and_allocations:(fore_om$FirstYear_for_caps_and_allocations+fore_om$Nforecastyrs-1)
  fore_om$ForeCatch$fleet <- 2 
  r4ss::SS_writeforecast(fore_om, dir = new_mod_path_om, overwrite=overwrite)
  
  # starter 
  start_om$seed <- 1234*iter_i # FOR EVERY ITERATION to generate bootstrapped data
  start_om$N_bootstraps <- nboot # number of bootstrapped data files (nboot-1)
  start_om$last_estimation_phase <- 0 # turn off estimation
  start_om$init_values_src <- 0
  start_om$detailed_age_structure <- 1
  start_om$jitter_fraction <- 0 # turn off jutterring in initial values
  start_om$retro_yr <- 0
  start_om$F_std_units <- 1
  start_om$F_std_basis <- 0
  r4ss::SS_writestarter(start_om, dir = new_mod_path_om, overwrite=overwrite)
  
  # data 
  # data quality scenarios - varying effective sample size (ESS)
  dat_om$lencomp$Nsamp <- ess
  r4ss::SS_writedat(dat_om, outfile = file.path(new_mod_path_om, "ss3.dat"), overwrite=overwrite)
  
  # control
  # generate & replace recdev for each iteration
  recdevs <- ss3sim::get_recdevs(iteration = iter_i, 
                                 n = dat_om$endyr-(dat_om$styr-12)+1+fore_om$Nforecastyrs, 
                                 seed=iter_i*1234)
  
  # update sigmaR for sigmaR scenarios 
  ctl_om$SR_parms$INIT[3] <- ctl_om$SR_parms$INIT[3] * sigmaR_dev 
  r4ss::SS_writectl(ctl_om, 
                    outfile = file.path(new_mod_path_om, "control.ss_NEW"), overwrite=TRUE)
  recdevs <- stats::setNames(ctl_om$SR_parms$INIT[3] * recdevs - ctl_om$SR_parms$INIT[3]^2/2, 
                             (dat_om$styr-12):(dat_om$endyr+fore_om$Nforecastyrs))
  
  # update recdev in om.ctl file for OMs 
  ss3sim::change_rec_devs(recdevs, 
                          ctl_file_in = file.path(new_mod_path_om, "control.ss_NEW"),
                          ctl_file_out = paste0(scenario, "/", iter_i, "/om/", "control_recruitment.ss"))
  ctl_om <- r4ss::SS_readctl(file = file.path(new_mod_path_om, "control_recruitment.ss"), verbose = FALSE, 
                             use_datlist = TRUE, datlist = dat_om)
  ctl_om$recdev_input <- ctl_om$recdev_input |> 
    dplyr::filter(Year >= inityr_recdev) 
  ctl_om$N_Read_recdevs <- nrow(ctl_om$recdev_input)
  
  # update F values for future F scenarios for fleets:3,4,5,7,8 -> historical values are externally estimated & unchanged
  ctl_om$F_setup2$Fvalue[ctl_om$F_setup2$year>=inityr_fore] <- ctl_om$F_setup2$Fvalue[ctl_om$F_setup2$year>=inityr_fore] * F_multi # modify only after 2024

  r4ss::SS_writectl(ctl_om, outfile = file.path(new_mod_path_om, "ss3.ctl"), overwrite=overwrite)
}
