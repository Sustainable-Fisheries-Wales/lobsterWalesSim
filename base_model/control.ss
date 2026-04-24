#C control file for lobster (wales)
#C file created using an r4ss function
#C file write time: 2026-04-14  19:42:43
#
0 # 0 means do not read wtatage.ss; 1 means read and usewtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
4 # recr_dist_method for parameters
1 # not yet implemented; Future usage:Spawner-Recruitment; 1=global; 2=by area
1 # number of recruitment settlement assignments 
0 # unused option
# for each settlement assignment:
#_GPattern	month	area	age
1	7.5	1	0	#_recr_dist_pattern1
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
2 #_Nblock_Patterns
1 2 #_blocks_per_pattern
#_begin and end years of blocks
1983 1992
1993 1996 1997 2034
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=Maunder_M;_6=Age-range_Lorenzen
#_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr;5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0 #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
3 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
 0.05	     2.4	    0.211	      0.4	 99	0	 -1	0	0	   0	   0	0	0	0	#_NatM_p_1_Fem_GP_1  
    1	       5	  2.22681	        2	 99	0	 -3	0	0	   0	   0	0	0	0	#_L_at_Amin_Fem_GP_1 
    5	      70	  21.5073	    21.23	 99	0	 -3	0	0	   0	   0	0	0	0	#_L_at_Amax_Fem_GP_1 
 0.01	       2	 0.219148	      0.2	 99	0	 -3	0	0	   0	   0	0	0	0	#_VonBert_K_Fem_GP_1 
 0.01	     0.4	 0.171767	     0.17	 99	0	 -3	0	0	   0	   0	0	0	0	#_CV_young_Fem_GP_1  
 0.01	     0.9	 0.152284	     0.15	 99	0	 -3	0	0	   0	   0	0	0	0	#_CV_old_Fem_GP_1    
   -3	       3	0.0005579	0.0005579	 99	0	-99	0	0	   0	   0	0	0	0	#_Wtlen_1_Fem_GP_1   
   -3	       4	   3.1075	   3.1075	 99	0	-99	0	0	   0	   0	0	0	0	#_Wtlen_2_Fem_GP_1   
    1	      15	  9.06393	        9	 99	0	-99	0	0	   0	   0	0	0	0	#_Mat50%_Fem_GP_1    
   -3	       0	 -1.50611	     -1.5	 99	0	-99	0	0	   0	   0	0	0	0	#_Mat_slope_Fem_GP_1 
   -3	      10	        1	        1	 99	0	-99	0	0	   0	   0	0	0	0	#_Eggs_alpha_Fem_GP_1
   -3	      10	        0	        0	 99	0	-99	0	0	   0	   0	0	0	0	#_Eggs_beta_Fem_GP_1 
 0.05	     2.4	    0.211	      0.4	 99	0	 -1	0	0	   0	   0	0	0	0	#_NatM_p_1_Mal_GP_1  
    1	       5	  2.23191	        2	 99	0	 -3	0	0	   0	   0	0	0	0	#_L_at_Amin_Mal_GP_1 
    5	      70	    20.63	    20.63	 99	0	 -3	0	0	   0	   0	0	0	0	#_L_at_Amax_Mal_GP_1 
 0.05	       2	 0.213052	     0.21	 99	0	 -3	0	0	   0	   0	0	0	0	#_VonBert_K_Mal_GP_1 
 0.01	     0.4	 0.190302	     0.18	 99	0	 -3	0	0	   0	   0	0	0	0	#_CV_young_Mal_GP_1  
 0.01	     0.9	 0.131648	     0.13	 99	0	 -3	0	0	   0	   0	0	0	0	#_CV_old_Mal_GP_1    
   -3	       2	0.0005579	0.0005579	 99	0	-99	0	0	   0	   0	0	0	0	#_Wtlen_1_Mal_GP_1   
   -3	       5	   3.1075	   3.1075	 99	0	-99	0	0	   0	   0	0	0	0	#_Wtlen_2_Mal_GP_1   
  0.1	      10	        1	        1	  1	0	 -1	0	0	   0	   0	0	0	0	#_CohortGrowDev      
1e-06	       4	 0.750489	        1	  5	1	  1	0	1	1950	2005	1	0	0	#_Catch_Mult:_2      
1e-06	     4.5	  2.24753	        1	  5	1	  1	0	1	1950	2005	1	0	0	#_Catch_Mult:_6      
1e-06	0.999999	      0.5	      0.5	0.5	0	-99	0	0	   0	   0	0	0	0	#_FracFemale_GP_1    
#_timevary MG parameters
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
1e-06	2	1.51737	0.7	3	1	5	#_Catch_Mult:_2_dev_se      
   -2	1	   -0.5	0.9	1	1	6	#_Catch_Mult:_2_dev_autocorr
1e-06	4	2.00003	0.7	3	1	5	#_Catch_Mult:_6_dev_se      
   -2	1	   -0.5	0.9	1	1	6	#_Catch_Mult:_6_dev_autocorr
# info on dev vectors created for MGparms are reported with other devs after tag parameter section
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; 2=Ricker (2 parms); 3=std_B-H(2); 4=SCAA(2);5=Hockey(3); 6=B-H_flattop(2); 7=Survival(3);8=Shepard(3);9=Ricker_Power(3);10=B-H_a,b(4)
0 # 0/1 to use steepness in initial equ recruitment calculation
0 # future feature: 0/1 to make realized sigmaR a function of SR curvature
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn # parm_name
  1	14	 6.82672	  6.9	 5	3	 1	0	0	0	0	0	0	0	#_SR_LN(R0)  
0.2	 1	0.864082	  0.9	 3	1	 5	0	0	0	0	0	0	0	#_SR_BH_steep
  0	 8	0.473583	  0.4	99	0	-2	0	0	0	0	0	0	0	#_SR_sigmaR  
 -5	 5	       0	    0	99	0	-1	0	0	0	0	0	0	0	#_SR_regime  
  0	 1	       0	0.456	99	0	-2	0	0	0	0	0	0	0	#_SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1983 # first year of main recr_devs; early devs can preceed this era
