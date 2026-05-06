# simulation testing for the stock assessment model of European lobster in Welsh waters

# a.OM scenarios
# 1.varying fishing mortality (F:high, low)
# 2.varying variance in stock productivity (V:high, meidum, low)

# EM scenarios (for each OM scenario)
# misspecification (low or high) in:
# 1.natural mortality 
# 2.steepness
# 3.selectivity params (length-at-50% selectivity)
# 4.asymptotic length (growth param)
# 5.varying effective sample size (ESS)

# check if required packages are installed
required <- c("ss3sim", "r4ss", "foreach", "doParallel", "stats", "dplyr", "pak")
installed <- rownames(installed.packages())
(not_installed <- required[!required %in% installed])
install.packages(not_installed[!not_installed %in% c("r4ss", "ss3sim")], dependencies = TRUE)
if (not_installed %in% "r4ss") {pak::pkg_install("r4ss/r4ss")}
if (not_installed %in% "ss3sim") {pak::pkg_install("ss3sim/ss3sim")}


# load functions to condition base, set om & em scenarios,and update om & em
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source("condition_base_wales_lobster.R")
source("om_scenarios_wales_lobster.R")
source("em_scenarios_wales_lobster.R")
source("generate_om_em_id.R")
source("update_om_wales_lobster.R")
source("update_em_wales_lobster.R")


# set up the base model
setwd("..")
dir.main <- getwd()
dir.base <- file.path(dir.main, "base_model")
nyears <- 50 # n of forecasting simulation years
nboot <- 3 # n of bootstrapped data files
niter <- nboot
ss3exe <- file.path(dir.main, "ss3_win.exe")
extras_om <- " -nohess" # if not estimating parameters
extras_em <- " " # if estimating parameters

# condition base model files
fore_base <- r4ss::SS_readforecast(file = file.path(dir.base, "forecast.ss"), verbose = FALSE)
start_base <- r4ss::SS_readstarter(file = file.path(dir.base, "starter.ss"),  verbose = FALSE)
dat_base <- r4ss::SS_readdat(file = file.path(dir.base, "data.ss"), verbose = FALSE)
ctl_base <- r4ss::SS_readctl(file = file.path(dir.base, "control.ss"), verbose = FALSE, use_datlist = TRUE, datlist = dat_base)

condition_base(fore_base = fore_base, 
               start_base = start_base, 
               dat_base = dat_base, 
               ctl_base = ctl_base, 
               dir.base = dir.base, 
               nyears = nyears, 
               datfile = "ss3.dat", 
               ctlfile = "ss3.ctl",
               fleet_catch = c(2:8), 
               fleet_cpue = unique(dat_base$CPUE$index), 
               fleet_discard = c(1,2,3), 
               len_sex = 3, 
               len_Nsamp = 1, 
               dat_month = 7,
               fleet_obs = 1, 
               fleet_historical = c(2, 6), 
               fleet_target = c(3, 4, 5), 
               fleet_bycatch = c(7, 8), 
               fleet_prerecruit = 9,
               len_part = c(0), 
               F_Method = 2,  
               overwrite = TRUE) 

# test base model
r4ss::copy_SS_inputs(dir.old = dir.base, 
                     dir.new = "test_base_model_dir", 
                     overwrite = TRUE)
r4ss::run(dir = "test_base_model_dir", 
          extras = extras_om, 
          exe = ss3exe, 
          skipfinished = FALSE, 
          show_in_console = FALSE) # switch to FALSE when not testing


#~~~~~~~~~~~~~~~~~~~~~~~~~
# select scenarios options
# OM scenarios
# SCENARIO0: obs F & est sigmaR (0.44)
# SCENARIO1: low F & low sigmaR
# SCENARIO2: low F & mid sigmaR
# SCENARIO3: low F & high sigmaR
# SCENARIO4: high F & low sigmaR
# SCENARIO5: high F & mid sigmaR
# SCENARIO6: high F & high sigmaR
# select om scenario

