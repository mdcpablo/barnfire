import sys
sys.path.append('../src')

from driver import *


"""
Using Barnfire to generate FEDS cross sections (in newGridXML format) for the following:

temp = 20.45 $ 293.6 Kelvin
mat 1 # 0.0001
  7014  0.78
  8016  0.22
mat 2 # 18.4801891202
  6012   0.022465200000000005 
  26000  0.0039430734859 
  74000  0.0010933423512100001 
  92234  0.010787999999999999
  92235  0.87139 
  92238  0.09032084999999998
mat 3 # 1.5298810948
  6012  1.0
mat 4 # .001293
  7014  0.78
  8016  0.22
"""

# MCNP
"""
C Cell Cards
100  0                   -10      imp:n=1
200  1000 -18.4801891202  10 -20  imp:n=1
300  2000 -1.5298810948   20 -30  imp:n=1
400  0                        30  imp:n=0

C Surface Cards
10 so 4.029
20 so 9.150
30 so 12.60

C Data Cards
kcode 3500 1.0 45 345
ksrc 6 0 0
C Material Cards
m1000 92234.90c 0.010788
      92235.90c 0.87139
      92238.90c 0.09032085
      6000.90c  0.0224652
      26054.90c 0.000230472074
      26056.90c 0.003617928505
      26057.90c 0.000083553482
      26058.90c 0.000011119425
      74180.90c 0.000001312011
      74182.90c 0.000289735723
      74183.90c 0.000156457290
      74184.90c 0.000335000096
      74186.90c 0.000310837230
m2000 6000.90c 1
"""

###############################################################################
# Air
N = Element()
N.name = 'n' # lower case 
N.Name = 'N' # upper case
N.AtomFractionsDict = {14: 1.} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

O = Element()
O.name = 'o' # lower case 
O.Name = 'O' # upper case
O.AtomFractionsDict = {16: 1.} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

UnpolutedAir = Material()
UnpolutedAir.Name = 'UnpolutedAir' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
UnpolutedAir.temperature = 293.6 # Kelvin
UnpolutedAir.elements = [N, O] # list of elements that your material is composed of
UnpolutedAir.elemAtomFracDict = {'N': 0.78, 'O': 0.22} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
UnpolutedAir.massDensity = 0.001293 # grams/cm^3
UnpolutedAir.fuelRadius = 0. # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
UnpolutedAir.shape = 'inf' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

###############################################################################
# HEU
C = Element()
C.name = 'c' # lower case 
C.Name = 'C' # upper case
C.AtomFractionsDict = {0: 1.} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

Fe = Element()
Fe.name = 'fe' # lower case 
Fe.Name = 'Fe' # upper case
Fe.AtomFractionsDict = {54:8.68307E-06, 56:1.36306E-04, 57:3.14789E-06, 58:4.18926E-07} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

W = Element()
W.name = 'w' # lower case 
W.Name = 'W' # upper case
W.AtomFractionsDict = {180: 0.0012, 182: 0.2650, 183: 0.1431, 184:0.3064, 186:0.2843} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

U = Element()
U.name = 'u' # lower case 
U.Name = 'U' # upper case
U.AtomFractionsDict = {234:0.010788, 235:0.87139, 238:0.09032085} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

HEU19 = Material() 
HEU19.Name = 'HEU19' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
HEU19.temperature = 293.6 # Kelvin
HEU19.elements = [C,Fe,W,U] # list of elements that your material is composed of
HEU19.elemAtomFracDict = {'C': 0.0224652, 'Fe':0.0039430734859, 'W':0.00109334235121, 'U':(0.010788+0.87139+0.09032085)} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
HEU19.massDensity = 18.4801891202 # grams/cm^3
HEU19.fuelRadius = 9.150 # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
HEU19.shape = 'sphere' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

###############################################################################
# Carbon
C = Element()
C.name = 'c' # lower case 
C.Name = 'C' # upper case
C.AtomFractionsDict = {0: 1.} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

Carbon12 = Material() 
Carbon12.Name = 'Carbon12' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
Carbon12.temperature = 293.6 # Kelvin
Carbon12.elements = [C] # list of elements that your material is composed of
Carbon12.elemAtomFracDict = {'C': 1} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
Carbon12.massDensity = 1.5298810948 # grams/cm^3
Carbon12.fuelRadius = 12.6 # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
Carbon12.shape = 'sphere' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

###############################################################################
geom = Material_Geometry()
geom.Name = 'HEU_MET_FAST_019' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
geom.unimportantMats = [UnpolutedAir] # list of materials that have a negligible effect on your weighting spectrum in important regions of the geometry
geom.importantMats = [HEU19, Carbon12] # list of materials that affect your weighting spectrum in important regions of the geometry
geom.importanceDict = {HEU19.Name: 10, Carbon12.Name: 1} # relative importance of each material for your clustering algorithm