2024 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase
1 # (0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
4 #_recdev_early_phase
-1 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1980 #_last_yr_nobias_adj_in_MPD; begin of ramp
1983 #_first_yr_fullbias_adj_in_MPD; begin of plateau
2020 #_last_yr_fullbias_adj_in_MPD
2022 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
-1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-5 #min rec_dev
5 #max rec_dev
152 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
#_Year	recdev
1983	  -0.630456	#_recdev_input1  
1984	  -0.459648	#_recdev_input2  
1985	  -0.450856	#_recdev_input3  
1986	  -0.202641	#_recdev_input4  
1987	   0.250029	#_recdev_input5  
1988	   0.234664	#_recdev_input6  
1989	  -0.823351	#_recdev_input7  
1990	  0.0557428	#_recdev_input8  
1991	  -0.697278	#_recdev_input9  
1992	 0.00410812	#_recdev_input10 
1993	   0.398704	#_recdev_input11 
1994	  -0.920536	#_recdev_input12 
1995	  -0.302456	#_recdev_input13 
1996	   0.274602	#_recdev_input14 
1997	  -0.480599	#_recdev_input15 
1998	  -0.178757	#_recdev_input16 
1999	    0.17392	#_recdev_input17 
2000	  -0.579354	#_recdev_input18 
2001	  -0.298741	#_recdev_input19 
2002	  -0.169639	#_recdev_input20 
2003	   0.110975	#_recdev_input21 
2004	  -0.552986	#_recdev_input22 
2005	  -0.958595	#_recdev_input23 
2006	  -0.646692	#_recdev_input24 
2007	   -0.55393	#_recdev_input25 
2008	  -0.425195	#_recdev_input26 
2009	   0.760458	#_recdev_input27 
2010	  -0.260512	#_recdev_input28 
2011	  -0.224721	#_recdev_input29 
2012	  -0.196694	#_recdev_input30 
2013	  -0.176677	#_recdev_input31 
2014	   0.773214	#_recdev_input32 
2015	   0.374814	#_recdev_input33 
2016	 -0.0310189	#_recdev_input34 
2017	     0.1854	#_recdev_input35 
2018	  -0.135798	#_recdev_input36 
2019	  -0.391491	#_recdev_input37 
2020	   0.141266	#_recdev_input38 
2021	  -0.434981	#_recdev_input39 
2022	   0.401179	#_recdev_input40 
2023	  -0.523319	#_recdev_input41 
2024	   0.365254	#_recdev_input42 
2025	   0.242456	#_recdev_input43 
2026	   0.460726	#_recdev_input44 
2027	  -0.512983	#_recdev_input45 
2028	  -0.612542	#_recdev_input46 
2029	 -0.0666987	#_recdev_input47 
2030	   0.124599	#_recdev_input48 
2031	   0.260913	#_recdev_input49 
2032	   -0.63419	#_recdev_input50 
2033	 -0.0668169	#_recdev_input51 
2034	   0.590864	#_recdev_input52 
2035	  -0.180654	#_recdev_input53 
2036	   -0.38624	#_recdev_input54 
2037	 -0.0199035	#_recdev_input55 
2038	   0.236105	#_recdev_input56 
2039	  -0.898427	#_recdev_input57 
2040	 -0.0528274	#_recdev_input58 
2041	   -0.40174	#_recdev_input59 
2042	   0.599091	#_recdev_input60 
2043	  -0.107817	#_recdev_input61 
2044	  -0.221151	#_recdev_input62 
2045	  -0.234674	#_recdev_input63 
2046	   0.347475	#_recdev_input64 
2047	   0.144098	#_recdev_input65 
2048	   0.415118	#_recdev_input66 
2049	  -0.222172	#_recdev_input67 
2050	   0.110562	#_recdev_input68 
2051	  0.0750921	#_recdev_input69 
2052	   0.154228	#_recdev_input70 
2053	  -0.257402	#_recdev_input71 
2054	  0.0323074	#_recdev_input72 
2055	 -0.0118393	#_recdev_input73 
2056	  -0.947848	#_recdev_input74 
2057	  -0.263811	#_recdev_input75 
2058	 -0.0158604	#_recdev_input76 
2059	   -1.06958	#_recdev_input77 
2060	  -0.132958	#_recdev_input78 
2061	  -0.445455	#_recdev_input79 
2062	  -0.352261	#_recdev_input80 
2063	  -0.226665	#_recdev_input81 
2064	  -0.088143	#_recdev_input82 
2065	   0.218648	#_recdev_input83 
2066	   0.300582	#_recdev_input84 
2067	  -0.313534	#_recdev_input85 
2068	   0.540685	#_recdev_input86 
2069	  -0.484816	#_recdev_input87 
2070	   0.329662	#_recdev_input88 
2071	    0.24363	#_recdev_input89 
2072	  -0.871474	#_recdev_input90 
2073	 -0.0394437	#_recdev_input91 
2074	   0.576247	#_recdev_input92 
2075	  -0.634875	#_recdev_input93 
2076	   0.966598	#_recdev_input94 
2077	   0.762665	#_recdev_input95 
2078	   0.212169	#_recdev_input96 
2079	   0.312929	#_recdev_input97 
2080	-0.00823561	#_recdev_input98 
2081	   -0.19662	#_recdev_input99 
2082	   0.455652	#_recdev_input100
2083	    0.49988	#_recdev_input101
2084	  -0.224076	#_recdev_input102
2085	  -0.280279	#_recdev_input103
2086	  -0.648173	#_recdev_input104
2087	  -0.677126	#_recdev_input105
2088	  -0.823026	#_recdev_input106
2089	  0.0255005	#_recdev_input107
2090	  -0.479811	#_recdev_input108
2091	   0.208137	#_recdev_input109
2092	  -0.403017	#_recdev_input110
2093	   -0.71746	#_recdev_input111
2094	  -0.352749	#_recdev_input112
2095	 0.00414698	#_recdev_input113
2096	  0.0892979	#_recdev_input114
2097	  -0.907066	#_recdev_input115
2098	  -0.169123	#_recdev_input116
2099	  0.0447454	#_recdev_input117
2100	   0.270223	#_recdev_input118
2101	  -0.173094	#_recdev_input119
2102	  -0.157042	#_recdev_input120
2103	  -0.326525	#_recdev_input121
2104	  0.0469907	#_recdev_input122
2105	  -0.297706	#_recdev_input123
2106	  0.0551417	#_recdev_input124
2107	  -0.282156	#_recdev_input125
2108	  -0.881974	#_recdev_input126
2109	   0.284742	#_recdev_input127
2110	 0.00669113	#_recdev_input128
2111	  -0.283047	#_recdev_input129
2112	  -0.999302	#_recdev_input130
2113	  -0.122793	#_recdev_input131
2114	    0.17962	#_recdev_input132
2115	  -0.120475	#_recdev_input133
2116	   0.365655	#_recdev_input134
2117	   0.498874	#_recdev_input135
2118	  -0.385769	#_recdev_input136
2119	   0.132621	#_recdev_input137
2120	   0.314675	#_recdev_input138
2121	   0.246066	#_recdev_input139
2122	   0.226975	#_recdev_input140
2123	   0.031501	#_recdev_input141
2124	  -0.396063	#_recdev_input142
2125	  -0.468665	#_recdev_input143
2126	   0.402258	#_recdev_input144
2127	  -0.191469	#_recdev_input145
2128	  -0.247453	#_recdev_input146
2129	  -0.335284	#_recdev_input147
2130	 -0.0659241	#_recdev_input148
2131	  -0.492353	#_recdev_input149
2132	  -0.256505	#_recdev_input150
2133	   -0.78294	#_recdev_input151
2134	 -0.0523172	#_recdev_input152
#
#Fishing Mortality info
0.4 # F ballpark
-2008 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
9 # max F or harvest rate, depends on F_Method
#_overall start F value; overall phase; N detailed inputs to read
0.1 1 1225 #_F_setup
#_fleet	year	seas	Fvalue	se	phase
2	1950	1	  0.0366002	0.005	1	#_F_setup21   
2	1951	1	  0.0202218	0.005	1	#_F_setup22   
2	1952	1	  0.0132199	0.005	1	#_F_setup23   
2	1953	1	  0.0161624	0.005	1	#_F_setup24   
2	1954	1	  0.0194276	0.005	1	#_F_setup25   
2	1955	1	 0.00962014	0.005	1	#_F_setup26   
2	1956	1	  0.0207396	0.005	1	#_F_setup27   
2	1957	1	  0.0223635	0.005	1	#_F_setup28   
2	1958	1	   0.015969	0.005	1	#_F_setup29   
2	1959	1	   0.135358	0.005	1	#_F_setup210  
2	1960	1	   0.014511	0.005	1	#_F_setup211  
2	1961	1	  0.0176728	0.005	1	#_F_setup212  
2	1962	1	   0.139857	0.005	1	#_F_setup213  
2	1963	1	   0.218346	0.005	1	#_F_setup214  
2	1964	1	   0.247624	0.005	1	#_F_setup215  
2	1965	1	   0.226561	0.005	1	#_F_setup216  
2	1966	1	    0.29144	0.005	1	#_F_setup217  
2	1967	1	   0.273902	0.005	1	#_F_setup218  
2	1968	1	   0.269731	0.005	1	#_F_setup219  
2	1969	1	   0.334347	0.005	1	#_F_setup220  
2	1970	1	   0.392871	0.005	1	#_F_setup221  
2	1971	1	    0.43262	0.005	1	#_F_setup222  
2	1972	1	   0.361036	0.005	1	#_F_setup223  
2	1973	1	   0.418999	0.005	1	#_F_setup224  
2	1974	1	   0.311692	0.005	1	#_F_setup225  
2	1975	1	   0.212977	0.005	1	#_F_setup226  
2	1976	1	   0.218665	0.005	1	#_F_setup227  
2	1977	1	   0.147351	0.005	1	#_F_setup228  
2	1978	1	    0.10857	0.005	1	#_F_setup229  
2	1979	1	   0.163725	0.005	1	#_F_setup230  
2	1980	1	  0.0814016	0.005	1	#_F_setup231  
2	1981	1	   0.159993	0.005	1	#_F_setup232  
2	1982	1	   0.226858	0.005	1	#_F_setup233  
2	1983	1	   0.155607	0.005	1	#_F_setup234  
2	1984	1	   0.158036	0.005	1	#_F_setup235  
2	1985	1	   0.268974	0.005	1	#_F_setup236  
2	1986	1	   0.101234	0.005	1	#_F_setup237  
2	1987	1	   0.438786	0.005	1	#_F_setup238  
2	1988	1	   0.882393	0.005	1	#_F_setup239  
2	1989	1	    1.18103	0.005	1	#_F_setup240  
2	1990	1	    1.17368	0.005	1	#_F_setup241  
2	1991	1	   0.238921	0.005	1	#_F_setup242  
2	1992	1	   0.240747	0.005	1	#_F_setup243  
2	1993	1	   0.775743	0.005	1	#_F_setup244  
2	1994	1	   0.182145	0.005	1	#_F_setup245  
2	1995	1	   0.174659	0.005	1	#_F_setup246  
2	1996	1	   0.162941	0.005	1	#_F_setup247  
2	1997	1	   0.219492	0.005	1	#_F_setup248  
2	1998	1	   0.152285	0.005	1	#_F_setup249  
2	1999	1	   0.147433	0.005	1	#_F_setup250  
2	2000	1	    1.35607	0.005	1	#_F_setup251  
2	2001	1	   0.637495	0.005	1	#_F_setup252  
2	2002	1	     0.6472	0.005	1	#_F_setup253  
2	2003	1	     1.0081	0.005	1	#_F_setup254  
2	2004	1	   0.472309	0.005	1	#_F_setup255  
2	2005	1	          4	0.005	1	#_F_setup256  
2	2006	1	          0	0.005	1	#_F_setup257  
2	2007	1	          0	0.005	1	#_F_setup258  
2	2008	1	          0	0.005	1	#_F_setup259  
2	2009	1	          0	0.005	1	#_F_setup260  
2	2010	1	          0	0.005	1	#_F_setup261  
2	2011	1	          0	0.005	1	#_F_setup262  
2	2012	1	          0	0.005	1	#_F_setup263  
2	2013	1	          0	0.005	1	#_F_setup264  
2	2014	1	          0	0.005	1	#_F_setup265  
2	2015	1	          0	0.005	1	#_F_setup266  
2	2016	1	          0	0.005	1	#_F_setup267  
2	2017	1	          0	0.005	1	#_F_setup268  
2	2018	1	          0	0.005	1	#_F_setup269  
2	2019	1	          0	0.005	1	#_F_setup270  
2	2020	1	          0	0.005	1	#_F_setup271  
2	2021	1	          0	0.005	1	#_F_setup272  
2	2022	1	          0	0.005	1	#_F_setup273  
2	2023	1	          0	0.005	1	#_F_setup274  
2	2024	1	          0	0.005	1	#_F_setup275  
2	2025	1	          0	0.005	1	#_F_setup276  
2	2026	1	          0	0.005	1	#_F_setup277  
2	2027	1	          0	0.005	1	#_F_setup278  
2	2028	1	          0	0.005	1	#_F_setup279  
2	2029	1	          0	0.005	1	#_F_setup280  
2	2030	1	          0	0.005	1	#_F_setup281  
2	2031	1	          0	0.005	1	#_F_setup282  
2	2032	1	          0	0.005	1	#_F_setup283  
2	2033	1	          0	0.005	1	#_F_setup284  
2	2034	1	          0	0.005	1	#_F_setup285  
2	2035	1	          0	0.005	1	#_F_setup286  
2	2036	1	          0	0.005	1	#_F_setup287  
2	2037	1	          0	0.005	1	#_F_setup288  
2	2038	1	          0	0.005	1	#_F_setup289  
2	2039	1	          0	0.005	1	#_F_setup290  
2	2040	1	          0	0.005	1	#_F_setup291  
2	2041	1	          0	0.005	1	#_F_setup292  
2	2042	1	          0	0.005	1	#_F_setup293  
2	2043	1	          0	0.005	1	#_F_setup294  
2	2044	1	          0	0.005	1	#_F_setup295  
2	2045	1	          0	0.005	1	#_F_setup296  
2	2046	1	          0	0.005	1	#_F_setup297  
2	2047	1	          0	0.005	1	#_F_setup298  
2	2048	1	          0	0.005	1	#_F_setup299  
2	2049	1	          0	0.005	1	#_F_setup2100 
2	2050	1	          0	0.005	1	#_F_setup2101 
2	2051	1	          0	0.005	1	#_F_setup2102 
2	2052	1	          0	0.005	1	#_F_setup2103 
2	2053	1	          0	0.005	1	#_F_setup2104 
2	2054	1	          0	0.005	1	#_F_setup2105 
2	2055	1	          0	0.005	1	#_F_setup2106 
2	2056	1	          0	0.005	1	#_F_setup2107 
2	2057	1	          0	0.005	1	#_F_setup2108 
2	2058	1	          0	0.005	1	#_F_setup2109 
2	2059	1	          0	0.005	1	#_F_setup2110 
2	2060	1	          0	0.005	1	#_F_setup2111 
2	2061	1	          0	0.005	1	#_F_setup2112 
2	2062	1	          0	0.005	1	#_F_setup2113 
2	2063	1	          0	0.005	1	#_F_setup2114 
2	2064	1	          0	0.005	1	#_F_setup2115 
2	2065	1	          0	0.005	1	#_F_setup2116 
2	2066	1	          0	0.005	1	#_F_setup2117 
2	2067	1	          0	0.005	1	#_F_setup2118 
2	2068	1	          0	0.005	1	#_F_setup2119 
2	2069	1	          0	0.005	1	#_F_setup2120 
2	2070	1	          0	0.005	1	#_F_setup2121 
2	2071	1	          0	0.005	1	#_F_setup2122 
2	2072	1	          0	0.005	1	#_F_setup2123 
2	2073	1	          0	0.005	1	#_F_setup2124 
2	2074	1	          0	0.005	1	#_F_setup2125 
2	2075	1	          0	0.005	1	#_F_setup2126 
2	2076	1	          0	0.005	1	#_F_setup2127 
2	2077	1	          0	0.005	1	#_F_setup2128 
2	2078	1	          0	0.005	1	#_F_setup2129 
2	2079	1	          0	0.005	1	#_F_setup2130 
2	2080	1	          0	0.005	1	#_F_setup2131 
2	2081	1	          0	0.005	1	#_F_setup2132 
2	2082	1	          0	0.005	1	#_F_setup2133 
2	2083	1	          0	0.005	1	#_F_setup2134 
2	2084	1	          0	0.005	1	#_F_setup2135 
2	2085	1	          0	0.005	1	#_F_setup2136 
2	2086	1	          0	0.005	1	#_F_setup2137 
2	2087	1	          0	0.005	1	#_F_setup2138 
2	2088	1	          0	0.005	1	#_F_setup2139 
2	2089	1	          0	0.005	1	#_F_setup2140 
2	2090	1	          0	0.005	1	#_F_setup2141 
2	2091	1	          0	0.005	1	#_F_setup2142 
2	2092	1	          0	0.005	1	#_F_setup2143 
2	2093	1	          0	0.005	1	#_F_setup2144 
2	2094	1	          0	0.005	1	#_F_setup2145 
2	2095	1	          0	0.005	1	#_F_setup2146 
2	2096	1	          0	0.005	1	#_F_setup2147 
2	2097	1	          0	0.005	1	#_F_setup2148 
2	2098	1	          0	0.005	1	#_F_setup2149 
2	2099	1	          0	0.005	1	#_F_setup2150 
2	2100	1	          0	0.005	1	#_F_setup2151 
2	2101	1	          0	0.005	1	#_F_setup2152 
2	2102	1	          0	0.005	1	#_F_setup2153 
2	2103	1	          0	0.005	1	#_F_setup2154 
2	2104	1	          0	0.005	1	#_F_setup2155 
2	2105	1	          0	0.005	1	#_F_setup2156 
2	2106	1	          0	0.005	1	#_F_setup2157 
2	2107	1	          0	0.005	1	#_F_setup2158 
2	2108	1	          0	0.005	1	#_F_setup2159 
2	2109	1	          0	0.005	1	#_F_setup2160 
2	2110	1	          0	0.005	1	#_F_setup2161 
2	2111	1	          0	0.005	1	#_F_setup2162 
2	2112	1	          0	0.005	1	#_F_setup2163 
2	2113	1	          0	0.005	1	#_F_setup2164 
2	2114	1	          0	0.005	1	#_F_setup2165 
2	2115	1	          0	0.005	1	#_F_setup2166 
2	2116	1	          0	0.005	1	#_F_setup2167 
2	2117	1	          0	0.005	1	#_F_setup2168 
2	2118	1	          0	0.005	1	#_F_setup2169 
2	2119	1	          0	0.005	1	#_F_setup2170 
2	2120	1	          0	0.005	1	#_F_setup2171 
2	2121	1	          0	0.005	1	#_F_setup2172 
2	2122	1	          0	0.005	1	#_F_setup2173 
2	2123	1	          0	0.005	1	#_F_setup2174 
2	2124	1	          0	0.005	1	#_F_setup2175 
3	1950	1	          0	0.005	1	#_F_setup2176 
3	1951	1	          0	0.005	1	#_F_setup2177 
3	1952	1	          0	0.005	1	#_F_setup2178 
3	1953	1	          0	0.005	1	#_F_setup2179 
3	1954	1	          0	0.005	1	#_F_setup2180 
3	1955	1	          0	0.005	1	#_F_setup2181 
3	1956	1	          0	0.005	1	#_F_setup2182 
3	1957	1	          0	0.005	1	#_F_setup2183 
3	1958	1	          0	0.005	1	#_F_setup2184 
3	1959	1	          0	0.005	1	#_F_setup2185 
3	1960	1	          0	0.005	1	#_F_setup2186 
3	1961	1	          0	0.005	1	#_F_setup2187 
3	1962	1	          0	0.005	1	#_F_setup2188 
3	1963	1	          0	0.005	1	#_F_setup2189 
3	1964	1	          0	0.005	1	#_F_setup2190 
3	1965	1	          0	0.005	1	#_F_setup2191 
3	1966	1	          0	0.005	1	#_F_setup2192 
3	1967	1	          0	0.005	1	#_F_setup2193 
3	1968	1	          0	0.005	1	#_F_setup2194 
3	1969	1	          0	0.005	1	#_F_setup2195 
3	1970	1	          0	0.005	1	#_F_setup2196 
3	1971	1	          0	0.005	1	#_F_setup2197 
3	1972	1	          0	0.005	1	#_F_setup2198 
3	1973	1	          0	0.005	1	#_F_setup2199 
3	1974	1	          0	0.005	1	#_F_setup2200 
3	1975	1	          0	0.005	1	#_F_setup2201 
3	1976	1	          0	0.005	1	#_F_setup2202 
3	1977	1	          0	0.005	1	#_F_setup2203 
3	1978	1	          0	0.005	1	#_F_setup2204 
3	1979	1	          0	0.005	1	#_F_setup2205 
3	1980	1	          0	0.005	1	#_F_setup2206 
3	1981	1	          0	0.005	1	#_F_setup2207 
3	1982	1	          0	0.005	1	#_F_setup2208 
3	1983	1	          0	0.005	1	#_F_setup2209 
3	1984	1	          0	0.005	1	#_F_setup2210 
3	1985	1	          0	0.005	1	#_F_setup2211 
3	1986	1	          0	0.005	1	#_F_setup2212 
3	1987	1	          0	0.005	1	#_F_setup2213 
3	1988	1	          0	0.005	1	#_F_setup2214 
3	1989	1	          0	0.005	1	#_F_setup2215 
3	1990	1	          0	0.005	1	#_F_setup2216 
3	1991	1	          0	0.005	1	#_F_setup2217 
3	1992	1	          0	0.005	1	#_F_setup2218 
3	1993	1	          0	0.005	1	#_F_setup2219 
3	1994	1	          0	0.005	1	#_F_setup2220 
3	1995	1	          0	0.005	1	#_F_setup2221 
3	1996	1	          0	0.005	1	#_F_setup2222 
3	1997	1	          0	0.005	1	#_F_setup2223 
3	1998	1	          0	0.005	1	#_F_setup2224 
3	1999	1	          0	0.005	1	#_F_setup2225 
3	2000	1	          0	0.005	1	#_F_setup2226 
3	2001	1	          0	0.005	1	#_F_setup2227 
3	2002	1	          0	0.005	1	#_F_setup2228 
3	2003	1	          0	0.005	1	#_F_setup2229 
3	2004	1	          0	0.005	1	#_F_setup2230 
3	2005	1	          0	0.005	1	#_F_setup2231 
3	2006	1	          4	0.005	1	#_F_setup2232 
3	2007	1	    3.71707	0.005	1	#_F_setup2233 
3	2008	1	    3.99999	0.005	1	#_F_setup2234 
3	2009	1	    0.52525	0.005	1	#_F_setup2235 
3	2010	1	   0.582987	0.005	1	#_F_setup2236 
3	2011	1	   0.510432	0.005	1	#_F_setup2237 
3	2012	1	   0.597506	0.005	1	#_F_setup2238 
3	2013	1	    0.39142	0.005	1	#_F_setup2239 
3	2014	1	   0.416321	0.005	1	#_F_setup2240 
3	2015	1	   0.398782	0.005	1	#_F_setup2241 
3	2016	1	   0.404305	0.005	1	#_F_setup2242 
3	2017	1	    0.60678	0.005	1	#_F_setup2243 
3	2018	1	    0.61914	0.005	1	#_F_setup2244 
3	2019	1	   0.604478	0.005	1	#_F_setup2245 
3	2020	1	   0.480686	0.005	1	#_F_setup2246 
3	2021	1	   0.425701	0.005	1	#_F_setup2247 
3	2022	1	   0.393053	0.005	1	#_F_setup2248 
3	2023	1	   0.346427	0.005	1	#_F_setup2249 
3	2024	1	   0.279964	0.005	1	#_F_setup2250 
3	2025	1	        0.8	0.005	1	#_F_setup2251 
3	2026	1	        0.8	0.005	1	#_F_setup2252 
3	2027	1	        0.8	0.005	1	#_F_setup2253 
3	2028	1	        0.8	0.005	1	#_F_setup2254 
3	2029	1	        0.8	0.005	1	#_F_setup2255 
3	2030	1	        0.8	0.005	1	#_F_setup2256 
3	2031	1	        0.8	0.005	1	#_F_setup2257 
3	2032	1	        0.8	0.005	1	#_F_setup2258 
3	2033	1	        0.8	0.005	1	#_F_setup2259 
3	2034	1	        0.8	0.005	1	#_F_setup2260 
3	2035	1	        0.8	0.005	1	#_F_setup2261 
3	2036	1	        0.8	0.005	1	#_F_setup2262 
3	2037	1	        0.8	0.005	1	#_F_setup2263 
3	2038	1	        0.8	0.005	1	#_F_setup2264 
3	2039	1	        0.8	0.005	1	#_F_setup2265 
3	2040	1	        0.8	0.005	1	#_F_setup2266 
3	2041	1	        0.8	0.005	1	#_F_setup2267 
3	2042	1	        0.8	0.005	1	#_F_setup2268 
3	2043	1	        0.8	0.005	1	#_F_setup2269 
3	2044	1	        0.8	0.005	1	#_F_setup2270 
3	2045	1	        0.8	0.005	1	#_F_setup2271 
3	2046	1	        0.8	0.005	1	#_F_setup2272 
3	2047	1	        0.8	0.005	1	#_F_setup2273 
3	2048	1	        0.8	0.005	1	#_F_setup2274 
3	2049	1	        0.8	0.005	1	#_F_setup2275 
3	2050	1	        0.8	0.005	1	#_F_setup2276 
3	2051	1	        0.8	0.005	1	#_F_setup2277 
3	2052	1	        0.8	0.005	1	#_F_setup2278 
3	2053	1	        0.8	0.005	1	#_F_setup2279 
3	2054	1	        0.8	0.005	1	#_F_setup2280 
3	2055	1	        0.8	0.005	1	#_F_setup2281 
3	2056	1	        0.8	0.005	1	#_F_setup2282 
3	2057	1	        0.8	0.005	1	#_F_setup2283 
3	2058	1	        0.8	0.005	1	#_F_setup2284 
3	2059	1	        0.8	0.005	1	#_F_setup2285 
3	2060	1	        0.8	0.005	1	#_F_setup2286 
3	2061	1	        0.8	0.005	1	#_F_setup2287 
3	2062	1	        0.8	0.005	1	#_F_setup2288 
3	2063	1	        0.8	0.005	1	#_F_setup2289 
3	2064	1	        0.8	0.005	1	#_F_setup2290 
3	2065	1	        0.8	0.005	1	#_F_setup2291 
3	2066	1	        0.8	0.005	1	#_F_setup2292 
3	2067	1	        0.8	0.005	1	#_F_setup2293 
3	2068	1	        0.8	0.005	1	#_F_setup2294 
3	2069	1	        0.8	0.005	1	#_F_setup2295 
3	2070	1	        0.8	0.005	1	#_F_setup2296 
3	2071	1	        0.8	0.005	1	#_F_setup2297 
3	2072	1	        0.8	0.005	1	#_F_setup2298 
3	2073	1	        0.8	0.005	1	#_F_setup2299 
3	2074	1	        0.8	0.005	1	#_F_setup2300 
3	2075	1	        0.8	0.005	1	#_F_setup2301 
3	2076	1	        0.8	0.005	1	#_F_setup2302 
3	2077	1	        0.8	0.005	1	#_F_setup2303 
3	2078	1	        0.8	0.005	1	#_F_setup2304 
3	2079	1	        0.8	0.005	1	#_F_setup2305 
3	2080	1	        0.8	0.005	1	#_F_setup2306 
3	2081	1	        0.8	0.005	1	#_F_setup2307 
3	2082	1	        0.8	0.005	1	#_F_setup2308 
3	2083	1	        0.8	0.005	1	#_F_setup2309 
3	2084	1	        0.8	0.005	1	#_F_setup2310 
3	2085	1	        0.8	0.005	1	#_F_setup2311 
3	2086	1	        0.8	0.005	1	#_F_setup2312 
3	2087	1	        0.8	0.005	1	#_F_setup2313 
3	2088	1	        0.8	0.005	1	#_F_setup2314 
3	2089	1	        0.8	0.005	1	#_F_setup2315 
3	2090	1	        0.8	0.005	1	#_F_setup2316 
3	2091	1	        0.8	0.005	1	#_F_setup2317 
3	2092	1	        0.8	0.005	1	#_F_setup2318 
3	2093	1	        0.8	0.005	1	#_F_setup2319 
3	2094	1	        0.8	0.005	1	#_F_setup2320 
3	2095	1	        0.8	0.005	1	#_F_setup2321 
3	2096	1	        0.8	0.005	1	#_F_setup2322 
3	2097	1	        0.8	0.005	1	#_F_setup2323 
3	2098	1	        0.8	0.005	1	#_F_setup2324 
3	2099	1	        0.8	0.005	1	#_F_setup2325 
3	2100	1	        0.8	0.005	1	#_F_setup2326 
3	2101	1	        0.8	0.005	1	#_F_setup2327 
3	2102	1	        0.8	0.005	1	#_F_setup2328 
3	2103	1	        0.8	0.005	1	#_F_setup2329 
3	2104	1	        0.8	0.005	1	#_F_setup2330 
3	2105	1	        0.8	0.005	1	#_F_setup2331 
3	2106	1	        0.8	0.005	1	#_F_setup2332 
3	2107	1	        0.8	0.005	1	#_F_setup2333 
3	2108	1	        0.8	0.005	1	#_F_setup2334 
3	2109	1	        0.8	0.005	1	#_F_setup2335 
3	2110	1	        0.8	0.005	1	#_F_setup2336 
3	2111	1	        0.8	0.005	1	#_F_setup2337 
3	2112	1	        0.8	0.005	1	#_F_setup2338 
3	2113	1	        0.8	0.005	1	#_F_setup2339 
3	2114	1	        0.8	0.005	1	#_F_setup2340 
3	2115	1	        0.8	0.005	1	#_F_setup2341 
3	2116	1	        0.8	0.005	1	#_F_setup2342 
3	2117	1	        0.8	0.005	1	#_F_setup2343 
3	2118	1	        0.8	0.005	1	#_F_setup2344 
3	2119	1	        0.8	0.005	1	#_F_setup2345 
3	2120	1	        0.8	0.005	1	#_F_setup2346 
3	2121	1	        0.8	0.005	1	#_F_setup2347 
3	2122	1	        0.8	0.005	1	#_F_setup2348 
3	2123	1	        0.8	0.005	1	#_F_setup2349 
3	2124	1	        0.8	0.005	1	#_F_setup2350 
4	1950	1	          0	0.005	1	#_F_setup2351 
4	1951	1	          0	0.005	1	#_F_setup2352 
4	1952	1	          0	0.005	1	#_F_setup2353 
4	1953	1	          0	0.005	1	#_F_setup2354 
4	1954	1	          0	0.005	1	#_F_setup2355 
4	1955	1	          0	0.005	1	#_F_setup2356 
4	1956	1	          0	0.005	1	#_F_setup2357 
4	1957	1	          0	0.005	1	#_F_setup2358 
4	1958	1	          0	0.005	1	#_F_setup2359 
4	1959	1	          0	0.005	1	#_F_setup2360 
4	1960	1	          0	0.005	1	#_F_setup2361 
4	1961	1	          0	0.005	1	#_F_setup2362 
4	1962	1	          0	0.005	1	#_F_setup2363 
4	1963	1	          0	0.005	1	#_F_setup2364 
4	1964	1	          0	0.005	1	#_F_setup2365 
4	1965	1	          0	0.005	1	#_F_setup2366 
4	1966	1	          0	0.005	1	#_F_setup2367 
4	1967	1	          0	0.005	1	#_F_setup2368 
4	1968	1	          0	0.005	1	#_F_setup2369 
4	1969	1	          0	0.005	1	#_F_setup2370 
4	1970	1	          0	0.005	1	#_F_setup2371 
4	1971	1	          0	0.005	1	#_F_setup2372 
4	1972	1	          0	0.005	1	#_F_setup2373 
4	1973	1	          0	0.005	1	#_F_setup2374 
4	1974	1	          0	0.005	1	#_F_setup2375 
4	1975	1	          0	0.005	1	#_F_setup2376 
4	1976	1	          0	0.005	1	#_F_setup2377 
4	1977	1	          0	0.005	1	#_F_setup2378 
4	1978	1	          0	0.005	1	#_F_setup2379 
4	1979	1	          0	0.005	1	#_F_setup2380 
4	1980	1	          0	0.005	1	#_F_setup2381 
4	1981	1	          0	0.005	1	#_F_setup2382 
4	1982	1	          0	0.005	1	#_F_setup2383 
4	1983	1	          0	0.005	1	#_F_setup2384 
4	1984	1	          0	0.005	1	#_F_setup2385 
4	1985	1	          0	0.005	1	#_F_setup2386 
4	1986	1	          0	0.005	1	#_F_setup2387 
4	1987	1	          0	0.005	1	#_F_setup2388 
4	1988	1	          0	0.005	1	#_F_setup2389 
4	1989	1	          0	0.005	1	#_F_setup2390 
4	1990	1	          0	0.005	1	#_F_setup2391 
4	1991	1	          0	0.005	1	#_F_setup2392 
4	1992	1	          0	0.005	1	#_F_setup2393 
4	1993	1	          0	0.005	1	#_F_setup2394 
4	1994	1	          0	0.005	1	#_F_setup2395 
4	1995	1	          0	0.005	1	#_F_setup2396 
4	1996	1	          0	0.005	1	#_F_setup2397 
4	1997	1	          0	0.005	1	#_F_setup2398 
4	1998	1	          0	0.005	1	#_F_setup2399 
4	1999	1	          0	0.005	1	#_F_setup2400 
4	2000	1	          0	0.005	1	#_F_setup2401 
4	2001	1	          0	0.005	1	#_F_setup2402 
4	2002	1	          0	0.005	1	#_F_setup2403 
4	2003	1	          0	0.005	1	#_F_setup2404 
4	2004	1	          0	0.005	1	#_F_setup2405 
4	2005	1	          0	0.005	1	#_F_setup2406 
4	2006	1	   0.215905	0.005	1	#_F_setup2407 
4	2007	1	  0.0860884	0.005	1	#_F_setup2408 
4	2008	1	  0.0477836	0.005	1	#_F_setup2409 
4	2009	1	  0.0666993	0.005	1	#_F_setup2410 
4	2010	1	   0.102122	0.005	1	#_F_setup2411 
4	2011	1	  0.0867414	0.005	1	#_F_setup2412 
4	2012	1	   0.133616	0.005	1	#_F_setup2413 
4	2013	1	  0.0988778	0.005	1	#_F_setup2414 
4	2014	1	  0.0829363	0.005	1	#_F_setup2415 
4	2015	1	  0.0790143	0.005	1	#_F_setup2416 
4	2016	1	  0.0759391	0.005	1	#_F_setup2417 
4	2017	1	  0.0678372	0.005	1	#_F_setup2418 
4	2018	1	  0.0983755	0.005	1	#_F_setup2419 
4	2019	1	   0.117248	0.005	1	#_F_setup2420 
4	2020	1	   0.111024	0.005	1	#_F_setup2421 
4	2021	1	  0.0869126	0.005	1	#_F_setup2422 
4	2022	1	  0.0775072	0.005	1	#_F_setup2423 
4	2023	1	  0.0659227	0.005	1	#_F_setup2424 
4	2024	1	  0.0414358	0.005	1	#_F_setup2425 
4	2025	1	       0.15	0.005	1	#_F_setup2426 
4	2026	1	       0.15	0.005	1	#_F_setup2427 
4	2027	1	       0.15	0.005	1	#_F_setup2428 
4	2028	1	       0.15	0.005	1	#_F_setup2429 
4	2029	1	       0.15	0.005	1	#_F_setup2430 
4	2030	1	       0.15	0.005	1	#_F_setup2431 
4	2031	1	       0.15	0.005	1	#_F_setup2432 
4	2032	1	       0.15	0.005	1	#_F_setup2433 
4	2033	1	       0.15	0.005	1	#_F_setup2434 
4	2034	1	       0.15	0.005	1	#_F_setup2435 
4	2035	1	       0.15	0.005	1	#_F_setup2436 
4	2036	1	       0.15	0.005	1	#_F_setup2437 
4	2037	1	       0.15	0.005	1	#_F_setup2438 
4	2038	1	       0.15	0.005	1	#_F_setup2439 
4	2039	1	       0.15	0.005	1	#_F_setup2440 
4	2040	1	       0.15	0.005	1	#_F_setup2441 
4	2041	1	       0.15	0.005	1	#_F_setup2442 
4	2042	1	       0.15	0.005	1	#_F_setup2443 
4	2043	1	       0.15	0.005	1	#_F_setup2444 
4	2044	1	       0.15	0.005	1	#_F_setup2445 
4	2045	1	       0.15	0.005	1	#_F_setup2446 
4	2046	1	       0.15	0.005	1	#_F_setup2447 
4	2047	1	       0.15	0.005	1	#_F_setup2448 
4	2048	1	       0.15	0.005	1	#_F_setup2449 
4	2049	1	       0.15	0.005	1	#_F_setup2450 
4	2050	1	       0.15	0.005	1	#_F_setup2451 
4	2051	1	       0.15	0.005	1	#_F_setup2452 
4	2052	1	       0.15	0.005	1	#_F_setup2453 
4	2053	1	       0.15	0.005	1	#_F_setup2454 
4	2054	1	       0.15	0.005	1	#_F_setup2455 
4	2055	1	       0.15	0.005	1	#_F_setup2456 
4	2056	1	       0.15	0.005	1	#_F_setup2457 
4	2057	1	       0.15	0.005	1	#_F_setup2458 
4	2058	1	       0.15	0.005	1	#_F_setup2459 
4	2059	1	       0.15	0.005	1	#_F_setup2460 
4	2060	1	       0.15	0.005	1	#_F_setup2461 
4	2061	1	       0.15	0.005	1	#_F_setup2462 
4	2062	1	       0.15	0.005	1	#_F_setup2463 
4	2063	1	       0.15	0.005	1	#_F_setup2464 
4	2064	1	       0.15	0.005	1	#_F_setup2465 
4	2065	1	       0.15	0.005	1	#_F_setup2466 
4	2066	1	       0.15	0.005	1	#_F_setup2467 
4	2067	1	       0.15	0.005	1	#_F_setup2468 
4	2068	1	       0.15	0.005	1	#_F_setup2469 
4	2069	1	       0.15	0.005	1	#_F_setup2470 
4	2070	1	       0.15	0.005	1	#_F_setup2471 
4	2071	1	       0.15	0.005	1	#_F_setup2472 
4	2072	1	       0.15	0.005	1	#_F_setup2473 
4	2073	1	       0.15	0.005	1	#_F_setup2474 
4	2074	1	       0.15	0.005	1	#_F_setup2475 
4	2075	1	       0.15	0.005	1	#_F_setup2476 
4	2076	1	       0.15	0.005	1	#_F_setup2477 
4	2077	1	       0.15	0.005	1	#_F_setup2478 
4	2078	1	       0.15	0.005	1	#_F_setup2479 
4	2079	1	       0.15	0.005	1	#_F_setup2480 
4	2080	1	       0.15	0.005	1	#_F_setup2481 
4	2081	1	       0.15	0.005	1	#_F_setup2482 
4	2082	1	       0.15	0.005	1	#_F_setup2483 
4	2083	1	       0.15	0.005	1	#_F_setup2484 
4	2084	1	       0.15	0.005	1	#_F_setup2485 
4	2085	1	       0.15	0.005	1	#_F_setup2486 
4	2086	1	       0.15	0.005	1	#_F_setup2487 
4	2087	1	       0.15	0.005	1	#_F_setup2488 
4	2088	1	       0.15	0.005	1	#_F_setup2489 
4	2089	1	       0.15	0.005	1	#_F_setup2490 
4	2090	1	       0.15	0.005	1	#_F_setup2491 
4	2091	1	       0.15	0.005	1	#_F_setup2492 
4	2092	1	       0.15	0.005	1	#_F_setup2493 
4	2093	1	       0.15	0.005	1	#_F_setup2494 
4	2094	1	       0.15	0.005	1	#_F_setup2495 
4	2095	1	       0.15	0.005	1	#_F_setup2496 
4	2096	1	       0.15	0.005	1	#_F_setup2497 
4	2097	1	       0.15	0.005	1	#_F_setup2498 
4	2098	1	       0.15	0.005	1	#_F_setup2499 
4	2099	1	       0.15	0.005	1	#_F_setup2500 
4	2100	1	       0.15	0.005	1	#_F_setup2501 
4	2101	1	       0.15	0.005	1	#_F_setup2502 
4	2102	1	       0.15	0.005	1	#_F_setup2503 
4	2103	1	       0.15	0.005	1	#_F_setup2504 
4	2104	1	       0.15	0.005	1	#_F_setup2505 
4	2105	1	       0.15	0.005	1	#_F_setup2506 
4	2106	1	       0.15	0.005	1	#_F_setup2507 
4	2107	1	       0.15	0.005	1	#_F_setup2508 
4	2108	1	       0.15	0.005	1	#_F_setup2509 
4	2109	1	       0.15	0.005	1	#_F_setup2510 
4	2110	1	       0.15	0.005	1	#_F_setup2511 
4	2111	1	       0.15	0.005	1	#_F_setup2512 
4	2112	1	       0.15	0.005	1	#_F_setup2513 
4	2113	1	       0.15	0.005	1	#_F_setup2514 
4	2114	1	       0.15	0.005	1	#_F_setup2515 
4	2115	1	       0.15	0.005	1	#_F_setup2516 
4	2116	1	       0.15	0.005	1	#_F_setup2517 
4	2117	1	       0.15	0.005	1	#_F_setup2518 
4	2118	1	       0.15	0.005	1	#_F_setup2519 
4	2119	1	       0.15	0.005	1	#_F_setup2520 
4	2120	1	       0.15	0.005	1	#_F_setup2521 
4	2121	1	       0.15	0.005	1	#_F_setup2522 
4	2122	1	       0.15	0.005	1	#_F_setup2523 
4	2123	1	       0.15	0.005	1	#_F_setup2524 
4	2124	1	       0.15	0.005	1	#_F_setup2525 
5	1950	1	          0	0.005	1	#_F_setup2526 
5	1951	1	          0	0.005	1	#_F_setup2527 
5	1952	1	          0	0.005	1	#_F_setup2528 
5	1953	1	          0	0.005	1	#_F_setup2529 
5	1954	1	          0	0.005	1	#_F_setup2530 
5	1955	1	          0	0.005	1	#_F_setup2531 
5	1956	1	          0	0.005	1	#_F_setup2532 
5	1957	1	          0	0.005	1	#_F_setup2533 
5	1958	1	          0	0.005	1	#_F_setup2534 
5	1959	1	          0	0.005	1	#_F_setup2535 
5	1960	1	          0	0.005	1	#_F_setup2536 
5	1961	1	          0	0.005	1	#_F_setup2537 
5	1962	1	          0	0.005	1	#_F_setup2538 
5	1963	1	          0	0.005	1	#_F_setup2539 
5	1964	1	          0	0.005	1	#_F_setup2540 
5	1965	1	          0	0.005	1	#_F_setup2541 
5	1966	1	          0	0.005	1	#_F_setup2542 
5	1967	1	          0	0.005	1	#_F_setup2543 
5	1968	1	          0	0.005	1	#_F_setup2544 
5	1969	1	          0	0.005	1	#_F_setup2545 
5	1970	1	          0	0.005	1	#_F_setup2546 
5	1971	1	          0	0.005	1	#_F_setup2547 
5	1972	1	          0	0.005	1	#_F_setup2548 
5	1973	1	          0	0.005	1	#_F_setup2549 
5	1974	1	          0	0.005	1	#_F_setup2550 
5	1975	1	          0	0.005	1	#_F_setup2551 
5	1976	1	          0	0.005	1	#_F_setup2552 
5	1977	1	          0	0.005	1	#_F_setup2553 
5	1978	1	          0	0.005	1	#_F_setup2554 
5	1979	1	          0	0.005	1	#_F_setup2555 
5	1980	1	          0	0.005	1	#_F_setup2556 
5	1981	1	          0	0.005	1	#_F_setup2557 
5	1982	1	          0	0.005	1	#_F_setup2558 
5	1983	1	          0	0.005	1	#_F_setup2559 
5	1984	1	          0	0.005	1	#_F_setup2560 
5	1985	1	          0	0.005	1	#_F_setup2561 
5	1986	1	          0	0.005	1	#_F_setup2562 
5	1987	1	          0	0.005	1	#_F_setup2563 
5	1988	1	          0	0.005	1	#_F_setup2564 
5	1989	1	          0	0.005	1	#_F_setup2565 
5	1990	1	          0	0.005	1	#_F_setup2566 
5	1991	1	          0	0.005	1	#_F_setup2567 
5	1992	1	          0	0.005	1	#_F_setup2568 
5	1993	1	          0	0.005	1	#_F_setup2569 
5	1994	1	          0	0.005	1	#_F_setup2570 
5	1995	1	          0	0.005	1	#_F_setup2571 
5	1996	1	          0	0.005	1	#_F_setup2572 
5	1997	1	          0	0.005	1	#_F_setup2573 
5	1998	1	          0	0.005	1	#_F_setup2574 
5	1999	1	          0	0.005	1	#_F_setup2575 
5	2000	1	          0	0.005	1	#_F_setup2576 
5	2001	1	          0	0.005	1	#_F_setup2577 
5	2002	1	          0	0.005	1	#_F_setup2578 
5	2003	1	          0	0.005	1	#_F_setup2579 
5	2004	1	          0	0.005	1	#_F_setup2580 
5	2005	1	          0	0.005	1	#_F_setup2581 
5	2006	1	          0	0.005	1	#_F_setup2582 
5	2007	1	 0.00661464	0.005	1	#_F_setup2583 
5	2008	1	  0.0122018	0.005	1	#_F_setup2584 
5	2009	1	  0.0217015	0.005	1	#_F_setup2585 
5	2010	1	  0.0263018	0.005	1	#_F_setup2586 
5	2011	1	  0.0120471	0.005	1	#_F_setup2587 
5	2012	1	 0.00347246	0.005	1	#_F_setup2588 
5	2013	1	 0.00900923	0.005	1	#_F_setup2589 
5	2014	1	 0.00437122	0.005	1	#_F_setup2590 
5	2015	1	 0.00599695	0.005	1	#_F_setup2591 
5	2016	1	 0.00760935	0.005	1	#_F_setup2592 
5	2017	1	   0.026263	0.005	1	#_F_setup2593 
5	2018	1	  0.0164208	0.005	1	#_F_setup2594 
5	2019	1	  0.0102794	0.005	1	#_F_setup2595 
5	2020	1	 0.00494303	0.005	1	#_F_setup2596 
5	2021	1	 0.00554275	0.005	1	#_F_setup2597 
5	2022	1	 0.00541195	0.005	1	#_F_setup2598 
5	2023	1	 0.00649301	0.005	1	#_F_setup2599 
5	2024	1	  0.0107397	0.005	1	#_F_setup2600 
5	2025	1	       0.01	0.005	1	#_F_setup2601 
5	2026	1	       0.01	0.005	1	#_F_setup2602 
5	2027	1	       0.01	0.005	1	#_F_setup2603 
5	2028	1	       0.01	0.005	1	#_F_setup2604 
5	2029	1	       0.01	0.005	1	#_F_setup2605 
5	2030	1	       0.01	0.005	1	#_F_setup2606 
5	2031	1	       0.01	0.005	1	#_F_setup2607 
5	2032	1	       0.01	0.005	1	#_F_setup2608 
5	2033	1	       0.01	0.005	1	#_F_setup2609 
5	2034	1	       0.01	0.005	1	#_F_setup2610 
5	2035	1	       0.01	0.005	1	#_F_setup2611 
5	2036	1	       0.01	0.005	1	#_F_setup2612 
5	2037	1	       0.01	0.005	1	#_F_setup2613 
5	2038	1	       0.01	0.005	1	#_F_setup2614 
5	2039	1	       0.01	0.005	1	#_F_setup2615 
5	2040	1	       0.01	0.005	1	#_F_setup2616 
5	2041	1	       0.01	0.005	1	#_F_setup2617 
5	2042	1	       0.01	0.005	1	#_F_setup2618 
5	2043	1	       0.01	0.005	1	#_F_setup2619 
5	2044	1	       0.01	0.005	1	#_F_setup2620 
5	2045	1	       0.01	0.005	1	#_F_setup2621 
5	2046	1	       0.01	0.005	1	#_F_setup2622 
5	2047	1	       0.01	0.005	1	#_F_setup2623 
5	2048	1	       0.01	0.005	1	#_F_setup2624 
5	2049	1	       0.01	0.005	1	#_F_setup2625 
5	2050	1	       0.01	0.005	1	#_F_setup2626 
5	2051	1	       0.01	0.005	1	#_F_setup2627 
5	2052	1	       0.01	0.005	1	#_F_setup2628 
5	2053	1	       0.01	0.005	1	#_F_setup2629 
5	2054	1	       0.01	0.005	1	#_F_setup2630 
5	2055	1	       0.01	0.005	1	#_F_setup2631 
5	2056	1	       0.01	0.005	1	#_F_setup2632 
5	2057	1	       0.01	0.005	1	#_F_setup2633 
5	2058	1	       0.01	0.005	1	#_F_setup2634 
5	2059	1	       0.01	0.005	1	#_F_setup2635 
5	2060	1	       0.01	0.005	1	#_F_setup2636 
5	2061	1	       0.01	0.005	1	#_F_setup2637 
5	2062	1	       0.01	0.005	1	#_F_setup2638 
5	2063	1	       0.01	0.005	1	#_F_setup2639 
5	2064	1	       0.01	0.005	1	#_F_setup2640 
5	2065	1	       0.01	0.005	1	#_F_setup2641 
5	2066	1	       0.01	0.005	1	#_F_setup2642 
5	2067	1	       0.01	0.005	1	#_F_setup2643 
5	2068	1	       0.01	0.005	1	#_F_setup2644 
5	2069	1	       0.01	0.005	1	#_F_setup2645 
5	2070	1	       0.01	0.005	1	#_F_setup2646 
5	2071	1	       0.01	0.005	1	#_F_setup2647 
5	2072	1	       0.01	0.005	1	#_F_setup2648 
5	2073	1	       0.01	0.005	1	#_F_setup2649 
5	2074	1	       0.01	0.005	1	#_F_setup2650 
5	2075	1	       0.01	0.005	1	#_F_setup2651 
5	2076	1	       0.01	0.005	1	#_F_setup2652 
5	2077	1	       0.01	0.005	1	#_F_setup2653 
5	2078	1	       0.01	0.005	1	#_F_setup2654 
5	2079	1	       0.01	0.005	1	#_F_setup2655 
5	2080	1	       0.01	0.005	1	#_F_setup2656 
5	2081	1	       0.01	0.005	1	#_F_setup2657 
5	2082	1	       0.01	0.005	1	#_F_setup2658 
5	2083	1	       0.01	0.005	1	#_F_setup2659 
5	2084	1	       0.01	0.005	1	#_F_setup2660 
5	2085	1	       0.01	0.005	1	#_F_setup2661 
5	2086	1	       0.01	0.005	1	#_F_setup2662 
5	2087	1	       0.01	0.005	1	#_F_setup2663 
5	2088	1	       0.01	0.005	1	#_F_setup2664 
5	2089	1	       0.01	0.005	1	#_F_setup2665 
5	2090	1	       0.01	0.005	1	#_F_setup2666 
5	2091	1	       0.01	0.005	1	#_F_setup2667 
5	2092	1	       0.01	0.005	1	#_F_setup2668 
5	2093	1	       0.01	0.005	1	#_F_setup2669 
5	2094	1	       0.01	0.005	1	#_F_setup2670 
5	2095	1	       0.01	0.005	1	#_F_setup2671 
5	2096	1	       0.01	0.005	1	#_F_setup2672 
5	2097	1	       0.01	0.005	1	#_F_setup2673 
5	2098	1	       0.01	0.005	1	#_F_setup2674 
5	2099	1	       0.01	0.005	1	#_F_setup2675 
5	2100	1	       0.01	0.005	1	#_F_setup2676 
5	2101	1	       0.01	0.005	1	#_F_setup2677 
5	2102	1	       0.01	0.005	1	#_F_setup2678 
5	2103	1	       0.01	0.005	1	#_F_setup2679 
5	2104	1	       0.01	0.005	1	#_F_setup2680 
5	2105	1	       0.01	0.005	1	#_F_setup2681 
5	2106	1	       0.01	0.005	1	#_F_setup2682 
5	2107	1	       0.01	0.005	1	#_F_setup2683 
5	2108	1	       0.01	0.005	1	#_F_setup2684 
5	2109	1	       0.01	0.005	1	#_F_setup2685 
5	2110	1	       0.01	0.005	1	#_F_setup2686 
5	2111	1	       0.01	0.005	1	#_F_setup2687 
5	2112	1	       0.01	0.005	1	#_F_setup2688 
5	2113	1	       0.01	0.005	1	#_F_setup2689 
5	2114	1	       0.01	0.005	1	#_F_setup2690 
5	2115	1	       0.01	0.005	1	#_F_setup2691 
5	2116	1	       0.01	0.005	1	#_F_setup2692 
5	2117	1	       0.01	0.005	1	#_F_setup2693 
5	2118	1	       0.01	0.005	1	#_F_setup2694 
5	2119	1	       0.01	0.005	1	#_F_setup2695 
5	2120	1	       0.01	0.005	1	#_F_setup2696 
5	2121	1	       0.01	0.005	1	#_F_setup2697 
5	2122	1	       0.01	0.005	1	#_F_setup2698 
5	2123	1	       0.01	0.005	1	#_F_setup2699 
5	2124	1	       0.01	0.005	1	#_F_setup2700 
6	1950	1	0.000172565	0.005	1	#_F_setup2701 
6	1951	1	0.000172557	0.005	1	#_F_setup2702 
6	1952	1	0.000170438	0.005	1	#_F_setup2703 
6	1953	1	0.000167648	0.005	1	#_F_setup2704 
6	1954	1	0.000164372	0.005	1	#_F_setup2705 
6	1955	1	 0.00016167	0.005	1	#_F_setup2706 
6	1956	1	0.000159959	0.005	1	#_F_setup2707 
6	1957	1	0.000159054	0.005	1	#_F_setup2708 
6	1958	1	0.000156002	0.005	1	#_F_setup2709 
6	1959	1	0.000154737	0.005	1	#_F_setup2710 
6	1960	1	0.000155348	0.005	1	#_F_setup2711 
6	1961	1	0.000154482	0.005	1	#_F_setup2712 
6	1962	1	0.000155884	0.005	1	#_F_setup2713 
6	1963	1	 0.00015451	0.005	1	#_F_setup2714 
6	1964	1	0.000157499	0.005	1	#_F_setup2715 
6	1965	1	0.000160058	0.005	1	#_F_setup2716 
6	1966	1	0.000160927	0.005	1	#_F_setup2717 
6	1967	1	0.000165379	0.005	1	#_F_setup2718 
6	1968	1	0.000169146	0.005	1	#_F_setup2719 
6	1969	1	0.000172374	0.005	1	#_F_setup2720 
6	1970	1	0.000177156	0.005	1	#_F_setup2721 
6	1971	1	0.000180497	0.005	1	#_F_setup2722 
6	1972	1	0.000185019	0.005	1	#_F_setup2723 
6	1973	1	0.000188349	0.005	1	#_F_setup2724 
6	1974	1	0.000192318	0.005	1	#_F_setup2725 
6	1975	1	0.000196316	0.005	1	#_F_setup2726 
6	1976	1	0.000195048	0.005	1	#_F_setup2727 
6	1977	1	0.000195798	0.005	1	#_F_setup2728 
6	1978	1	0.000192641	0.005	1	#_F_setup2729 
6	1979	1	0.000190097	0.005	1	#_F_setup2730 
6	1980	1	0.000187894	0.005	1	#_F_setup2731 
6	1981	1	 0.00018421	0.005	1	#_F_setup2732 
6	1982	1	0.000183997	0.005	1	#_F_setup2733 
6	1983	1	0.000178504	0.005	1	#_F_setup2734 
6	1984	1	0.000177402	0.005	1	#_F_setup2735 
6	1985	1	0.000177837	0.005	1	#_F_setup2736 
6	1986	1	0.000172227	0.005	1	#_F_setup2737 
6	1987	1	 0.00016784	0.005	1	#_F_setup2738 
6	1988	1	0.000172024	0.005	1	#_F_setup2739 
6	1989	1	0.000179495	0.005	1	#_F_setup2740 
6	1990	1	0.000186329	0.005	1	#_F_setup2741 
6	1991	1	0.000189055	0.005	1	#_F_setup2742 
6	1992	1	0.000183292	0.005	1	#_F_setup2743 
6	1993	1	0.000178842	0.005	1	#_F_setup2744 
6	1994	1	0.000170617	0.005	1	#_F_setup2745 
6	1995	1	0.000158542	0.005	1	#_F_setup2746 
6	1996	1	0.000151893	0.005	1	#_F_setup2747 
6	1997	1	0.000148379	0.005	1	#_F_setup2748 
6	1998	1	0.000145902	0.005	1	#_F_setup2749 
6	1999	1	0.000149735	0.005	1	#_F_setup2750 
6	2000	1	0.000155767	0.005	1	#_F_setup2751 
6	2001	1	0.000165076	0.005	1	#_F_setup2752 
6	2002	1	0.000177148	0.005	1	#_F_setup2753 
6	2003	1	0.000192509	0.005	1	#_F_setup2754 
6	2004	1	0.000203925	0.005	1	#_F_setup2755 
6	2005	1	0.000229455	0.005	1	#_F_setup2756 
6	2006	1	          0	0.005	1	#_F_setup2757 
6	2007	1	          0	0.005	1	#_F_setup2758 
6	2008	1	          0	0.005	1	#_F_setup2759 
6	2009	1	          0	0.005	1	#_F_setup2760 
6	2010	1	          0	0.005	1	#_F_setup2761 
6	2011	1	          0	0.005	1	#_F_setup2762 
6	2012	1	          0	0.005	1	#_F_setup2763 
6	2013	1	          0	0.005	1	#_F_setup2764 
6	2014	1	          0	0.005	1	#_F_setup2765 
6	2015	1	          0	0.005	1	#_F_setup2766 
6	2016	1	          0	0.005	1	#_F_setup2767 
6	2017	1	          0	0.005	1	#_F_setup2768 
6	2018	1	          0	0.005	1	#_F_setup2769 
6	2019	1	          0	0.005	1	#_F_setup2770 
6	2020	1	          0	0.005	1	#_F_setup2771 
6	2021	1	          0	0.005	1	#_F_setup2772 
6	2022	1	          0	0.005	1	#_F_setup2773 
6	2023	1	          0	0.005	1	#_F_setup2774 
6	2024	1	          0	0.005	1	#_F_setup2775 
6	2025	1	          0	0.005	1	#_F_setup2776 
6	2026	1	          0	0.005	1	#_F_setup2777 
6	2027	1	          0	0.005	1	#_F_setup2778 
6	2028	1	          0	0.005	1	#_F_setup2779 
6	2029	1	          0	0.005	1	#_F_setup2780 
6	2030	1	          0	0.005	1	#_F_setup2781 
6	2031	1	          0	0.005	1	#_F_setup2782 
6	2032	1	          0	0.005	1	#_F_setup2783 
6	2033	1	          0	0.005	1	#_F_setup2784 
6	2034	1	          0	0.005	1	#_F_setup2785 
6	2035	1	          0	0.005	1	#_F_setup2786 
6	2036	1	          0	0.005	1	#_F_setup2787 
6	2037	1	          0	0.005	1	#_F_setup2788 
6	2038	1	          0	0.005	1	#_F_setup2789 
6	2039	1	          0	0.005	1	#_F_setup2790 
6	2040	1	          0	0.005	1	#_F_setup2791 
6	2041	1	          0	0.005	1	#_F_setup2792 
6	2042	1	          0	0.005	1	#_F_setup2793 
6	2043	1	          0	0.005	1	#_F_setup2794 
6	2044	1	          0	0.005	1	#_F_setup2795 
6	2045	1	          0	0.005	1	#_F_setup2796 
6	2046	1	          0	0.005	1	#_F_setup2797 
6	2047	1	          0	0.005	1	#_F_setup2798 
6	2048	1	          0	0.005	1	#_F_setup2799 
6	2049	1	          0	0.005	1	#_F_setup2800 
6	2050	1	          0	0.005	1	#_F_setup2801 
6	2051	1	          0	0.005	1	#_F_setup2802 
6	2052	1	          0	0.005	1	#_F_setup2803 
6	2053	1	          0	0.005	1	#_F_setup2804 
6	2054	1	          0	0.005	1	#_F_setup2805 
6	2055	1	          0	0.005	1	#_F_setup2806 
6	2056	1	          0	0.005	1	#_F_setup2807 
6	2057	1	          0	0.005	1	#_F_setup2808 
6	2058	1	          0	0.005	1	#_F_setup2809 
6	2059	1	          0	0.005	1	#_F_setup2810 
6	2060	1	          0	0.005	1	#_F_setup2811 
6	2061	1	          0	0.005	1	#_F_setup2812 
6	2062	1	          0	0.005	1	#_F_setup2813 
6	2063	1	          0	0.005	1	#_F_setup2814 
6	2064	1	          0	0.005	1	#_F_setup2815 
6	2065	1	          0	0.005	1	#_F_setup2816 
6	2066	1	          0	0.005	1	#_F_setup2817 
6	2067	1	          0	0.005	1	#_F_setup2818 
6	2068	1	          0	0.005	1	#_F_setup2819 
6	2069	1	          0	0.005	1	#_F_setup2820 
6	2070	1	          0	0.005	1	#_F_setup2821 
6	2071	1	          0	0.005	1	#_F_setup2822 
6	2072	1	          0	0.005	1	#_F_setup2823 
6	2073	1	          0	0.005	1	#_F_setup2824 
6	2074	1	          0	0.005	1	#_F_setup2825 
6	2075	1	          0	0.005	1	#_F_setup2826 
6	2076	1	          0	0.005	1	#_F_setup2827 
6	2077	1	          0	0.005	1	#_F_setup2828 
6	2078	1	          0	0.005	1	#_F_setup2829 
6	2079	1	          0	0.005	1	#_F_setup2830 
6	2080	1	          0	0.005	1	#_F_setup2831 
6	2081	1	          0	0.005	1	#_F_setup2832 
6	2082	1	          0	0.005	1	#_F_setup2833 
6	2083	1	          0	0.005	1	#_F_setup2834 
6	2084	1	          0	0.005	1	#_F_setup2835 
6	2085	1	          0	0.005	1	#_F_setup2836 
6	2086	1	          0	0.005	1	#_F_setup2837 
6	2087	1	          0	0.005	1	#_F_setup2838 
6	2088	1	          0	0.005	1	#_F_setup2839 
6	2089	1	          0	0.005	1	#_F_setup2840 
6	2090	1	          0	0.005	1	#_F_setup2841 
6	2091	1	          0	0.005	1	#_F_setup2842 
6	2092	1	          0	0.005	1	#_F_setup2843 
6	2093	1	          0	0.005	1	#_F_setup2844 
6	2094	1	          0	0.005	1	#_F_setup2845 
6	2095	1	          0	0.005	1	#_F_setup2846 
6	2096	1	          0	0.005	1	#_F_setup2847 
6	2097	1	          0	0.005	1	#_F_setup2848 
6	2098	1	          0	0.005	1	#_F_setup2849 
6	2099	1	          0	0.005	1	#_F_setup2850 
6	2100	1	          0	0.005	1	#_F_setup2851 
6	2101	1	          0	0.005	1	#_F_setup2852 
6	2102	1	          0	0.005	1	#_F_setup2853 
6	2103	1	          0	0.005	1	#_F_setup2854 
6	2104	1	          0	0.005	1	#_F_setup2855 
6	2105	1	          0	0.005	1	#_F_setup2856 
6	2106	1	          0	0.005	1	#_F_setup2857 
6	2107	1	          0	0.005	1	#_F_setup2858 
6	2108	1	          0	0.005	1	#_F_setup2859 
6	2109	1	          0	0.005	1	#_F_setup2860 
6	2110	1	          0	0.005	1	#_F_setup2861 
6	2111	1	          0	0.005	1	#_F_setup2862 
6	2112	1	          0	0.005	1	#_F_setup2863 
6	2113	1	          0	0.005	1	#_F_setup2864 
6	2114	1	          0	0.005	1	#_F_setup2865 
6	2115	1	          0	0.005	1	#_F_setup2866 
6	2116	1	          0	0.005	1	#_F_setup2867 
6	2117	1	          0	0.005	1	#_F_setup2868 
6	2118	1	          0	0.005	1	#_F_setup2869 
6	2119	1	          0	0.005	1	#_F_setup2870 
6	2120	1	          0	0.005	1	#_F_setup2871 
6	2121	1	          0	0.005	1	#_F_setup2872 
6	2122	1	          0	0.005	1	#_F_setup2873 
6	2123	1	          0	0.005	1	#_F_setup2874 
6	2124	1	          0	0.005	1	#_F_setup2875 
7	1950	1	          0	0.005	1	#_F_setup2876 
7	1951	1	          0	0.005	1	#_F_setup2877 
7	1952	1	          0	0.005	1	#_F_setup2878 
7	1953	1	          0	0.005	1	#_F_setup2879 
7	1954	1	          0	0.005	1	#_F_setup2880 
7	1955	1	          0	0.005	1	#_F_setup2881 
7	1956	1	          0	0.005	1	#_F_setup2882 
7	1957	1	          0	0.005	1	#_F_setup2883 
7	1958	1	          0	0.005	1	#_F_setup2884 
7	1959	1	          0	0.005	1	#_F_setup2885 
7	1960	1	          0	0.005	1	#_F_setup2886 
7	1961	1	          0	0.005	1	#_F_setup2887 
7	1962	1	          0	0.005	1	#_F_setup2888 
7	1963	1	          0	0.005	1	#_F_setup2889 
7	1964	1	          0	0.005	1	#_F_setup2890 
7	1965	1	          0	0.005	1	#_F_setup2891 
7	1966	1	          0	0.005	1	#_F_setup2892 
7	1967	1	          0	0.005	1	#_F_setup2893 
7	1968	1	          0	0.005	1	#_F_setup2894 
7	1969	1	          0	0.005	1	#_F_setup2895 
7	1970	1	          0	0.005	1	#_F_setup2896 
7	1971	1	          0	0.005	1	#_F_setup2897 
7	1972	1	          0	0.005	1	#_F_setup2898 
7	1973	1	          0	0.005	1	#_F_setup2899 
7	1974	1	          0	0.005	1	#_F_setup2900 
7	1975	1	          0	0.005	1	#_F_setup2901 
7	1976	1	          0	0.005	1	#_F_setup2902 
7	1977	1	          0	0.005	1	#_F_setup2903 
7	1978	1	          0	0.005	1	#_F_setup2904 
7	1979	1	          0	0.005	1	#_F_setup2905 
7	1980	1	          0	0.005	1	#_F_setup2906 
7	1981	1	          0	0.005	1	#_F_setup2907 
7	1982	1	          0	0.005	1	#_F_setup2908 
7	1983	1	          0	0.005	1	#_F_setup2909 
7	1984	1	          0	0.005	1	#_F_setup2910 
7	1985	1	          0	0.005	1	#_F_setup2911 
7	1986	1	          0	0.005	1	#_F_setup2912 
7	1987	1	          0	0.005	1	#_F_setup2913 
7	1988	1	          0	0.005	1	#_F_setup2914 
7	1989	1	          0	0.005	1	#_F_setup2915 
7	1990	1	          0	0.005	1	#_F_setup2916 
7	1991	1	          0	0.005	1	#_F_setup2917 
7	1992	1	          0	0.005	1	#_F_setup2918 
7	1993	1	          0	0.005	1	#_F_setup2919 
7	1994	1	          0	0.005	1	#_F_setup2920 
7	1995	1	          0	0.005	1	#_F_setup2921 
7	1996	1	          0	0.005	1	#_F_setup2922 
7	1997	1	          0	0.005	1	#_F_setup2923 
7	1998	1	          0	0.005	1	#_F_setup2924 
7	1999	1	          0	0.005	1	#_F_setup2925 
7	2000	1	          0	0.005	1	#_F_setup2926 
7	2001	1	          0	0.005	1	#_F_setup2927 
7	2002	1	          0	0.005	1	#_F_setup2928 
7	2003	1	          0	0.005	1	#_F_setup2929 
7	2004	1	          0	0.005	1	#_F_setup2930 
7	2005	1	          0	0.005	1	#_F_setup2931 
7	2006	1	0.000250291	0.005	1	#_F_setup2932 
7	2007	1	0.000220192	0.005	1	#_F_setup2933 
7	2008	1	0.000661231	0.005	1	#_F_setup2934 
7	2009	1	 0.00062088	0.005	1	#_F_setup2935 
7	2010	1	0.000584435	0.005	1	#_F_setup2936 
7	2011	1	 0.00116869	0.005	1	#_F_setup2937 
7	2012	1	 0.00150825	0.005	1	#_F_setup2938 
7	2013	1	 0.00100987	0.005	1	#_F_setup2939 
7	2014	1	 0.00100084	0.005	1	#_F_setup2940 
7	2015	1	0.000428346	0.005	1	#_F_setup2941 
7	2016	1	0.000568956	0.005	1	#_F_setup2942 
7	2017	1	0.000614044	0.005	1	#_F_setup2943 
7	2018	1	0.000255334	0.005	1	#_F_setup2944 
7	2019	1	  0.0003291	0.005	1	#_F_setup2945 
7	2020	1	0.000322742	0.005	1	#_F_setup2946 
7	2021	1	0.000104234	0.005	1	#_F_setup2947 
7	2022	1	0.000202088	0.005	1	#_F_setup2948 
7	2023	1	 0.00011984	0.005	1	#_F_setup2949 
7	2024	1	6.37626e-05	0.005	1	#_F_setup2950 
7	2025	1	      0.001	0.005	1	#_F_setup2951 
7	2026	1	      0.001	0.005	1	#_F_setup2952 
7	2027	1	      0.001	0.005	1	#_F_setup2953 
7	2028	1	      0.001	0.005	1	#_F_setup2954 
7	2029	1	      0.001	0.005	1	#_F_setup2955 
7	2030	1	      0.001	0.005	1	#_F_setup2956 
7	2031	1	      0.001	0.005	1	#_F_setup2957 
7	2032	1	      0.001	0.005	1	#_F_setup2958 
7	2033	1	      0.001	0.005	1	#_F_setup2959 
7	2034	1	      0.001	0.005	1	#_F_setup2960 
7	2035	1	      0.001	0.005	1	#_F_setup2961 
7	2036	1	      0.001	0.005	1	#_F_setup2962 
7	2037	1	      0.001	0.005	1	#_F_setup2963 
7	2038	1	      0.001	0.005	1	#_F_setup2964 
7	2039	1	      0.001	0.005	1	#_F_setup2965 
7	2040	1	      0.001	0.005	1	#_F_setup2966 
7	2041	1	      0.001	0.005	1	#_F_setup2967 
7	2042	1	      0.001	0.005	1	#_F_setup2968 
7	2043	1	      0.001	0.005	1	#_F_setup2969 
7	2044	1	      0.001	0.005	1	#_F_setup2970 
7	2045	1	      0.001	0.005	1	#_F_setup2971 
7	2046	1	      0.001	0.005	1	#_F_setup2972 
7	2047	1	      0.001	0.005	1	#_F_setup2973 
7	2048	1	      0.001	0.005	1	#_F_setup2974 
7	2049	1	      0.001	0.005	1	#_F_setup2975 
7	2050	1	      0.001	0.005	1	#_F_setup2976 
7	2051	1	      0.001	0.005	1	#_F_setup2977 
7	2052	1	      0.001	0.005	1	#_F_setup2978 
7	2053	1	      0.001	0.005	1	#_F_setup2979 
7	2054	1	      0.001	0.005	1	#_F_setup2980 
7	2055	1	      0.001	0.005	1	#_F_setup2981 
7	2056	1	      0.001	0.005	1	#_F_setup2982 
7	2057	1	      0.001	0.005	1	#_F_setup2983 
7	2058	1	      0.001	0.005	1	#_F_setup2984 
7	2059	1	      0.001	0.005	1	#_F_setup2985 
7	2060	1	      0.001	0.005	1	#_F_setup2986 
7	2061	1	      0.001	0.005	1	#_F_setup2987 
7	2062	1	      0.001	0.005	1	#_F_setup2988 
7	2063	1	      0.001	0.005	1	#_F_setup2989 
7	2064	1	      0.001	0.005	1	#_F_setup2990 
7	2065	1	      0.001	0.005	1	#_F_setup2991 
7	2066	1	      0.001	0.005	1	#_F_setup2992 
7	2067	1	      0.001	0.005	1	#_F_setup2993 
7	2068	1	      0.001	0.005	1	#_F_setup2994 
7	2069	1	      0.001	0.005	1	#_F_setup2995 
7	2070	1	      0.001	0.005	1	#_F_setup2996 
7	2071	1	      0.001	0.005	1	#_F_setup2997 
7	2072	1	      0.001	0.005	1	#_F_setup2998 
7	2073	1	      0.001	0.005	1	#_F_setup2999 
7	2074	1	      0.001	0.005	1	#_F_setup21000
7	2075	1	      0.001	0.005	1	#_F_setup21001
7	2076	1	      0.001	0.005	1	#_F_setup21002
7	2077	1	      0.001	0.005	1	#_F_setup21003
7	2078	1	      0.001	0.005	1	#_F_setup21004
7	2079	1	      0.001	0.005	1	#_F_setup21005
7	2080	1	      0.001	0.005	1	#_F_setup21006
7	2081	1	      0.001	0.005	1	#_F_setup21007
7	2082	1	      0.001	0.005	1	#_F_setup21008
7	2083	1	      0.001	0.005	1	#_F_setup21009
7	2084	1	      0.001	0.005	1	#_F_setup21010
7	2085	1	      0.001	0.005	1	#_F_setup21011
7	2086	1	      0.001	0.005	1	#_F_setup21012
7	2087	1	      0.001	0.005	1	#_F_setup21013
7	2088	1	      0.001	0.005	1	#_F_setup21014
7	2089	1	      0.001	0.005	1	#_F_setup21015
7	2090	1	      0.001	0.005	1	#_F_setup21016
7	2091	1	      0.001	0.005	1	#_F_setup21017
7	2092	1	      0.001	0.005	1	#_F_setup21018
7	2093	1	      0.001	0.005	1	#_F_setup21019
7	2094	1	      0.001	0.005	1	#_F_setup21020
7	2095	1	      0.001	0.005	1	#_F_setup21021
7	2096	1	      0.001	0.005	1	#_F_setup21022
7	2097	1	      0.001	0.005	1	#_F_setup21023
7	2098	1	      0.001	0.005	1	#_F_setup21024
7	2099	1	      0.001	0.005	1	#_F_setup21025
7	2100	1	      0.001	0.005	1	#_F_setup21026
7	2101	1	      0.001	0.005	1	#_F_setup21027
7	2102	1	      0.001	0.005	1	#_F_setup21028
7	2103	1	      0.001	0.005	1	#_F_setup21029
7	2104	1	      0.001	0.005	1	#_F_setup21030
7	2105	1	      0.001	0.005	1	#_F_setup21031
7	2106	1	      0.001	0.005	1	#_F_setup21032
7	2107	1	      0.001	0.005	1	#_F_setup21033
7	2108	1	      0.001	0.005	1	#_F_setup21034
7	2109	1	      0.001	0.005	1	#_F_setup21035
7	2110	1	      0.001	0.005	1	#_F_setup21036
7	2111	1	      0.001	0.005	1	#_F_setup21037
7	2112	1	      0.001	0.005	1	#_F_setup21038
7	2113	1	      0.001	0.005	1	#_F_setup21039
7	2114	1	      0.001	0.005	1	#_F_setup21040
7	2115	1	      0.001	0.005	1	#_F_setup21041
7	2116	1	      0.001	0.005	1	#_F_setup21042
7	2117	1	      0.001	0.005	1	#_F_setup21043
7	2118	1	      0.001	0.005	1	#_F_setup21044
7	2119	1	      0.001	0.005	1	#_F_setup21045
7	2120	1	      0.001	0.005	1	#_F_setup21046
7	2121	1	      0.001	0.005	1	#_F_setup21047
7	2122	1	      0.001	0.005	1	#_F_setup21048
7	2123	1	      0.001	0.005	1	#_F_setup21049
7	2124	1	      0.001	0.005	1	#_F_setup21050
8	1950	1	          0	0.005	1	#_F_setup21051
8	1951	1	          0	0.005	1	#_F_setup21052
8	1952	1	          0	0.005	1	#_F_setup21053
8	1953	1	          0	0.005	1	#_F_setup21054
8	1954	1	          0	0.005	1	#_F_setup21055
8	1955	1	          0	0.005	1	#_F_setup21056
8	1956	1	          0	0.005	1	#_F_setup21057
8	1957	1	          0	0.005	1	#_F_setup21058
8	1958	1	          0	0.005	1	#_F_setup21059
8	1959	1	          0	0.005	1	#_F_setup21060
8	1960	1	          0	0.005	1	#_F_setup21061
8	1961	1	          0	0.005	1	#_F_setup21062
8	1962	1	          0	0.005	1	#_F_setup21063
8	1963	1	          0	0.005	1	#_F_setup21064
8	1964	1	          0	0.005	1	#_F_setup21065
8	1965	1	          0	0.005	1	#_F_setup21066
8	1966	1	          0	0.005	1	#_F_setup21067
8	1967	1	          0	0.005	1	#_F_setup21068
8	1968	1	          0	0.005	1	#_F_setup21069
8	1969	1	          0	0.005	1	#_F_setup21070
8	1970	1	          0	0.005	1	#_F_setup21071
8	1971	1	          0	0.005	1	#_F_setup21072
8	1972	1	          0	0.005	1	#_F_setup21073
8	1973	1	          0	0.005	1	#_F_setup21074
8	1974	1	          0	0.005	1	#_F_setup21075
8	1975	1	          0	0.005	1	#_F_setup21076
8	1976	1	          0	0.005	1	#_F_setup21077
8	1977	1	          0	0.005	1	#_F_setup21078
8	1978	1	          0	0.005	1	#_F_setup21079
8	1979	1	          0	0.005	1	#_F_setup21080
8	1980	1	          0	0.005	1	#_F_setup21081
8	1981	1	          0	0.005	1	#_F_setup21082
8	1982	1	          0	0.005	1	#_F_setup21083
8	1983	1	          0	0.005	1	#_F_setup21084
8	1984	1	          0	0.005	1	#_F_setup21085
8	1985	1	          0	0.005	1	#_F_setup21086
8	1986	1	          0	0.005	1	#_F_setup21087
8	1987	1	          0	0.005	1	#_F_setup21088
8	1988	1	          0	0.005	1	#_F_setup21089
8	1989	1	          0	0.005	1	#_F_setup21090
8	1990	1	          0	0.005	1	#_F_setup21091
8	1991	1	          0	0.005	1	#_F_setup21092
8	1992	1	          0	0.005	1	#_F_setup21093
8	1993	1	          0	0.005	1	#_F_setup21094
8	1994	1	          0	0.005	1	#_F_setup21095
8	1995	1	          0	0.005	1	#_F_setup21096
8	1996	1	          0	0.005	1	#_F_setup21097
8	1997	1	          0	0.005	1	#_F_setup21098
8	1998	1	          0	0.005	1	#_F_setup21099
8	1999	1	          0	0.005	1	#_F_setup21100
8	2000	1	          0	0.005	1	#_F_setup21101
8	2001	1	          0	0.005	1	#_F_setup21102
8	2002	1	          0	0.005	1	#_F_setup21103
8	2003	1	          0	0.005	1	#_F_setup21104
8	2004	1	          0	0.005	1	#_F_setup21105
8	2005	1	          0	0.005	1	#_F_setup21106
8	2006	1	0.000277872	0.005	1	#_F_setup21107
8	2007	1	0.000194784	0.005	1	#_F_setup21108
8	2008	1	 0.00039205	0.005	1	#_F_setup21109
8	2009	1	0.000323464	0.005	1	#_F_setup21110
8	2010	1	0.000596949	0.005	1	#_F_setup21111
8	2011	1	0.000489857	0.005	1	#_F_setup21112
8	2012	1	0.000684074	0.005	1	#_F_setup21113
8	2013	1	 0.00042311	0.005	1	#_F_setup21114
8	2014	1	0.000132097	0.005	1	#_F_setup21115
8	2015	1	0.000124187	0.005	1	#_F_setup21116
8	2016	1	0.000158611	0.005	1	#_F_setup21117
8	2017	1	8.16291e-05	0.005	1	#_F_setup21118
8	2018	1	9.68993e-05	0.005	1	#_F_setup21119
8	2019	1	0.000140571	0.005	1	#_F_setup21120
8	2020	1	0.000128258	0.005	1	#_F_setup21121
8	2021	1	1.42678e-05	0.005	1	#_F_setup21122
8	2022	1	1.16487e-05	0.005	1	#_F_setup21123
8	2023	1	  2.674e-05	0.005	1	#_F_setup21124
8	2024	1	1.63337e-05	0.005	1	#_F_setup21125
8	2025	1	      0.001	0.005	1	#_F_setup21126
8	2026	1	      0.001	0.005	1	#_F_setup21127
8	2027	1	      0.001	0.005	1	#_F_setup21128
8	2028	1	      0.001	0.005	1	#_F_setup21129
8	2029	1	      0.001	0.005	1	#_F_setup21130
8	2030	1	      0.001	0.005	1	#_F_setup21131
8	2031	1	      0.001	0.005	1	#_F_setup21132
8	2032	1	      0.001	0.005	1	#_F_setup21133
8	2033	1	      0.001	0.005	1	#_F_setup21134
8	2034	1	      0.001	0.005	1	#_F_setup21135
8	2035	1	      0.001	0.005	1	#_F_setup21136
8	2036	1	      0.001	0.005	1	#_F_setup21137
8	2037	1	      0.001	0.005	1	#_F_setup21138
8	2038	1	      0.001	0.005	1	#_F_setup21139
8	2039	1	      0.001	0.005	1	#_F_setup21140
8	2040	1	      0.001	0.005	1	#_F_setup21141
8	2041	1	      0.001	0.005	1	#_F_setup21142
8	2042	1	      0.001	0.005	1	#_F_setup21143
8	2043	1	      0.001	0.005	1	#_F_setup21144
8	2044	1	      0.001	0.005	1	#_F_setup21145
8	2045	1	      0.001	0.005	1	#_F_setup21146
8	2046	1	      0.001	0.005	1	#_F_setup21147
8	2047	1	      0.001	0.005	1	#_F_setup21148
8	2048	1	      0.001	0.005	1	#_F_setup21149
8	2049	1	      0.001	0.005	1	#_F_setup21150
8	2050	1	      0.001	0.005	1	#_F_setup21151
8	2051	1	      0.001	0.005	1	#_F_setup21152
8	2052	1	      0.001	0.005	1	#_F_setup21153
8	2053	1	      0.001	0.005	1	#_F_setup21154
8	2054	1	      0.001	0.005	1	#_F_setup21155
8	2055	1	      0.001	0.005	1	#_F_setup21156
8	2056	1	      0.001	0.005	1	#_F_setup21157
8	2057	1	      0.001	0.005	1	#_F_setup21158
8	2058	1	      0.001	0.005	1	#_F_setup21159
8	2059	1	      0.001	0.005	1	#_F_setup21160
8	2060	1	      0.001	0.005	1	#_F_setup21161
8	2061	1	      0.001	0.005	1	#_F_setup21162
8	2062	1	      0.001	0.005	1	#_F_setup21163
8	2063	1	      0.001	0.005	1	#_F_setup21164
8	2064	1	      0.001	0.005	1	#_F_setup21165
8	2065	1	      0.001	0.005	1	#_F_setup21166
8	2066	1	      0.001	0.005	1	#_F_setup21167
8	2067	1	      0.001	0.005	1	#_F_setup21168
8	2068	1	      0.001	0.005	1	#_F_setup21169
8	2069	1	      0.001	0.005	1	#_F_setup21170
8	2070	1	      0.001	0.005	1	#_F_setup21171
8	2071	1	      0.001	0.005	1	#_F_setup21172
8	2072	1	      0.001	0.005	1	#_F_setup21173
8	2073	1	      0.001	0.005	1	#_F_setup21174
8	2074	1	      0.001	0.005	1	#_F_setup21175
8	2075	1	      0.001	0.005	1	#_F_setup21176
8	2076	1	      0.001	0.005	1	#_F_setup21177
8	2077	1	      0.001	0.005	1	#_F_setup21178
8	2078	1	      0.001	0.005	1	#_F_setup21179
8	2079	1	      0.001	0.005	1	#_F_setup21180
8	2080	1	      0.001	0.005	1	#_F_setup21181
8	2081	1	      0.001	0.005	1	#_F_setup21182
8	2082	1	      0.001	0.005	1	#_F_setup21183
8	2083	1	      0.001	0.005	1	#_F_setup21184
8	2084	1	      0.001	0.005	1	#_F_setup21185
8	2085	1	      0.001	0.005	1	#_F_setup21186
8	2086	1	      0.001	0.005	1	#_F_setup21187
8	2087	1	      0.001	0.005	1	#_F_setup21188
8	2088	1	      0.001	0.005	1	#_F_setup21189
8	2089	1	      0.001	0.005	1	#_F_setup21190
8	2090	1	      0.001	0.005	1	#_F_setup21191
8	2091	1	      0.001	0.005	1	#_F_setup21192
8	2092	1	      0.001	0.005	1	#_F_setup21193
8	2093	1	      0.001	0.005	1	#_F_setup21194
8	2094	1	      0.001	0.005	1	#_F_setup21195
8	2095	1	      0.001	0.005	1	#_F_setup21196
8	2096	1	      0.001	0.005	1	#_F_setup21197
8	2097	1	      0.001	0.005	1	#_F_setup21198
8	2098	1	      0.001	0.005	1	#_F_setup21199
8	2099	1	      0.001	0.005	1	#_F_setup21200
8	2100	1	      0.001	0.005	1	#_F_setup21201
8	2101	1	      0.001	0.005	1	#_F_setup21202
8	2102	1	      0.001	0.005	1	#_F_setup21203
8	2103	1	      0.001	0.005	1	#_F_setup21204
8	2104	1	      0.001	0.005	1	#_F_setup21205
8	2105	1	      0.001	0.005	1	#_F_setup21206
8	2106	1	      0.001	0.005	1	#_F_setup21207
8	2107	1	      0.001	0.005	1	#_F_setup21208
8	2108	1	      0.001	0.005	1	#_F_setup21209
8	2109	1	      0.001	0.005	1	#_F_setup21210
8	2110	1	      0.001	0.005	1	#_F_setup21211
8	2111	1	      0.001	0.005	1	#_F_setup21212
8	2112	1	      0.001	0.005	1	#_F_setup21213
8	2113	1	      0.001	0.005	1	#_F_setup21214
8	2114	1	      0.001	0.005	1	#_F_setup21215
8	2115	1	      0.001	0.005	1	#_F_setup21216
8	2116	1	      0.001	0.005	1	#_F_setup21217
8	2117	1	      0.001	0.005	1	#_F_setup21218
8	2118	1	      0.001	0.005	1	#_F_setup21219
8	2119	1	      0.001	0.005	1	#_F_setup21220
8	2120	1	      0.001	0.005	1	#_F_setup21221
8	2121	1	      0.001	0.005	1	#_F_setup21222
8	2122	1	      0.001	0.005	1	#_F_setup21223
8	2123	1	      0.001	0.005	1	#_F_setup21224
8	2124	1	      0.001	0.005	1	#_F_setup21225
#
#_initial_F_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
0	5	0.186353	0.5	1	1	1	#_InitF_seas_1_flt_2Pot_fisheries_historical
#
#_Q_setup for fleets with cpue or survey data
#_fleet	link	link_info	extra_se	biasadj	float  #  fleetname
    1	1	0	1	1	1	#_Observer_inshore_u10   
    3	1	0	1	1	1	#_Pot_fisheries_u10      
    4	1	0	1	1	1	#_Pot_fisheries_10to12   
    5	1	0	1	1	1	#_Pot_fisheries_o12      
    8	1	0	1	1	1	#_Bycatch_fisheries_trawl
    9	1	0	1	1	1	#_Observer_prerecruit_u10