# EM scenarios (specific to OM scenario)
# modify param values for misspecification scenarios: Value that results in ~10% decrease/increase in terminal SSB
# select em scenario; 0 (base) to 1 or -1
scenario_em <- matrix(c(0,  0,  0,  0,
                        1,	0,	0,	0,
                        0,	1,	0,	0,
                        0,	0,	1,	0,
                        0,	0,	0,	1,
                        1,	1,	0,	0,
                        1,	0,	1,	0,
                        1,	0,	0,	1,
                        0,	1,	1,	0,
                        0,	1,	0,	1,
                        0,	0,	1,	1,
                        1,	1,	1,	0,
                        1,	0,	1,	1,
                        0,	1,	1,	1,
                        1,	1,	0,	1,
                        1,	1,	1,	1), nrow = 4, ncol = 16)
rownames(scenario_em) <- c("m", "st", "sl", "linf")
colnames(scenario_em) <- 1:16

scenario_om <- 0 # 0 (base) to 6
(F_multi <- om_scenario(scenario_om)[1])
(sigmaR_dev <- om_scenario(scenario_om)[2])

iteration <- 100
extra_cores <- 4

# run simulations though em scenarios
for (scen_em in 1:ncol(scenario_em)) {
  seed1 <- 1234*scen_em
  set.seed(seed1)
  cat("OM scenario:", scenario_om, "; EM scenario:", scen_em)
  
  scenario_m <- scenario_em[1, scen_em] * sample(c(-1,1), replace=TRUE, size=1) # natural mortality 
  scenario_st <- scenario_em[2, scen_em] * sample(c(-1,1), replace=TRUE, size=1) # steepness
  scenario_sl <- scenario_em[3, scen_em] * sample(c(-1,1), replace=TRUE, size=1) # selectivity (retention curve inflection)
  scenario_linf <- scenario_em[4, scen_em] * sample(c(-1,1), replace=TRUE, size=1) # growth (asymptotic length, Linf)
  scenario_ess <- 0 # effective sample size for size comp data 
  
  # 1.natural mortality 
  (m_mult1 <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                          scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[1])
  (m_mult2 <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                          scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[2])
  
  # 2.steepness -> estimated -> change & fix
  (steep_mult <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                             scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[3])
  (steep_phase <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                              scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[4])
  
  # 3.selectivity params -> estimated -> change & fix
  (sel_mult1 <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                            scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[5])
  (sel_mult2 <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                            scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[6])
  (sel_mult3 <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                            scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[7])
  (sel_phase <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                            scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[8])
  
  # 4.asymptotic length (growth param Linf)
  (linf_mult1 <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                             scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[9])
  (linf_mult2 <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                             scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[10])
  
  # effective sample size for lencomp
  (ess <- em_scenario(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                      scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)[11])

  # create a new om folder
  scenarioID <- scenario_id(scenario_m=scenario_m, scenario_st=scenario_st, scenario_sl=scenario_sl, 
                            scenario_linf=scenario_linf, scenario_ess=scenario_ess, scenario_om=scenario_om)
  stock <- "wales"
  species <- "lobster"
  print(scenario_name <- paste0("0D", scenarioID[1], "-E", scenarioID[2], "-F", scenarioID[3], "-R", scenarioID[4], "-X", scenarioID[5],   
                                "-M", scenarioID[6], "-St", scenarioID[7], "-Sl", scenarioID[8], "-G", scenarioID[9],  
                                "-", stock, "-", species))
  scenario <- scenario_name 

    
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # run simulations in parallel
  # Setup parallel cores and iterations to run
  # clean up clusters
  unregister_dopar <- function() {
      env <- foreach:::.foreachGlobals
    rm(list = ls(name = env), pos = env)
  }
  unregister_dopar()
  closeAllConnections()
  
  # set up clusters
  require(doParallel)
  Sys.getenv("NUMBER_OF_PROCESSORS")
  cl <- makeCluster(as.numeric(Sys.getenv("NUMBER_OF_PROCESSORS")) - extra_cores, outfile="", type = "SOCK")
  doSNOW::registerDoSNOW(cl)

  # Create a progress bar
  pb <- txtProgressBar(min = 0, max = 10, style = 3)
  # Progress function to update the bar
  progress <- function(n) {
    setTxtProgressBar(pb, n)
  }
  # Export the progress function to workers
  opts <- list(progress = progress)
 
  system.time(foreach::foreach(iter_i = 1:iteration, .options.snow = opts) %dopar% { 
    seed <- 1234*iter_i
    set.seed(seed)
    
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # OM
    # 1.create a new directory to put a modified model
    mod_path <- file.path(dir.main, scenario, iter_i)
    dir.create(file.path(mod_path), showWarnings = FALSE, recursive = TRUE)
    new_mod_path_om <- file.path(mod_path, "om")
    
    # 2.copy over the base model files from mod_path to new_mod_path
    r4ss::copy_SS_inputs(dir.old = dir.base, dir.new = new_mod_path_om, overwrite = TRUE)
    
    # 3.read in input files
    start_om <- r4ss::SS_readstarter(file = file.path(new_mod_path_om, "starter.ss"),  verbose = FALSE)
    dat_om <- r4ss::SS_readdat(file = file.path(new_mod_path_om, "ss3.dat"), verbose = FALSE)
    ctl_om <- r4ss::SS_readctl(file = file.path(new_mod_path_om, "ss3.ctl"), verbose = FALSE, use_datlist = TRUE, datlist = dat_om)
    fore_om <- r4ss::SS_readforecast(file = file.path(new_mod_path_om, "forecast.ss"), verbose = FALSE)
    
    # 4.update om files
    update_om(fore_om = fore_om, 
              start_om = start_om, 
              dat_om = dat_om, 
              ctl_om = ctl_om, 
              new_mod_path_om = new_mod_path_om,
              nyears = nyears, 
              iter_i = iter_i, 
              nboot = nboot,
              ess = ess, 
              sigmaR_dev = sigmaR_dev, 
              F_mult = F_mult, 
              scenario = scenario,
              inityr_recdev = 1983, 
              inityr_fore = 2025,
              overwrite = TRUE)

    # run om to generate bootstrapped dat file
    r4ss::run(dir = new_mod_path_om, 
              extras = extras_om, 
              exe = ss3exe, 
              skipfinished = FALSE, 
              show_in_console = FALSE) # switch to FALSE when not testing


    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # EM
    # 0.create a new directory to put a modified model
    new_mod_path_em <- file.path(mod_path, "em")
    dir.create(file.path(new_mod_path_em), showWarnings = FALSE, recursive = TRUE)
    
    # 1.copy over the model files from mod_path to new_mod_path
    files2copy <- list.files(new_mod_path_om, all.files = TRUE, full.names = TRUE)
    ss_modelfiles <- file.copy(from = files2copy, to = new_mod_path_em, overwrite = TRUE)

    # 2.read in input files
    start_em <- r4ss::SS_readstarter(file = file.path(new_mod_path_em, "starter.ss_new"),  verbose = FALSE)
    dat_em <- r4ss::SS_readdat(file = file.path(new_mod_path_om, "data_boot_001.ss"), verbose = FALSE) 
    ctl_em <- r4ss::SS_readctl(file = file.path(new_mod_path_em, "control.ss_new"), verbose = FALSE, use_datlist = TRUE, datlist = dat_em)
    fore_em <- r4ss::SS_readforecast(file = file.path(new_mod_path_em, "forecast.ss_new"), verbose = FALSE)
    
    # 3.update em files
    update_em(fore_em = fore_em, 
              start_em = start_em, 
              dat_em = dat_em, 
              ctl_em = ctl_em, 
              new_mod_path_em = new_mod_path_em,
              recdev_early = 1938,
              m_mult1 = m_mult1, 
              m_mult2 = m_mult2,
              steep_mult = steep_mult, 
              steep_phase = steep_phase,
              sel_mult1 = sel_mult1, 
              sel_phase1 = sel_phase1, 
              sel_mult2 = sel_mult2, 
              sel_phase2 = sel_phase2,
              sel_mult3 = sel_mult3, 
              sel_phase3 = sel_phase3,
              linf_mult = linf_mult, 
              linf_phase = linf_phase,
              overwrite = TRUE)
    
    # run em  
    r4ss::run(dir = new_mod_path_em, 
              extras = extras_em, 
              exe = ss3exe, 
              skipfinished = FALSE,
              show_in_console = FALSE) # switch to FALSE when not testing

  })
  
  # stop the cluster
  stopCluster(cl)
}
