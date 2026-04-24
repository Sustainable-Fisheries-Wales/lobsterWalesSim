#' condition the base operating models (OMs) of the Welsh stock of European lobster in simulation testing
#' 
#' @fore_base A Stock Synthesis forecast list object for the base model as read in from SS_readforecast
#' @start_base A Stock Synthesis start list object for the base model as read in from SS_readstarter
#' @dat_base A Stock Synthesis data list object for the base model as read in from SS_readdat
#' @ctl_base A Stock Synthesis control list object for the base model as read in from SS_readctl
#' @dir.base A directory for Stock Synthesis files of the base model
#' @nyears The number of years to extend for simulations
#' @datfile A Stock Synthesis data file name
#' @ctlfile A Stock Synthesis control file name
#' @fleet_catch Fleet numbers for fishing fleets
#' @fleet_cpue Fleet numbers for fleets with catch data
#' @fleet_discard Fleet numbers for fleets with discard data
#' @len_sex A key for data aggregation by sex in length composition data
#' @len_Nsamp An effective sample size for length composition data
#' @dat_month A month for simulated data collection
#' @fleet_obs Fleet numbers for observer sampling 
#' @fleet_historical Fleet numbers for historical fleets
#' @fleet_target Fleet numbers for target fishing fleets
#' @fleet_bycatch Fleet numbers for bycatch fishing fleets
#' @fleet_prerecruit Fleet numbers for fleets with precruit data
#' @len_part A key for data aggregation by partition in length composition data
#' @F_Method A key for fishing mortality estimation method in control 
#' @overwrite TRUE or FALSE for overwriting Stock Synthesis files
#' 
condition_base <- function(fore_base=fore_base, 
                           start_base=start_base, 
                           dat_base=dat_base, 
                           ctl_base=ctl_base, 
                           dir.base=dir.base, 
                           nyears=nyears, 
                           datfile="ss3.dat", 
                           ctlfile="ss3.ctl" ,
                           fleet_catch=c(2:8), 
                           fleet_cpue=c(1,3,4,5,8,9), 
                           fleet_discard=c(1,2,3), 
                           len_sex=3, 
                           len_Nsamp=100, 
                           dat_month=7,
                           fleet_obs=1, 
                           fleet_historical=c(2, 6), 
                           fleet_target=c(3, 4, 5), 
                           fleet_bycatch=c(7, 8), 
                           fleet_prerecruit=9,
                           len_part=c(0), 
                           F_Method=2,
                           overwrite=TRUE) {
  
  # forecast
  fore_base$Do_West_Coast_gfish_rebuilder_output <- 0
  fore_base$Fcast_years$st_year <- c(-3, -3, -999, -3, -5)
  fore_base$Fcast_years$end_year <- c(0, 0, 0, 0, 0)
  r4ss::SS_writeforecast(fore_base, dir = dir.base, overwrite=overwrite)
  
  # starter
  start_base$datfile <- datfile
  start_base$ctlfile <- ctlfile
  r4ss::SS_writestarter(start_base, dir = dir.base, overwrite=overwrite)
  
  # data
  cat("styr:"); print(dat_base$styr)
  cat("endyr:"); print(dat_base$endyr) 
  cat("fleetinfo:"); print(dat_base$fleetinfo) 
  cat("lbin_method:"); print(dat_base$lbin_method) 
  cat("mintailcomp:"); print(dat_base$len_info$mintailcomp) 
  cat("addtocomp:"); print(dat_base$len_info$addtocomp) 

  # expand time series for the sim years 
  fleet_obs <- fleet_obs
  fleet_historical <- fleet_historical
  fleet_target <- fleet_target
  fleet_bycatch <- fleet_bycatch
  fleet_prerecruit <- fleet_prerecruit
  fleet_len <- unique(dat_base$lencomp$fleet) 
  len_part <- len_part # 0=all; 1=discard; 2=retained
  
  # catch
  catch_expand <- NULL
  for (fleet in fleet_catch) { # fleet# to update
    if (fleet %in% fleet_historical) { # historical fleets are not extended
      catch_expand <- dplyr::bind_rows(catch_expand, dat_base$catch[dat_base$catch$fleet==fleet,])
    } else {
      default_catch <- data.frame(year = (dat_base$endyr+1):(dat_base$endyr+nyears),
                                  seas = 1,
                                  fleet = fleet,
                                  catch = 1,
                                  catch_se = 0.01)
      catch_expand <- dplyr::bind_rows(catch_expand, dat_base$catch[dat_base$catch$fleet==fleet,], default_catch)
    }
  }
  
  # cpue
  cpue_expand <- NULL
  for (fleet in fleet_cpue) { 
    if (fleet %in% c(fleet_obs)) { # 1,3,9; limit data to reduce computing time
      default_cpue <- data.frame(year = (dat_base$endyr+1):(dat_base$endyr+nyears),
                                 month = dat_month,
                                 index = fleet,
                                 obs = 0.001,
                                 se_log = mean(dat_base$CPUE[dat_base$CPUE$index==fleet,]$se_log, na.rm = TRUE))
      cpue_expand <- dplyr::bind_rows(cpue_expand, dat_base$CPUE[dat_base$CPUE$index==fleet,], default_cpue)
    } else # historical fleets are not extended
      cpue_expand <- dplyr::bind_rows(cpue_expand, dat_base$CPUE[dat_base$CPUE$index==fleet,])
  }
  
  # discard 
  discard_expand <- NULL
  for (fleet in fleet_discard) {
    if (fleet %in% c(fleet_obs)) { 
      default_discard <- data.frame(year = (dat_base$endyr+1):(dat_base$endyr+nyears),
                                    month = dat_month,
                                    fleet = fleet,
                                    obs = 0.001,
                                    stderr = mean(dat_base$discard_data[dat_base$discard_data$fleet==fleet,]$stderr, na.rm = TRUE))
      discard_expand <- dplyr::bind_rows(discard_expand, dat_base$discard_data[dat_base$discard_data$fleet==fleet,], default_discard)
    } else
      discard_expand <- dplyr::bind_rows(discard_expand, dat_base$discard_data[dat_base$discard_data$fleet==fleet,])
  }
  
  # lencomp
  lencomp_expand <- NULL
  for (fleet in fleet_len) { 
    lencomp_expand <- dplyr::bind_rows(lencomp_expand, dat_base$lencomp[dat_base$lencomp$fleet==fleet,])
    if (fleet %in% c(fleet_obs)) { # reduce some lencomp to reduce comp time
      for (part in c(len_part)) { # 0=all; 1=discard; 2=retained
        default_lencomp <- data.frame(year = (dat_base$endyr+1):(dat_base$endyr+nyears),
                                      month = dat_month,
                                      fleet = fleet,
                                      sex = len_sex,
                                      part = part,
                                      Nsamp = len_Nsamp)
        temp_matrix <- matrix(1, nrow=nyears, ncol=length(colnames(dat_base$lencomp))-6)
        colnames(temp_matrix) <- colnames(dat_base$lencomp)[7:length(colnames(dat_base$lencomp))]
        default_lencomp <- dplyr::bind_cols(default_lencomp, temp_matrix)
        lencomp_expand <- dplyr::bind_rows(lencomp_expand, default_lencomp)
      }
    }
  }
  
  # update data
  dat_base$catch <- catch_expand
  dat_base$CPUE <- cpue_expand
  dat_base$discard_data <- discard_expand
  dat_base$lencomp <- lencomp_expand
  cat("endyr:"); pprint(dat_base$endyr <- dat_base$endyr + nyears) # adding forecast/sim years 

  r4ss::SS_writedat(dat_base, outfile = file.path(dir.base, "ss3.dat"), overwrite=overwrite)

  # control
  # #model yrs in the control file > #sim yrs 
  if (max(ctl_base$recdev_input$Year) > (dat_base$endyr)) {
    ctl_base$recdev_input <- ctl_base$recdev_input |>
      dplyr::filter(Year <= (dat_base$endyr+fore_base$Nforecastyrs))
  } 
  if (max(ctl_base$F_setup2$year) > (dat_base$endyr)) {
    ctl_base$F_setup2 <- ctl_base$F_setup2 |>
      dplyr::filter(year <= dat_base$endyr)
  }

  ctl_base$time_vary_adjust_method <- 1
  ctl_base$do_recdev <- 1
  ctl_base$recdev_adv <- 1
  ctl_base$recdev_early_start <- 0
  ctl_base$lambda4Fcast_recr_like <- 1
  ctl_base$max_bias_adj <- -1
  ctl_base$N_Read_recdevs <- nrow(ctl_base$recdev_input) # update recdev to new model yrs+forecast yrs
  ctl_base$F_ballpark_year <- -2008
  
  # modify F_method from 4 to 2 
  # a. delete F_method=4 options 
  # b. change F_method to 2 and then add the following (after max F) in control 
  # 0.2 1 1 # overall start F value; overall phase; N detailed inputs to read
  ctl_base$F_Method <- F_Method
  ctl_base$F_4_Fleet_Parms <- NULL
  ctl_base$F_setup[1:3] <- 
    c(0.1, 1, (dat_base$endyr-dat_base$styr+1)*sum(abs(dat_base$fleetinfo$surveytiming[dat_base$fleetinfo$surveytiming==-1])))
  ctl_base$F_iter <- NULL
  
  r4ss::SS_writectl(ctl_base, outfile = file.path(dir.base, "ss3.ctl"), overwrite=overwrite)
}