-9999	0	0	0	0	0	#_terminator             
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
  -50	 50	  -4.75561	 -1	1	1	-1	0	0	0	0	0	0	0	#_LnQ_base_Observer_inshore_u10(1)    
1e-06	0.2	 0.0337811	0.1	3	3	 3	0	0	0	0	0	0	0	#_Q_extraSD_Observer_inshore_u10(1)   
  -50	 50	  -7.21388	 -5	1	1	-1	0	0	0	0	0	0	0	#_LnQ_base_Pot_fisheries_u10(3)       
1e-06	0.1	0.00490586	0.1	3	3	 3	0	0	0	0	0	0	0	#_Q_extraSD_Pot_fisheries_u10(3)      
  -50	 50	  -8.63315	 -3	1	1	-1	0	0	0	0	0	0	0	#_LnQ_base_Pot_fisheries_10to12(4)    
1e-06	0.4	  0.160899	0.1	3	3	 3	0	0	0	0	0	0	0	#_Q_extraSD_Pot_fisheries_10to12(4)   
  -50	 50	  -8.89772	 -3	1	1	-1	0	0	0	0	0	0	0	#_LnQ_base_Pot_fisheries_o12(5)       
1e-06	0.4	  0.159433	0.1	3	3	 3	0	0	0	0	0	0	0	#_Q_extraSD_Pot_fisheries_o12(5)      
  -50	 99	  -10.3897	  4	1	1	-1	0	0	0	0	0	0	0	#_LnQ_base_Bycatch_fisheries_trawl(8) 
