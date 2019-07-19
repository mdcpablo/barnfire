import sys
sys.path.append('../src')

from driver import *


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

Al = Element()
Al.name = 'al' # lower case 
Al.Name = 'Al' # upper case
Al.AtomFractionsDict = {27: 1.} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

Natural_Al = Material()
Natural_Al.Name = 'Natural_Al' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
Natural_Al.temperature = 293.6 # Kelvin
Natural_Al.elements = [Al] # list of elements that your material is composed of
Natural_Al.elemAtomFracDict = {'Al': 1.} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
Natural_Al.massDensity = 2.7 # grams/cm^3
Natural_Al.fuelRadius = 0. # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
Natural_Al.shape = 'slab' #if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

Ag = Element()
Ag.name = 'ag' # lower case 
Ag.Name = 'Ag' # upper case
Ag.AtomFractionsDict = {107: 0.51839, 109:0.48161} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

Natural_Ag = Material()
Natural_Ag.Name = 'Natural_Ag' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
Natural_Ag.temperature = 293.6 # Kelvin
Natural_Ag.elements = [Ag] # list of elements that your material is composed of
Natural_Ag.elemAtomFracDict = {'Ag': 1.} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
Natural_Ag.massDensity = 10.5 # grams/cm^3
Natural_Ag.fuelRadius = 0. # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
Natural_Ag.shape = 'slab' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

Au = Element()
Au.name = 'au' # lower case 
Au.Name = 'Au' # upper case
Au.AtomFractionsDict = {197: 1.} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

Natural_Au = Material()
Natural_Au.Name = 'Natural_Au' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
Natural_Au.temperature = 293.6 # Kelvin
Natural_Au.elements = [Au] # list of elements that your material is composed of
Natural_Au.elemAtomFracDict = {'Au': 1.} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
Natural_Au.massDensity = 19.32 # grams/cm^3
Natural_Au.fuelRadius = 0. # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
Natural_Au.shape = 'slab' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs


# add comment about why uranium isn't important
geom = Material_Geometry()
geom.Name = 'AlAgAu' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
geom.unimportantMats = [Pure_U235] # list of materials that have a negligible effect on your weighting spectrum in important regions of the geometry
geom.importantMats = [Natural_Al, Natural_Ag, Natural_Au] # list of materials that affect your weighting spectrum in important regions of the geometry
geom.importanceDict = {'Natural_Al': 1., 'Natural_Ag':1., 'Natural_Au':1.} # relative importance of each material for your clustering algorithm

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
prob_1.new_PENDF = True # creates Pointwise-ENDF (PENDF) file
prob_1.new_GENDF = True # creates Group-ENDF (GENDF) file
prob_1.start_at_step = 0 # Barnfire has 9 steps, set this number to 0 if you don't want to skip any steps in Barnfire

prob_1.create_MCNP_cross_sections = False
prob_1.propagate_uncertainties = False
###############################################################################
prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.plot_fluxes = False
for mg in [100]:
    prob_1.num_mid_E_bins = mg-2
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('AlAgAu_%img' %mg) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)

prob_1.new_PENDF = False

prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.plot_fluxes = True
for feds in [100]:
    prob_1.num_mid_E_bins = 15
    prob_1.num_elements_RRR = feds-2
    prob_1.dir = ('AlAgAu_%ifeds' %feds) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)

prob_1.element_type = 'FEDS'
prob_1.time_dependent = True
prob_1.plot_fluxes = True
prob_1.start_at_step = 6
for feds in [100]:
    prob_1.num_mid_E_bins = 1
    prob_1.num_elements_RRR = feds-2
    prob_1.dir = ('AlAgAu_%ifeds_new' %feds) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)
################################################################################
prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.plot_fluxes = False
prob_1.start_at_step = 0
for mg in [200,300,400,500,600,700]:
    prob_1.num_mid_E_bins = mg-2
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('AlAgAu_%img' %mg) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)

prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.plot_fluxes = True
for feds in [200,300,400,500,600,700]:
    prob_1.num_mid_E_bins = 15
    prob_1.num_elements_RRR = feds-2
    prob_1.dir = ('AlAgAu_%ifeds' %feds) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)

prob_1.element_type = 'FEDS'
prob_1.time_dependent = True
prob_1.plot_fluxes = True
for feds in [200,300,400,500,600,700]:
    prob_1.num_mid_E_bins = 1
    prob_1.num_elements_RRR = feds-2
    prob_1.dir = ('AlAgAu_%ifeds_new' %feds) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)





