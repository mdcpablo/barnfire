import sys
#sys.path.append('/home/mdcpablo/barnfire/examples')

from barnfire_driver import *

"""
Using Barnfire to generate FEDS cross sections (in newGridXML format) for the following:

temp = 20.45 $ 293.6 Kelvin
mat 1 # 18.39374
  92234  0.0102497847598 
  92235  0.93956183364500001 
  92238  0.050188381595599997
mat 2 # 7.16
  6012  0.122205139782 
  6013  0.00132173758786 
  14028  0.032480720731400001 
  14029  0.00164929205374 
  14030  0.0010872254928899999 
  26054  0.049171406440399995 
  26056  0.77188592412799995 
  26057  0.0178262121894 
  26058  0.0023723415938700001
mat 3 # .001293
  7014  0.78
  8016  0.22
"""
###############################################################################
# HEU
U = Element()
U.name = 'u' # lower case 
U.Name = 'U' # upper case
U.AtomFractionsDict = {234:0.0102497847598, 235:0.93956183364500001, 238:0.050188381595599997} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

HEU85 = Material() 
HEU85.Name = 'HEU85' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
HEU85.temperature = 293.6 # Kelvin
HEU85.elements = [U] # list of elements that your material is composed of
HEU85.elemAtomFracDict = {'U': 1.} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
HEU85.massDensity = 18.39374 # grams/cm^3
HEU85.fuelRadius = 7.108868 # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
HEU85.shape = 'sphere' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

###############################################################################
# Steel
C = Element()
C.name = 'c' # lower case 
C.Name = 'C' # upper case
C.AtomFractionsDict = {0: 1.} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

Si = Element()
Si.name = 'si' # lower case 
Si.Name = 'Si' # upper case
Si.AtomFractionsDict = {28: 0.032480720731400001 , 29: 0.00164929205374, 30: 0.0010872254928899999} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

Fe = Element()
Fe.name = 'fe' # lower case 
Fe.Name = 'Fe' # upper case
Fe.AtomFractionsDict = {54:0.049171406440399995, 56:0.77188592412799995, 57:0.0178262121894, 58:0.0023723415938700001} # atom fractions (or number densities) of each isotope (e.g. {1: 0.5, 2: 0.5} means equal number of H-1 and H-2 atoms)

SteelyKnife = Material() 
SteelyKnife.Name = 'SteelyKnife' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
SteelyKnife.temperature = 293.6 # Kelvin
SteelyKnife.elements = [C,Si,Fe] # list of elements that your material is composed of
SteelyKnife.elemAtomFracDict = {'C': (0.122205139782+0.00132173758786), 'Si':(0.032480720731400001+0.00164929205374+0.0010872254928899999), 'Fe':(0.049171406440399995+0.77188592412799995+0.0178262121894+0.0023723415938700001)} # atom fractions (or number) of each isotope (e.g. {'H': 2, 'O': 1} is water)
SteelyKnife.massDensity = 7.16 # grams/cm^3
SteelyKnife.fuelRadius = 17.26887 # if mat.fuelRadius is set to 0., Barnfire will generate infinite medium xs
SteelyKnife.shape = 'sphere' # if mat.shape is not 'sphere', 'cylinder', or 'cube', Barnfire will generate infinite medium xs

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
geom = Material_Geometry()
geom.Name = 'HEU_MET_FAST_085_3' # CHANGE THE MATERIAL NAME HERE if you decide to make changes to a material's definition or specifications
geom.unimportantMats = [UnpolutedAir] # list of materials that have a negligible effect on your weighting spectrum in important regions of the geometry
geom.importantMats = [HEU85, SteelyKnife] # list of materials that affect your weighting spectrum in important regions of the geometry
geom.importanceDict = {HEU85.Name: 10, SteelyKnife.Name:1} # relative importance of each material for your clustering algorithm

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

###############################################################################
prob_1.element_type = 'FEDS'
prob_1.time_dependent = False
prob_1.new_PENDF = True
prob_1.plot_fluxes = False
prob_1.apportion_algorithm = 'equal'
for mg in [100,200,400,600,800]:
    prob_1.num_mid_E_bins = mg-2
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('hmf085_3_%img' %mg) # directory name that will contain Barnfire output and cross sections files
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
    prob_1.dir = ('hmf085_3_%ioldfeds_5EperCG' %mg) # directory name that will contain Barnfire output and cross sections files
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
    prob_1.num_mid_E_bins = 1
    prob_1.num_elements_RRR = mg-2
    prob_1.dir = ('hmf085_3_%inewfeds' %mg) # directory name that will contain Barnfire output and cross sections files
    run_barnfire_driver(prob_1, geom)
    prob_1.new_PENDF = False
###############################################################################