1e-06	0.2	 0.0428628	0.1	3	3	 3	0	0	0	0	0	0	0	#_Q_extraSD_Bycatch_fisheries_trawl(8)
  -50	 99	  -6.63788	 10	1	1	-1	0	0	0	0	0	0	0	#_LnQ_base_Observer_prerecruit_u10(9) 
1e-06	0.5	 0.0535688	0.1	3	3	 3	0	0	0	0	0	0	0	#_Q_extraSD_Observer_prerecruit_u10(9)
#_no timevary Q parameters
#
#_size_selex_patterns
#_Pattern	Discard	Male	Special
24	2	4	0	#_1 Observer_inshore_u10        
24	2	4	0	#_2 Pot_fisheries_historical    
24	2	4	0	#_3 Pot_fisheries_u10           
15	0	0	3	#_4 Pot_fisheries_10to12        
15	0	0	2	#_5 Pot_fisheries_o12           
23	0	0	0	#_6 Bycatch_fisheries_historical
15	0	0	6	#_7 Bycatch_fisheries_gillnet   
15	0	0	6	#_8 Bycatch_fisheries_trawl     
15	0	0	1	#_9 Observer_prerecruit_u10     
#
#_age_selex_patterns
#_Pattern	Discard	Male	Special
0	0	0	0	#_1 Observer_inshore_u10        
0	0	0	1	#_2 Pot_fisheries_historical    
0	0	0	1	#_3 Pot_fisheries_u10           
0	0	0	1	#_4 Pot_fisheries_10to12        
0	0	0	1	#_5 Pot_fisheries_o12           
0	0	0	1	#_6 Bycatch_fisheries_historical
0	0	0	1	#_7 Bycatch_fisheries_gillnet   
0	0	0	1	#_8 Bycatch_fisheries_trawl     
0	0	0	1	#_9 Observer_prerecruit_u10     
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
    5	 22	     8.96991	 9.6	 99	6	  1	0	0	0	0	0	0	0	#_SizeSel_P_1_Observer_inshore_u10(1)          
  -50	  9	    -11.8256	  -8	 99	6	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_Observer_inshore_u10(1)          
   -9	  9	     0.81311	 1.2	 99	6	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_Observer_inshore_u10(1)          
   -9	  9	     1.99332	 1.6	 99	6	  3	0	0	0	0	0	0	0	#_SizeSel_P_4_Observer_inshore_u10(1)          
  -35	 50	        -999	 -12	 99	6	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Observer_inshore_u10(1)          
  -90	 30	    -8.75015	 -13	 99	6	  3	0	0	0	0	0	0	0	#_SizeSel_P_6_Observer_inshore_u10(1)          
    8	  9	         8.5	 8.5	  1	1	  2	0	0	0	0	0	2	2	#_SizeSel_PRet_1_Observer_inshore_u10(1)       
