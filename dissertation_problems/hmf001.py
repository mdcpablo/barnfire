import sys
sys.path.append('../src')

from driver import *


# MCNP
"""
c Godiva is a critical bare sphere of uranium
100    1000  -18.74  -10  imp:n=1   $ enriched uranium sphere (godiva)
999    0              10  imp:n=0   $ all space outside the sphere

10     so 8.7407               $ radius of the godiva sphere

c skip 10 and run a total of 110 keff cycles with 1000 neutrons per cycle
kcode 100000 1.0 500 5000     $ kcode defines a criticality calculation
ksrc  0 0 0                    $ initial keff spatial dist is point at origin
m1000  92235.90c 4.4994E-02  92238.90c 2.4984E-03  92234.90c 4.9184E-04  $ define u with number densities
print                          $ more useful information in the output file
"""

U = Element()
U.name = 'u' # lower case 
U.Name = 'U' # upper case
U.AtomFractionsDict = {235:4.4994E-02, 238:2.4984E-03, 234:4.9184E-04} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)
 # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

HMF001 = Material() 
HMF001.Name = 'HMF001' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
HMF001.temperature = 293.6 # Kelvin
HMF001.elements = [U] # list of elements that your material is composed of
HMF001.elemAtomFracDict = {'U': 1.} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
HMF001.massDensity = 18.74 # grams/cm^3
HMF001.fuelRadius = 8.7407 # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
HMF001.shape = 'sphere' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

# add comment about why uranium isn't important
geom = Material_Geometry()
geom.Name = 'HMF001' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
geom.unimportantMats = [] # list of materials that have a negligible effect on your weighting spectrum in important regions of the geometry
geom.importantMats = [HMF001] # list of materials that affect your weighting spectrum in important regions of the geometry
geom.importanceDict = {HMF001.Name: 1} # relative importance of each material for your clustering algorithm

modify_materials_materials_source_code(geom)
modify_indicators_clustering_source_code(geom)
modify_indicators_source_code(geom)
#--------------------------------------------------------------------------------------------------
prob_1 = problem()

prob_1.create_multigroup_structure = True # set to True... unless you want to manually create a multigroup or coarse-group structure in $SCRATCH_BARN/dat/energy_groups and set "G=your_mg_structure_file" in the bash script (which is produced after running "driver.py")
prob_1.range_bounds = [1e-5, 1e-3, 1.4e7, 1.42e7] # energy boundaries for the thermal, intermediate, and fast energy ranges, respectively... FEDS is only used in the intermediate region, MG is used for thermal and fast regions
prob_1.log_spacing = True # energy spacing for MG, and coarse-groups in the intermediate energy range (True=logarithmic, False=linear) 

prob_1.num_low_E_bins = 1 # number of MG groups in the thermal region
#prob_1.num_mid_E_bins = 0 # number of MG groups, or FEDS coarse-groups, in the resolved-resonance-region 
prob_1.num_high_E_bins = 1 # number of MG groups in the fast region
#prob_1.num_elements_RRR = 0 # number of FEDS elements that the entire resolved-resonance-region is partitioned into 
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
    prob_1.dir = ('hmf001_%img' %mg) # directory name that will contain Barnfire output and cross sections files
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
    prob_1.dir = ('hmf001_%ioldfeds_5EperCG' %mg) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)
    prob_1.new_PENDF = False
###############################################################################
prob_1.element_type = 'FEDS'
prob_1.time_dependent = True
prob_1.new_PENDF = False
prob_1.plot_fluxes = False
prob_1.apportion_algorithm = 'equal'
for mg in [200,400,600,800]:
    #prob_1.num_mid_E_bins = mg-2
    prob_1.num_mid_E_bins = 1
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('hmf001_%inewfeds' %mg) # directory name that will contain Barnfire output and cross sections files
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
    prob_1.dir = ('hmf001_%iCE' %mg) # directory name that will contain Barnfire output and cross sections files
    prob_1.start_at_step = 0
    run_barnfire_driver(prob_1, geom)
    prob_1.new_PENDF = True

