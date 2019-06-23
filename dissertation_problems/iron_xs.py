import sys
#sys.path.append('/home/mdcpablo/barnfire/examples')

from barnfire_driver import *

U = Element()
U.name = 'u' # lower case 
U.Name = 'U' # upper case
U.AtomFractionsDict = {235: 1.} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

Pure_U235 = Material() 
Pure_U235.Name = 'Pure_U235' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
Pure_U235.temperature = 293.6 # Kelvin
Pure_U235.elements = [U] # list of elements that your material is composed of
Pure_U235.elemAtomFracDict = {'U': 1.} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
Pure_U235.massDensity = 18.39374 # grams/cm^3
Pure_U235.fuelRadius = 0. # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
Pure_U235.shape = 'slab' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

Fe = Element()
Fe.name = 'fe' # lower case 
Fe.Name = 'Fe' # upper case
Fe.AtomFractionsDict = {54:8.68307E-06, 56:1.36306E-04, 57:3.14789E-06, 58:4.18926E-07} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

Natural_Iron = Material()
Natural_Iron.Name = 'Natural_Iron' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
Natural_Iron.temperature = 293.6 # Kelvin
Natural_Iron.elements = [Fe] # list of elements that your material is composed of
Natural_Iron.elemAtomFracDict = {'Fe': 1.} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
Natural_Iron.massDensity = 7.874 # grams/cm^3
Natural_Iron.fuelRadius = 0. # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
Natural_Iron.shape = 'slab' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

# add comment about why uranium isn't important
geom = Material_Geometry()
geom.Name = 'Natural_Iron' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
geom.unimportantMats = [] # list of materials that have a negligible effect on your weighting spectrum in important regions of the geometry
geom.importantMats = [Natural_Iron] # list of materials that affect your weighting spectrum in important regions of the geometry
geom.importanceDict = {Natural_Iron.Name: 1} # relative importance of each material for your clustering algorithm

modify_materials_materials_source_code(geom)
modify_indicators_clustering_source_code(geom)
modify_indicators_source_code(geom)
#--------------------------------------------------------------------------------------------------
prob_1 = problem()

prob_1.create_multigroup_structure = True # set to True... unless you want to manually create a multigroup or coarse-group structure in $SCRATCH_BARN/dat/energy_groups and set "G=your_mg_structure_file" in the bash script (which is produced after running "LLNL_barnfire_driver.py")
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
###############################################################################
prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.plot_fluxes = False
for mg in [500]:
    prob_1.num_mid_E_bins = mg-2
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('iron_%img' %mg) # directory name that will contain Barnfire output and cross sections files
    #run_barnfire_driver(prob_1, geom)

prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.plot_fluxes = True
for feds in [500]:
    prob_1.num_mid_E_bins = 15
    prob_1.num_elements_RRR = feds-2
    prob_1.dir = ('iron_%ifeds' %feds) # directory name that will contain Barnfire output and cross sections files
    #run_barnfire_driver(prob_1, geom)

prob_1.element_type = 'FEDS'
prob_1.time_dependent = True
prob_1.plot_fluxes = True
prob_1.start_at_step = 6
for feds in [500]:
    prob_1.num_mid_E_bins = 1
    prob_1.num_elements_RRR = feds-2
    prob_1.dir = ('iron_%ifeds_new' %feds) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)
################################################################################
prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.plot_fluxes = False
prob_1.start_at_step = 0
for mg in [100,200,300,400,600,700]:
    prob_1.num_mid_E_bins = mg-2
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('iron_%img' %mg) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)

prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.plot_fluxes = True
for feds in [100,200,300,400,600,700]:
    prob_1.num_mid_E_bins = 15
    prob_1.num_elements_RRR = feds-2
    prob_1.dir = ('iron_%ifeds' %feds) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)

prob_1.element_type = 'FEDS'
prob_1.time_dependent = True
prob_1.plot_fluxes = True
for feds in [100,200,300,400,600,700]:
    prob_1.num_mid_E_bins = 1
    prob_1.num_elements_RRR = feds-2
    prob_1.dir = ('iron_%ifeds_new' %feds) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)