1e-06	500	         250	   5	  1	1	  2	0	0	0	0	0	2	2	#_SizeSel_PRet_2_Observer_inshore_u10(1)       
  -50	500	     5.15788	   5	 99	6	  3	0	0	0	0	0	2	2	#_SizeSel_PRet_3_Observer_inshore_u10(1)       
  -50	500	    0.275333	 0.1	 99	6	  3	0	0	0	0	0	2	2	#_SizeSel_PRet_4_Observer_inshore_u10(1)       
    0	 15	    0.620556	 0.5	 99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PDis_1_Observer_inshore_u10(1)       
    0	 10	   0.0827097	   5	 99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PDis_2_Observer_inshore_u10(1)       
    0	  1	  0.00050554	 0.1	 99	0	 -5	0	0	0	0	0	0	0	#_SizeSel_PDis_3_Observer_inshore_u10(1)       
  -50	 50	     1.00916	   1	 99	0	 -5	0	0	0	0	0	0	0	#_SizeSel_PDis_4_Observer_inshore_u10(1)       
  -20	 20	   0.0072385	  -2	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_1_Observer_inshore_u10(1)    
  -20	 20	   -0.105646	  -1	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_2_Observer_inshore_u10(1)    
  -20	 20	   -0.655818	   0	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_3_Observer_inshore_u10(1)    
  -20	 20	     2.18501	   0	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_4_Observer_inshore_u10(1)    
    0	  1	    0.965153	 0.5	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_5_Observer_inshore_u10(1)    
    2	 22	     6.28556	 7.5	  1	1	  1	0	0	0	0	0	0	0	#_SizeSel_P_1_Pot_fisheries_historical(2)      
  -60	 10	         -25	 -25	  1	1	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_Pot_fisheries_historical(2)      
  -30	  9	     1.92377	 2.5	  1	1	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_Pot_fisheries_historical(2)      
   -1	  9	     2.91152	   2	 99	6	  3	0	0	0	0	0	0	0	#_SizeSel_P_4_Pot_fisheries_historical(2)      
  -35	 50	        -999	  -5	 99	6	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Pot_fisheries_historical(2)      
  -90	 50	     -20.007	 -13	  1	1	  3	0	0	0	0	0	0	0	#_SizeSel_P_6_Pot_fisheries_historical(2)      
  8.2	  9	     8.31479	 8.5	  1	1	  2	0	0	0	0	0	2	2	#_SizeSel_PRet_1_Pot_fisheries_historical(2)   
    0	  1	    0.109177	 0.5	  1	1	  2	0	0	0	0	0	2	2	#_SizeSel_PRet_2_Pot_fisheries_historical(2)   
  -10	 10	     1.76562	   1	  1	1	  3	0	0	0	0	0	2	2	#_SizeSel_PRet_3_Pot_fisheries_historical(2)   
  -10	 10	   0.0467574	   1	 99	6	  3	0	0	0	0	0	2	2	#_SizeSel_PRet_4_Pot_fisheries_historical(2)   
    0	 15	    0.620556	   3	 99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PDis_1_Pot_fisheries_historical(2)   
    0	 10	   0.0827097	   5	 99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PDis_2_Pot_fisheries_historical(2)   
    0	  1	  0.00050554	0.01	 99	0	 -5	0	0	0	0	0	0	0	#_SizeSel_PDis_3_Pot_fisheries_historical(2)   
  -10	 10	     1.00916	   1	 99	0	 -5	0	0	0	0	0	0	0	#_SizeSel_PDis_4_Pot_fisheries_historical(2)   
  -20	 20	     1.34912	  -2	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_1_Pot_fisheries_historical(2)
  -20	 20	     1.12483	  -1	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_2_Pot_fisheries_historical(2)
  -20	 20	   -0.218847	   0	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_3_Pot_fisheries_historical(2)
  -20	 20	 -0.00217568	   0	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_4_Pot_fisheries_historical(2)
    0	  1	    0.990013	 0.5	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_5_Pot_fisheries_historical(2)
    3	 22	     6.46157	 7.5	  1	3	  1	0	0	0	0	0	0	0	#_SizeSel_P_1_Pot_fisheries_u10(3)             
  -20	 10	    -1.63616	-1.3	  1	1	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_Pot_fisheries_u10(3)             
  -90	 10	         -40	  -5	  1	1	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_Pot_fisheries_u10(3)             
   -5	  9	     1.81019	   2	 99	6	  3	0	0	0	0	0	0	0	#_SizeSel_P_4_Pot_fisheries_u10(3)             
  -35	  9	        -999	 -11	 99	6	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Pot_fisheries_u10(3)             
  -30	  9	     -11.439	 -13	  1	1	  3	0	0	0	0	0	0	0	#_SizeSel_P_6_Pot_fisheries_u10(3)             
  8.2	  9	         8.6	 8.5	  1	1	  2	0	0	0	0	0	2	2	#_SizeSel_PRet_1_Pot_fisheries_u10(3)          
    0	900	         450	   5	  1	1	  2	0	0	0	0	0	2	2	#_SizeSel_PRet_2_Pot_fisheries_u10(3)          
  -90	900	     5.09212	   5	 99	6	  3	0	0	0	0	0	2	2	#_SizeSel_PRet_3_Pot_fisheries_u10(3)          
  -90	500	    0.189062	 0.1	 99	6	  3	0	0	0	0	0	2	2	#_SizeSel_PRet_4_Pot_fisheries_u10(3)          
    0	 15	    0.620556	   3	 99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PDis_1_Pot_fisheries_u10(3)          
    0	 10	   0.0827097	   0	 99	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PDis_2_Pot_fisheries_u10(3)          
    0	  1	  0.00050554	0.01	 99	0	 -5	0	0	0	0	0	0	0	#_SizeSel_PDis_3_Pot_fisheries_u10(3)          
  -50	 50	     1.00916	   1	 99	0	 -5	0	0	0	0	0	0	0	#_SizeSel_PDis_4_Pot_fisheries_u10(3)          
  -20	 20	      -0.224	  -2	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_1_Pot_fisheries_u10(3)       
  -20	 20	-3.53764e-08	  -1	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_2_Pot_fisheries_u10(3)       
  -20	 20	    0.212946	   0	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_3_Pot_fisheries_u10(3)       
  -20	 20	    -1.56453	   0	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_4_Pot_fisheries_u10(3)       
    0	  1	    0.977796	 0.5	0.1	1	  4	0	0	0	0	0	0	0	#_SizeSel_PFemOff_5_Pot_fisheries_u10(3)       
    2	 22	           8	   8	 99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_1_Bycatch_fisheries_historical(6)  
  -10	 10	           1	   0	 99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_2_Bycatch_fisheries_historical(6)  
  -10	 10	           0	   0	 99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_3_Bycatch_fisheries_historical(6)  
  -10	 10	           0	   0	 99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_4_Bycatch_fisheries_historical(6)  
  -10	 10	        -999	   0	 99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Bycatch_fisheries_historical(6)  
  -10	 10	           1	   0	 99	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_Bycatch_fisheries_historical(6)  