# MODIFYING BARNFIRE SOURCE CODE
modify_materials_materials_source_code(geom)
modify_indicators_clustering_source_code(geom)
modify_indicators_source_code(geom)
###############################################################################
prob_1 = problem()

prob_1.create_multigroup_structure = True # set to True... unless you want to manually create a multigroup or coarse-group structure in $SCRATCH_BARN/dat/energy_groups and set "G=your_mg_structure_file" in the bash script (which is produced after running "LLNL_barnfire_driver.py")
prob_1.range_bounds = [1e-5, 1e-3, 1.4e7, 1.42e7] # energy boundaries for the thermal, intermediate, and fast energy ranges, respectively... FEDS is only used in the intermediate region, MG is used for thermal and fast regions
prob_1.log_spacing = True # energy spacing for MG, and coarse-groups in the intermediate energy range (True=logarithmic, False=linear) 

prob_1.num_low_E_bins = 1 # number of MG groups in the thermal region
prob_1.num_mid_E_bins = 1 # number of MG groups, or FEDS coarse-groups, in the resolved-resonance-region 
prob_1.num_high_E_bins = 1 # number of MG groups in the fast region
prob_1.num_elements_RRR = 30 # number of FEDS elements that the entire resolved-resonance-region is partitioned into 
prob_1.apportion_algorithm = 'var' # use 'var' for FEDS... use 'L1' or 'max' for MG... if you want an equal number of elements per coarse group use 'equal'

prob_1.element_type = 'FEDS' # specify whether you want 'MG' or 'FEDS'
prob_1.scat_leg_order = 7 # number of Legendre moments to use for scattering (e.g. 7 includes P0 thru P7)
prob_1.time_dependent = False # set to True for time dependent problems... this will set the energyPenalty = -0.5 in the source code
prob_1.min_binwidth = 1e-16  # minimum subelement energy width... if you plan on running the ERRORR module use 1e-7, otherwise use 1e-16
prob_1.rxnOpt = 'invel' # use 'invel' for time-dependent problems (other options are available, but Barnfire may crash)... 'invel' includes MT #'s 1099, 1 (sigt), 18, 259 (spgrp^-1), 452, 455 (beta_fnubar), 456, 1018 (chi), 1452, 2018, 2452, 1054 (decay const), 2055 (chid), 2518 (sigf), 2519 (scattering, p0 thru p7)
prob_1.plot_fluxes = False 

prob_1.create_barnfire_bash_script = True # creates the bash script that directly runs Barnfire
prob_1.run_barnfire_bash_script = True # runs the bash script that directly runs Barnfire... set to False if you plan to make changes to the bash script
prob_1.new_PENDF = False # creates Pointwise-ENDF (PENDF) file
prob_1.new_GENDF = True # creates Group-ENDF (GENDF) file
prob_1.start_at_step = 0 # Barnfire has 9 steps, set this number to 0 if you don't want to skip any steps in Barnfire

prob_1.create_MCNP_cross_sections = False
prob_1.propagate_uncertainties = False

'''
###############################################################################
prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.new_PENDF = True
prob_1.plot_fluxes = False
prob_1.apportion_algorithm = 'equal'
for mg in [100,200,400,600,800]:
    prob_1.num_mid_E_bins = mg-2
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('hmf019_%img' %mg) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)
    prob_1.new_PENDF = False
###############################################################################
prob_1.element_type = 'FEDS'
prob_1.time_dependent = True
prob_1.new_PENDF = False
prob_1.plot_fluxes = False
prob_1.apportion_algorithm = 'equal'
for mg in [100,200,400,600,800]:
    #prob_1.num_mid_E_bins = mg-2
    prob_1.num_mid_E_bins = int((mg-2)/5)
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('hmf019_%ioldfeds_5EperCG' %mg) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)
    prob_1.new_PENDF = False
###############################################################################
prob_1.element_type = 'FEDS'
prob_1.time_dependent = True
prob_1.new_PENDF = False
prob_1.plot_fluxes = False
prob_1.apportion_algorithm = 'equal'
#for mg in [100,200,400,600,800]:
for mg in [600,800]:
    #prob_1.num_mid_E_bins = mg-2
    prob_1.num_mid_E_bins = 1
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('hmf019_%inewfeds' %mg) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)
    prob_1.new_PENDF = False
###############################################################################
'''

prob_1.only_create_MCNP_cross_sections = True
prob_1.element_type = 'FEDS'
prob_1.time_dependent = True
prob_1.new_PENDF = True
prob_1.plot_fluxes = False
prob_1.apportion_algorithm = 'equal'
for mg in [10]:
    prob_1.num_mid_E_bins = mg-2
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('hmf019_%iCE' %mg) # directory name that will contain Barnfire output and cross sections files
    prob_1.start_at_step = 0
    run_barnfire_driver(prob_1, geom)
    prob_1.new_PENDF = True