#_AgeSelex
#_No age_selex_parm
# timevary selex parameters 
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
  8.5	  9	      8.75	 8.7	1	1	2	#_SizeSel_PRet_1_Observer_inshore_u10(1)_BLK2repl_1993    
  8.7	9.2	   8.84659	   9	1	1	2	#_SizeSel_PRet_1_Observer_inshore_u10(1)_BLK2repl_1997    
1e-06	900	       450	  10	1	1	2	#_SizeSel_PRet_2_Observer_inshore_u10(1)_BLK2repl_1993    
    0	  2	  0.113857	 0.1	1	1	2	#_SizeSel_PRet_2_Observer_inshore_u10(1)_BLK2repl_1997    
  -10	900	       445	  10	1	1	3	#_SizeSel_PRet_3_Observer_inshore_u10(1)_BLK2repl_1993    
  -10	 10	   1.21478	   1	1	1	3	#_SizeSel_PRet_3_Observer_inshore_u10(1)_BLK2repl_1997    
  -10	900	       445	  10	1	1	3	#_SizeSel_PRet_4_Observer_inshore_u10(1)_BLK2repl_1993    
  -10	 10	  0.031412	0.05	1	1	3	#_SizeSel_PRet_4_Observer_inshore_u10(1)_BLK2repl_1997    
  8.5	  9	   8.59601	 8.7	1	1	2	#_SizeSel_PRet_1_Pot_fisheries_historical(2)_BLK2repl_1993
  8.7	9.3	   8.76866	   9	1	1	2	#_SizeSel_PRet_1_Pot_fisheries_historical(2)_BLK2repl_1997
    0	  2	  0.100062	   1	1	1	2	#_SizeSel_PRet_2_Pot_fisheries_historical(2)_BLK2repl_1993
    0	  1	  0.138904	   1	1	1	2	#_SizeSel_PRet_2_Pot_fisheries_historical(2)_BLK2repl_1997
  -10	 10	   2.09235	   1	1	1	3	#_SizeSel_PRet_3_Pot_fisheries_historical(2)_BLK2repl_1993
  -10	 10	   2.71124	   1	1	1	3	#_SizeSel_PRet_3_Pot_fisheries_historical(2)_BLK2repl_1997
  -10	 10	 0.0155982	   0	1	1	3	#_SizeSel_PRet_4_Pot_fisheries_historical(2)_BLK2repl_1993
  -10	 10	 0.0232465	   0	1	1	3	#_SizeSel_PRet_4_Pot_fisheries_historical(2)_BLK2repl_1997
  8.5	  9	      8.75	 8.7	1	1	2	#_SizeSel_PRet_1_Pot_fisheries_u10(3)_BLK2repl_1993       
  8.7	9.3	   8.79854	   9	1	1	2	#_SizeSel_PRet_1_Pot_fisheries_u10(3)_BLK2repl_1997       
1e-06	900	       450	  10	1	1	2	#_SizeSel_PRet_2_Pot_fisheries_u10(3)_BLK2repl_1993       
    0	  1	 0.0946603	 0.3	1	1	2	#_SizeSel_PRet_2_Pot_fisheries_u10(3)_BLK2repl_1997       
  -10	900	       445	   5	1	1	3	#_SizeSel_PRet_3_Pot_fisheries_u10(3)_BLK2repl_1993       
  -10	 10	   3.10588	   2	1	1	3	#_SizeSel_PRet_3_Pot_fisheries_u10(3)_BLK2repl_1997       
  -10	900	       445	  10	1	1	3	#_SizeSel_PRet_4_Pot_fisheries_u10(3)_BLK2repl_1993       
  -10	 10	-0.0384866	   0	1	1	3	#_SizeSel_PRet_4_Pot_fisheries_u10(3)_BLK2repl_1997       
# info on dev vectors created for selex parms are reported with other devs after tag parameter section
#
0 #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
# Tag loss and Tag reporting parameters go next
0 # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# Input variance adjustments factors: 
#_factor	fleet	value
    1	1	      0	#_Variance_adjustment_list1 
    4	1	5.63831	#_Variance_adjustment_list2 
    1	2	      0	#_Variance_adjustment_list3 
    4	2	46.5813	#_Variance_adjustment_list4 
    1	3	      0	#_Variance_adjustment_list5 
    4	3	2.83373	#_Variance_adjustment_list6 
    1	4	      0	#_Variance_adjustment_list7 
    1	5	      0	#_Variance_adjustment_list8 
    1	7	      0	#_Variance_adjustment_list9 
    1	8	      0	#_Variance_adjustment_list10
-9999	0	      0	#_terminator                
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 7 changes to default Lambdas (default value is 1.0)
#_like_comp	fleet	phase	value	sizefreq_method
    1	1	2	1	1	#_Surv_Observer_inshore_u10_Phz2                        
    1	4	2	1	1	#_Surv_Pot_fisheries_10to12_Phz2                        
    4	1	2	1	1	#_length_Observer_inshore_u10_sizefreq_method_1_Phz2    
    8	2	2	1	1	#_catch_Pot_fisheries_historical_Phz2                   
    4	2	2	1	1	#_length_Pot_fisheries_historical_sizefreq_method_1_Phz2
    8	3	2	1	1	#_catch_Pot_fisheries_u10_Phz2                          
    4	3	2	1	1	#_length_Pot_fisheries_u10_sizefreq_method_1_Phz2       
-9999	0	0	0	0	#_terminator                                            
#
0 # 0/1 read specs for more stddev reporting
#
999
