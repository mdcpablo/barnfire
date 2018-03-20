import os
import sys
sys.path.append('/home/mdcpablo/barnfire/src/')
import directories
import numpy as np
from datetime import datetime
import copy
import time

dirDict = directories.get_root_directories()
headDirr = dirDict['head']
srcDict = directories.get_source_directories(headDirr)
groupstructDirr = srcDict['common_group_structures']

dirDict = directories.get_root_directories()
scratchDirr = dirDict['scratch']
scratchDict = directories.get_scratch_directories(scratchDirr)
clustDirr = scratchDict['dat/energy_groups']

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def simulate(prob, geom):
    ### creates a multi-group structure
    if prob.create_multigroup_structure == True:
        prob = create_group_struct(prob)
    #else:
    #    prob.group_file = 'pablo-mg-1059.txt'
    #    prob = read_group_struct(prob.group_file)

    ### creates and runs "make_xs_*.sh" file
    if prob.create_PDT_cross_section == True:
        create_PDT_xs(prob, geom)
        if prob.run_PDT_cross_section == True:
            os.system('bash '+prob.make_PDT_xs_file)

            clust_file = 'clust-'+str(prob.num_bands_RRR)+'-9.txt'
            os.system('cp '+os.path.join(clustDirr,clust_file)+' '+clust_file)
            os.system('cp '+os.path.join(clustDirr,clust_file)+' clust_%it_%ir_%ib_%iu.txt' %(prob.num_low_E_bins, prob.num_mid_E_bins, prob.num_bands_RRR, prob.num_high_E_bins) )

    #clust_file = 'clust-'+str(prob.num_bands_RRR)+'-9.txt'
    #cov_driver(clust_file)

    #isotope_name = 'pu-240'
    #mat = [9440]
    #cov_mat_list = subelement_to_element(mat, isotope_name, None, clust_file)

    ### compares flux of MCNP and PDT solutions
    #if prob.propagate_uncertainties == True:
    #    propagate_error(prob)

    #if prob.create_MCNP_cross_sections == True:
    #    os.system('bash '+scratchDirr+'/xs/RunAce.sh')
    #    os.system('bash /scratch/mdcpablo/barnfire/xs/ace/xdata/copyAce.sh')
    #    os.system('tail /scratch/mdcpablo/barnfire/xs/ace/xdata/xsdir')
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def ReadFile(filename):
    # Reads a file as a 1D and 2D list 
    # The 1D list contains lines the file, the 2D list delimits each line by space
    f = open(filename)
    list_1D = []
    list_2D = []
    for line in f:
        list_1D.append(line)
        list_2D.append(line.split())
    f.close()
    return list_1D, list_2D
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def create_group_struct(prob):
    # ----- variables used in this function -------
    num_low_E_bins = prob.num_low_E_bins
    num_mid_E_bins = prob.num_mid_E_bins
    num_high_E_bins = prob.num_high_E_bins
    log_spacing = prob.log_spacing
    range_bounds = prob.range_bounds 
    # ---------------------------------------------

    if log_spacing == True:
        low_E_bins = np.logspace(np.log10(range_bounds[1]), np.log10(range_bounds[0]), num=num_low_E_bins+1)
        mid_E_bins = np.logspace(np.log10(range_bounds[2]), np.log10(range_bounds[1]), num=num_mid_E_bins+1)
        high_E_bins = np.logspace(np.log10(range_bounds[3]), np.log10(range_bounds[2]), num=num_high_E_bins+1)
        group_file = 'log-'+str(num_low_E_bins)+'-'+str(num_mid_E_bins)+'-'+str(num_high_E_bins)+'.txt'
        group_file = os.path.join(groupstructDirr, group_file)
    else:
        low_E_bins = np.logspace(range_bounds[1], range_bounds[0], num=num_low_E_bins+1)
        mid_E_bins = np.logspace(range_bounds[2], range_bounds[1], num=num_mid_E_bins+1)
        high_E_bins = np.logspace(range_bounds[3], range_bounds[2], num=num_high_E_bins+1)
        group_file = 'lin-'+str(num_low_E_bins)+'-'+str(num_mid_E_bins)+'-'+str(num_high_E_bins)+'.txt'
        group_file = os.path.join(groupstructDirr, group_file)

    f = open(group_file, 'w')
    f.write('User-generated using "barnfire_functions.py"\n')
    f.write('group upper bound region\n')
    for i in range(num_high_E_bins+1):
        f.write('%i %10.10e fast\n' %(i+1, high_E_bins[i]))
    for j in range(1,num_mid_E_bins):
        f.write('%i %10.10e resonance\n' %(i+j+1, mid_E_bins[j]))
    for k in range(num_low_E_bins+1):
        f.write('%i %10.10e thermal\n' %(i+j+k+2, low_E_bins[k]))
    f.close()

    # ---- variables updated in this function -----
    prob.low_E_bins = low_E_bins
    prob.mid_E_bins = mid_E_bins
    prob.high_E_bins = high_E_bins
    prob.group_file = group_file
    # ---------------------------------------------
    return prob
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def read_group_struct(existing_group_file):
    existing_group_file = os.path.join(groupstructDirr, existing_group_file)
    (existing_1D, existing_2D) = ReadFile(existing_group_file)

    low_E_bins = []
    mid_E_bins = []
    high_E_bins = []
    for i in range(2,len(existing_2D)-1):
        if existing_2D[i][2] == 'thermal':     low_E_bins.append(np.float(existing_2D[i][1]))
        elif existing_2D[i][2] == 'resonance': mid_E_bins.append(np.float(existing_2D[i][1]))
        elif existing_2D[i][2] == 'fast':      high_E_bins.append(np.float(existing_2D[i][1]))

    # ---- variables updated in this function -----
    prob.low_E_bins = np.array(low_E_bins)
    prob.mid_E_bins = np.array(mid_E_bins)
    prob.high_E_bins = np.array(high_E_bins)

    prob.num_low_E_bins = len(low_E_bins)
    prob.num_mid_E_bins = len(mid_E_bins)
    prob.num_high_E_bins = len(high_E_bins)
    # ---------------------------------------------
    return prob
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def create_PDT_xs(prob, geom):
    # ----- variables used in this function -------
    min_binwidth = prob.min_binwidth 
    log_spacing = prob.log_spacing
    num_low_E_bins = prob.num_low_E_bins
    num_mid_E_bins = prob.num_mid_E_bins
    num_high_E_bins = prob.num_high_E_bins
    mid_E_bins = prob.mid_E_bins
    num_bands_RRR = prob.num_bands_RRR
    group_file = prob.group_file
    scat_leg_order = prob.scat_leg_order 
    # ---------------------------------------------

    num_bins = num_low_E_bins + num_mid_E_bins + num_high_E_bins
    num_FEDS_groups = num_low_E_bins + num_bands_RRR + num_high_E_bins

    make_PDT_xs_file = 'make_xs_'+str(num_bins)+'_'+str(num_bands_RRR)+'.sh'

    f3 = open(make_PDT_xs_file, 'w')

    f3.write("#! /usr/bin/env bash \n")
    f3.write("# P. Vaquer, Oct. 2016 \n")
    f3.write(" \n")
    f3.write("############################ \n")
    f3.write("# INITIALIZE VARIABLES \n")
    f3.write("############################ \n")
    f3.write(" \n")
    f3.write("## !!!!! \n")
    f3.write("# You need to set and export the following: \n")
    f3.write("# export SCRATCH_BARN=... \n")
    f3.write("# export ENDF=... \n")
    f3.write("# export NJOY=... \n")
    f3.write("## !!!!! \n")
    f3.write(" \n")
    f3.write("# This is a resolution parameter used in indicators.py only. I usually just set it at 9.\n")
    f3.write("res=9 \n")
    f3.write(" \n")
    f3.write("# This is the minimum bin width for a single sublement (use 1e-4 to avoid seg faulting in ERRORR)\n")

    f3.write("bin=%2.2e \n" %min_binwidth)

    f3.write(" \n")
    f3.write("# In addition to coarse groups, I use energy penalties. \n")
    f3.write("# See my dissertation, Appendix B, section 1 for more details \n")
    f3.write("penalty=0. \n")
    f3.write(" \n")

    f3.write("# Which problem to run, materials-wise. \n")
    f3.write("# This is only used in indicators.py and indicators_clustering.py, \n")
    f3.write("# where there is a mapping from this string to a set of materials defined in \n")
    f3.write("# materials_materials.py. \n")
    
    if len(geom.ModList) > 0:
        f3.write("modExist=1 \n")
    else:
        f3.write("modExist=0 \n")
    
    f3.write("m="+geom.Name+" \n")
    f3.write(" \n")
    f3.write("# The specific list of materials to generate NJOY inputs for / read NJOY outputs from  \n")
    f3.write("# This is only used in calls to materials.py \n")
    f3.write("mMODlist=(")
    for mod in geom.ModList:
        f3.write(str(mod.Name)+" ")
    f3.write(")  \n")
    f3.write(" \n")
    f3.write("# We need PENDF files for all the materials to do the clustering, \n")
    f3.write("# but we can only do half of the materials at a time due to incompatible \n")
    f3.write("# thermal treatments  \n")
    f3.write("mFUELlist=(")
    for fuel in geom.FuelList:
        f3.write(str(fuel.Name)+" ")
    f3.write(")  \n")

    f3.write(" \n")
    f3.write("# How many elements to use in the resolved resonance region (RRR). \n")
    f3.write("g=%i \n" %num_bands_RRR)
    f3.write(" \n")
    f3.write("# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR \n")
    f3.write("c=(")

    mid_E_bins = mid_E_bins[::-1]
    for i in range(len(mid_E_bins)):
        f3.write('%10.10e ' %mid_E_bins[i])

    f3.write(") \n")
    f3.write(" \n")
    f3.write("# The group structure to use outside the RRR in the thermal and fast energy ranges. \n")
    f3.write("# G=shem-361 would point to ../dat/energy_groups/shem-361.txt \n")

    if log_spacing == True:
        f3.write("G="+"log-"+str(num_low_E_bins)+"-"+str(num_mid_E_bins)+"-"+str(num_high_E_bins)+" \n")
    else:
        f3.write("G="+"lin-"+str(num_low_E_bins)+"-"+str(num_mid_E_bins)+"-"+str(num_high_E_bins)+" \n")  

    f3.write(" \n")
    f3.write("# How many Legendre moments to use for the scattering transfer matrices \n")

    f3.write("L="+str(scat_leg_order)+" \n")

    f3.write(" \n")
    f3.write("# Which clustering algorithm to use. Recommended: use 'tmg' for MG XS and 'har' for FEDS XS \n")
    f3.write("# Use './indicators_clustering.py -h' for more information. \n")
    f3.write("clusterer=har \n")
    f3.write(" \n")
    f3.write("# Which apportioning algorithm to use. Recommended: use 'var' for FEDS and 'L1' or 'max' for MG XS \n")
    f3.write("# Use './indicators_clustering.py -h' for more information. \n")

    f3.write("appt="+prob.apportion_algorithm+" \n")

    f3.write(" \n")
    f3.write("# Which reactions to include in the PDT XS file. Recommended: use 'abs' if absorption edits are needed \n")
    f3.write("# Use './materials.py -h' for more information \n")
    f3.write("rxnOpt=invel \n")
    f3.write(" \n")
    f3.write("# Use './materials.py -h' for more information \n")
    f3.write("weightOpt=(2) \n")
    f3.write("# weightOpt=(4 .1265 .0253 .1265 1.4e6) \n")
    f3.write(" \n")
    #f3.write("# Use './materials.py -h' for more information \n")
    #f3.write("MCNPflux=wgt_MCNP_1543.txt \n")
    #f3.write(" \n")
    f3.write("############################ \n")
    f3.write("# GENERATE CROSS SECTIONS \n")
    f3.write("############################ \n")
    f3.write(" \n")
    f3.write("#NB: In many cases, if a previous step has run successfully, you don't need \n")
    f3.write("# to rerun it to run a later step if you make changes that affect that later \n")
    f3.write("# step only. \n")
    f3.write(" \n")
    f3.write("echo '------- Step 0: Initializing the scratch directory -------' \n")
    f3.write("scriptdir=`pwd` \n")
    f3.write("srcdir="+srcDict['src']+" \n")
    f3.write("cd $srcdir\n")
    f3.write("./Initialize.py $scriptdir $0 \n")
    f3.write(" \n")
    f3.write("echo '------- Step 1: Generating the NJOY inputs -------' \n")
    f3.write("mList=${mFUELlist[*]} \n")
    f3.write("./materials.py -m ${mList[*]} -W ${weightOpt[*]} -v \n")
    f3.write(" \n")
    f3.write("echo '------- Step 2: Running NJOY to generate the PENDF file -------' \n")
    if prob.new_PENDF == False or prob.start_at_step > 2: f3.write("#")
    f3.write("cd $SCRATCH_BARN/xs \n")
    if prob.new_PENDF == False or prob.start_at_step > 2: f3.write("#")
    f3.write("./RunPendf.sh \n")
    if prob.new_PENDF == False or prob.start_at_step > 2: f3.write("#")
    f3.write("cd $srcdir \n")
    f3.write(" \n")

    f3.write('if [ "${modExist}" = 1 ] \n')
    f3.write("then \n")
    f3.write("    echo '------- Step 1: Generating the NJOY inputs -------'  \n")
    f3.write("    mList=${mMODlist[*]} \n")
    f3.write("    ./materials.py -m ${mList[*]} -W ${weightOpt[*]} -v  \n")
    f3.write("      \n")
    f3.write("    echo '------- Step 2: Running NJOY to generate the PENDF files -------'  \n")
    if prob.new_PENDF == False or prob.start_at_step > 2: f3.write("#")
    f3.write("    cd $SCRATCH_BARN/xs \n")
    if prob.new_PENDF == False or prob.start_at_step > 2: f3.write("#")
    f3.write("    ./RunPendf.sh  \n")
    if prob.new_PENDF == False or prob.start_at_step > 2: f3.write("#")
    f3.write("    cd $srcdir  \n")
    f3.write("fi \n")

    f3.write(" \n")
    f3.write("echo '------- Step 3: Generating the indicators and their energy grid -------' \n")
    if prob.new_GENDF == False or prob.start_at_step > 3: f3.write("#")
    f3.write("./indicators.py -R ${c[0]} ${c[*]: -1} -m $m -w flux -r $res -G $G -v -Z -s $bin \n")
    f3.write(" \n")
    f3.write("echo '------- Step 4: Generating more indicators on the same energy grid but using escape XS -------' \n")
    if prob.new_GENDF == False or prob.start_at_step > 4: f3.write("#")
    f3.write("./indicators.py -R ${c[0]} ${c[*]: -1} -m $m -w sigt -r $res -G $G -v -Z -s $bin\n")
    f3.write(" \n")
    f3.write("echo '------- Step 5: Clustering the indicators to get the clust file, which specifies the energy mesh -------' \n")
    if prob.new_GENDF == False or prob.start_at_step > 5: f3.write("#")
    f3.write("./indicators_clustering.py -c ${c[*]} -e $g -m $m -w $clusterer -E $penalty -r $res -a $appt -v 3 -d 500 -S -p all  \n")
    f3.write(" \n")
    f3.write("echo '------- Step 6: Generating the weighting spectrum on the subelements -------' \n")
    if prob.new_GENDF == False or prob.start_at_step > 6: f3.write("#")
    f3.write("./indicators.py -R ${c[0]} ${c[*]: -1} -m $m -w wgt -r $res -G $G -v -Z -s $bin -M clust-$g-$res \n")
    f3.write(" \n")

    f3.write("# Do for FUEL: \n")
    f3.write("mList=${mFUELlist[*]} \n")
    f3.write("echo '------- Step 7: Regenerating NJOY inputs with a group structure of the subelements -------'  \n")
    if prob.new_GENDF == False or prob.start_at_step > 7: f3.write("#")
    f3.write("./materials.py -m ${mList[*]} -G clust-$g-$res -L $L -W ${weightOpt[*]} -v  \n")
    f3.write("echo '------- Step 8: Running NJOY to generate GENDF files (on the subelements) -------'  \n")
    if prob.new_GENDF == False or prob.start_at_step > 8: f3.write("#")
    f3.write("cd $SCRATCH_BARN/xs \n")
    if prob.new_GENDF == False or prob.start_at_step > 8: f3.write("#")
    f3.write("./RunGendf.sh \n")
    #if prob.new_ACE == False: f3.write("#")
    #f3.write("./RunAce.sh \n")
    f3.write("echo '------- Step 9: Summing/averaging over the subelements to get PDT-formatted FEDS XS on the elements -------'  \n")
    f3.write("cd $srcdir \n")
    #f3.write("./materials.py -b -m ${mList[*]} -p $rxnOpt -M clust-$g-$res -W ${weightOpt[*]} -v -x $MCNPflux  \n")
    f3.write("./materials.py -b -m ${mList[*]} -p $rxnOpt -M clust-$g-$res -W ${weightOpt[*]} -v \n")
    f3.write(" \n")
    f3.write('if [ "${modExist}" = 1 ] \n')
    f3.write("then \n")
    f3.write("    # Do for MOD: \n")
    f3.write("    mList=${mMODlist[*]} \n")
    f3.write("    echo '------- Step 7: Regenerating NJOY inputs with a group structure of the subelements -------'  \n")
    if prob.new_GENDF == False or prob.start_at_step > 7: f3.write("#")
    f3.write("    ./materials.py -m ${mList[*]} -G clust-$g-$res -L $L -W ${weightOpt[*]} -v  \n")
    f3.write("    echo '------- Step 8: Running NJOY to generate GENDF files (on the subelements) -------'  \n")
    if prob.new_GENDF == False or prob.start_at_step > 8: f3.write("#")
    f3.write("    cd $SCRATCH_BARN/xs \n")
    if prob.new_GENDF == False or prob.start_at_step > 8: f3.write("#")
    f3.write("    ./RunGendf.sh \n")
    #if prob.new_ACE == False: f3.write("#")
    #f3.write("    ./RunAce.sh \n")
    f3.write("    echo '------- Step 9: Summing/averaging over the subelements to get PDT-formatted FEDS XS on the elements -------'  \n")
    f3.write("    cd $srcdir \n")
    #f3.write("    ./materials.py -b -m ${mList[*]} -p $rxnOpt -M clust-$g-$res -W ${weightOpt[*]} -v 2 -x $MCNPflux  \n")
    f3.write("    ./materials.py -b -m ${mList[*]} -p $rxnOpt -M clust-$g-$res -W ${weightOpt[*]} -v 2 \n")
    f3.write("fi \n")

    f3.write(" \n")
    f3.write("echo ' The result should be a list of .data files in $scratch/xs/pdtxs ' \n")
    f3.write(" \n")
    f3.write("####################### \n")
    f3.write("sleep 0.1 \n")

    f3.write(" \n")
    for mod in geom.ModList:
        f3.write("%s_xs='xs_%s_%i.data' \n" %(mod.Name, mod.Name, num_FEDS_groups))
    for fuel in geom.FuelList:
        f3.write("%s_xs='xs_%s_%i.data' \n" %(fuel.Name, fuel.Name, num_FEDS_groups))
    f3.write(" \n")
    for mod in geom.ModList:
        f3.write("%s_cx='%s_%i.cx' \n" %(mod.Name, mod.Name, num_FEDS_groups))
    for fuel in geom.FuelList:
        f3.write("%s_cx='%s_%i.cx' \n" %(fuel.Name, fuel.Name, num_FEDS_groups))
    f3.write(" \n")
    for mod in geom.ModList:
        f3.write("cp $SCRATCH_BARN/xs/pdtxs/$%s_xs $scriptdir/$%s_cx \n" %(mod.Name, mod.Name) )
    for fuel in geom.FuelList:
        f3.write("cp $SCRATCH_BARN/xs/pdtxs/$%s_xs $scriptdir/$%s_cx \n" %(fuel.Name, fuel.Name) )
    for mod in geom.ModList:
        f3.write("cp $SCRATCH_BARN/dat/indicators/wgt_%s_$res.txt $scriptdir/%s_%i.wgt \n" %(fuel.Name, fuel.Name, num_FEDS_groups) )
    for fuel in geom.FuelList:
        f3.write("cp $SCRATCH_BARN/dat/indicators/wgt_%s_$res.txt $scriptdir/%s_%i.wgt \n" %(fuel.Name, fuel.Name, num_FEDS_groups) )
    f3.write("#######################\n")

    f3.close()

    # ---- variables updated in this function -----
    prob.make_PDT_xs_file = make_PDT_xs_file
    prob.num_bins = num_bins
    prob.num_FEDS_groups = num_FEDS_groups
    # ---------------------------------------------
    return prob

dirDict = directories.get_root_directories()
headDirr = dirDict['head']
srcDict = directories.get_source_directories(headDirr)
srcDirr = srcDict['src']
sys.path.append(srcDirr)

"""
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def propagate_error(prob):
    print 'creating "'+prob.PDT_inputfile[:-4]+'.log" file'
    #os.system('python '+os.path.join(srcDict['src'],'propagate_error.py')+' -d . -i '+prob.PDT_inputfile+' -r 9 -g '+str(prob.num_bands_RRR)+' > '+prob.PDT_inputfile[:-4]+'.log')
    os.system('python '+os.path.join(srcDict['src'],'propagate_error.py')+' -d . -i '+prob.PDT_inputfile+' -c '+prob.custom_cov_matrix+' -C '+prob.custom_clust_file+' > '+prob.PDT_inputfile[:-4]+'.log')
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sys.path.append(os.path.join(srcDirr,'UQ'))
import write_run_njoy
import read_njoy_out_June2017
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def cov_driver(clust_file):
    material_name = ['Pb208', 'Pu240']
    isotope_name = ['pb-208', 'pu-240']
    mat = [8208, 9440]

    # Select the group option, 1 = arbitrary,   3 = lanl 30-group
    group_option = 1
    thermal_cutoff = 3.162280

    # Weight function
    weight_funct = 3  # iwt=3 is 1/e weighting
                      # iwt=4 is 1/e + fission spectrum + thermal maxwellian
      
    # Temperature (in Kelvin)
    temp = 293.6   

    # Set the legendre order
    l_order = 1 
                      
    # Format for covariance matrix plot
    # Options are 'png', 'pdf', and None
    #    None skips producing figures
    #    The PDFs look much better than the pngs, but can be large files.
    figure_format = None

    t0 = time.time()

    # reading custom group structure file    
    
    group_struct_file = open(clust_file)
    group_struct_file.readline()
    group_struct = np.loadtxt(group_struct_file, usecols=[0,1])
    group_struct_file.close()
    num_subelements = len(group_struct) - 1

    # Creating a variable for the upper energy bounds for all subelements
    energies = [float(group_struct[i][1]) for i in range(num_subelements + 1)]

    # Reversing the ordering such that it goes from low energies --> high energies 
    energies = energies[::-1]

    # Creating 'custom_group_struct' file with the proper energy ordering
    f = open(os.path.join(srcDirr,'njoy_step/group_bounds/custom_group_struct'),'w')
    [f.write(str(energies[i])+'\n') for i in range(num_subelements + 1)]
    f.close()

    current_dir = os.path.dirname(os.path.realpath(__file__)) ; 

    t1 = time.time()

    print("\n\n created 'custom_group_struct' file... %4.1fs" %(t1-t0))

    '''
    Cross Sections
       MT     Reaction     
        1  (n,*) Total
        2  (n,n) Elastic
        4  (n,n) Inelastic
       16  (n,2n)
       18  (n,fission)
       22  (n,n+alpha)
       28  (n,n+proton)
      102  (n,gamma)
      103  (n,proton)
      105  (n,triton)
      107  (n,alpha)
     1018  fission spectrum chi
     1452  nu * sigma_f 
    Tranfer MTs have a group-to-group matrix of cross sections.
    Scalar MTs have a groupwise vector of cross sections.
    '''
    #mt = PDT.mt
    #mt_name = PDT.mt_name
    #transfer_mt = PDT.transfer_mt
    #scalar_mt = PDT.scalar_mt
    
    cross_section_option = 1 

    mt =      [ 1, 2, 4, 1452]
    mt_name = [ 'total', 'elastic', 'inelastic', 'nu_sigma_f']

    transfer_mt = [2,4]
    scalar_mt = [1,1452]

    # Determine the total number of groups and number of cross sections.
    num_groups = read_njoy_out_June2017.SetNumGroups( group_option ) 
    num_xs = read_njoy_out_June2017.GetXsIndex(0,mt[-1],num_groups,mt,num_groups) + 1

    # Set the local address
    address = srcDirr
    scratchDirr = os.path.abspath(os.environ['SCRATCH_BARN'])

    # Select the steps to run, 0 = skip, 1 = run
    run_njoy          = 0
    read_njoy_output  = 1 

    ## Generate cross sections and covariances with NJOY
    #print '\n\n'
    #if run_njoy == 1 : 
    #    print 'Writing NJOY input deck and running NJOY.'
    #    write_run_njoy.generate_xs_covar( address, group_option, weight_funct, temp, 
    #                                      l_order, isotope_name, mat, mt, scratchDirr ) 

    if read_njoy_output == 1 :
        print '  Reading NJOY output to extract multi-group cross section and covariance data.'
        
        for mat_iter in range(0,len(mat)) : 
            print '\n'
            print 'Reading NJOY output for isotope %i %s.' %(mat[mat_iter], isotope_name[mat_iter])

            # Read the NJOY output file to collect cross section means and the covariance matrix

            mt_scalar_data, mt_matrix_data, cov_mat =  \
               read_njoy_out_June2017.read_output( cross_section_option, isotope_name[mat_iter], mat[mat_iter], 
                   material_name[mat_iter], mt, mt_name, transfer_mt, scalar_mt, num_groups, num_xs, figure_format) 
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def flip_array(old_array, verbosity=0):
    ''' This function takes an array with the ordering:
    array([[ 1., 2., 3.], 
           [ 4., 5., 6.],
           [ 7., 8., 9.]])
    and creates flipped array with the ordering:
    array([[ 9., 8., 7.], 
           [ 6., 5., 4.],
           [ 3., 2., 1.]]) '''

    new_array = np.array(old_array)
    for i in range(len(old_array)):
        new_array[len(old_array)-i-1] = old_array[i][::-1]

    if verbosity >= 4: 
        print new_array

    return new_array                                          
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
def flip_csr_array(old_array, length, verbosity=4):
    ''' This function takes an array with the ordering:
    array([[ 1., 2., 3.], 
           [ 4., 5., 6.],
           [ 7., 8., 9.]])
    and creates flipped array with the ordering:
    array([[ 9., 8., 7.], 
           [ 6., 5., 4.],
           [ 3., 2., 1.]]) '''

    array = sparse.csr_matrix(old_array)
    array.indices = array.shape[1] - array.indices - 1 

    new_array = sparse.csr_matrix(array)

    # there is a bug in scipy csr, these 3 lines fix it
    # --------------------------------------------------
    scipy_bug_fixing_array = sparse.csr_matrix(array) 
    for j in range(scipy_bug_fixing_array.shape[1]):
        new_array[0, j] = scipy_bug_fixing_array[length - 1, j]
    # --------------------------------------------------

    for i in range(length - 1):
        new_array[length - i - 1] = array[i]

    if verbosity >= 4: 
        print array.indices    
        print old_array.todense()    
        print new_array.todense()

    return new_array                                          
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def subelement_to_element(mat, mat_name, custom_cov_matrix, custom_clust_file, csr_option=1):    
    ''' This function computes the element covariance matrix using the subelement covariance matrix.
    Element here refers to a discontiguous set of subelements which make up the discontiguous energy 
    group structure. '''

    from scipy import sparse
    
    #mt = [ 1, 2, 4, 16, 18, 22, 28, 102, 103, 105, 107, 1018, 1452 ] 
    #mt_name = [ 'total', 'elastic', 'inelastic', 'n_2n', 'fission', 'n_n_alpha', 'n_np', 
    #            'absorption',  'n_p', 'n_triton', 'n_alpha', 'chi', 'nu_sigma_f' ]

    #mt = [ 1, 2, 4, 18, 452]
    #mt_name = ['total', 'elastic', 'inelastic', 'fission', 'nu'] 

    mt = [ 1, 2, 4, 1452]
    mt_name = ['total', 'elastic', 'inelastic', 'nu_sigma_f'] 
            
    # reading custom group structure file  
    group_struct_file = open(custom_clust_file)
    group_struct_file.readline()
    group_struct = np.loadtxt(group_struct_file, usecols=[0,1])
    group_struct_file.close()
    num_subelements = len(group_struct) - 1

    de_sub = np.zeros((len(group_struct)-1,2)) 
    de_elem = np.zeros((max(group_struct[:,0])+1,2)) 
    for i in range(len(de_sub)):
        de_sub[i,0] = group_struct[i,0]
        de_sub[i,1] = group_struct[i,1] - group_struct[i+1,1] 
        de_elem[group_struct[i,0], 0] = group_struct[i,0]
        de_elem[group_struct[i,0], 1] += de_sub[i,1]
        print de_sub[i,1], de_elem[de_sub[i,0], 1]
   
    # obtaining the subelement mapping from the custom group structure file
    # (the 1st column is the subelement, the 2nd column is the corresponding element)
    mapping = np.zeros((2,num_subelements), dtype=int)
    mapping[0] = [i for i in range(num_subelements)]
    mapping[1] = [group_struct[i,0] for i in range(num_subelements)] 
    num_elements = int(max(mapping[1])) + 1

    mapping_mat = np.zeros(( num_elements*len(mt), num_subelements*len(mt) ))
    for mt_i in range(len(mt)):
        for s in range(num_subelements):
            i = mt_i*num_elements + mapping[1,s]
            j = mt_i*num_subelements + s  
            # print s
            # mapping_mat[i,j] = 1.
            # mapping_mat[i,j] = de_subelement/de_element from clust-*.txt file 
            mapping_mat[i,j] = de_sub[s,1]/de_elem[de_sub[s,0],1]   


    print "\n\n >>>> num_subelements in '"+custom_clust_file+"' =", num_subelements
    print "\n mapping = \n", mapping
    print "\n size of mapping_mat = \n", mapping_mat.shape
    print "\n mapping_mat = \n", mapping_mat

    cov_mat_list = []
                                     
    for num in range(len(mat)):
        ''' The 'cov_mat' files go from low energies --> high energies
        but mapping[0] in this script goes from high energies --> low energies
        such that group 0 is the highest energy group '''
        
        if custom_cov_matrix == None:
            #cov_mat_file = open(os.path.join(srcDirr,'xs_data/matrices/subelements_cov_mat_'+str(mat[num])+'_COPY.txt'))
            subelement_cov_mat_file = open(os.path.join(srcDirr,'xs_data/matrices/cov_mat_'+str(mat[num])))
        else:
            print "\nUsing the custom covariance matrix in '"+custom_cov_matrix+"'"
            subelement_cov_mat_file = open(custom_cov_matrix)

        figure_format = 'png'

        run_njoy = 0
        if run_njoy == 1:
            # copying all old subelement matrices, in order to create new 'cov_mat' and 'cor_mat' files
            # only copy if there is a new NJOY run
            os.system('cp '+os.path.join(srcDirr,'xs_data/matrices/cov_mat_'+str(mat[num]) )+
                      ' '+os.path.join(srcDirr,'xs_data/matrices/subelements_cov_mat_'+str(mat[num])) )
            os.system('cp '+os.path.join(srcDirr,'xs_data/figures/cov_mat_'+str(mat[num])+'.'+str(figure_format) )+
                       ' '+os.path.join(srcDirr,'xs_data/figures/subelements_cov_mat_'+str(mat[num])+'.'+str(figure_format)) )
            os.system('cp '+os.path.join(srcDirr,'xs_data/figures/cor_mat_'+str(mat[num])+'.'+str(figure_format) )+
                      ' '+os.path.join(srcDirr,'xs_data/figures/subelements_cor_mat_'+str(mat[num])+'.'+str(figure_format)) )

        if custom_cov_matrix == None:
            group_option = 1
            num_groups = read_njoy_out_June2017.SetNumGroups( group_option ) 
            num_xs = read_njoy_out_June2017.GetXsIndex(0,mt[-1],num_groups,mt,num_groups) + 1
            subelement_cov_mat = read_njoy_out_June2017.build_covariance_matrix(mat[num], mat_name[num], mt, num_groups, num_xs) 
        else:
            subelement_cov_mat_file.readline()
            subelement_cov_mat = np.loadtxt(subelement_cov_mat_file)
            subelement_cov_mat = np.array(subelement_cov_mat)
            num_groups = 2


        if csr_option == True:
            subelement_cov_mat = sparse.csr_matrix(subelement_cov_mat)
            print subelement_cov_mat.shape

            element_cov_mat = np.zeros((num_elements * len(mt) , num_elements * len(mt)))

            print " Collapsing subelement covariance matrix into element covariance matrix..."
            t0 = time.time()

            M = sparse.csr_matrix(mapping_mat)
            S = sparse.csr_matrix(subelement_cov_mat)
            
            flipped_element_cov_mat = M * S * M.transpose()
            flipped_element_cov_mat = np.array( flipped_element_cov_mat.todense() )

            t1 = time.time()
            print("\n Finished in... %4.1fs" %(t1-t0))

            print flipped_element_cov_mat

            # this flips the 'cov_mat' so that the cov_mat[0,0] corresponds to energy group 0, etc.
            element_cov_mat = flip_array(flipped_element_cov_mat)
                  
            cov_mat_list.append(element_cov_mat)

        else:
            # this flips the 'cov_mat' so that the cov_mat[0,0] corresponds to energy group 0, etc.
            subelement_cov_mat = flip_array(subelement_cov_mat)

            print " Collapsing subelement covariance matrix into element covariance matrix..."
            t0 = time.time()

            M = np.matrix(mapping_mat)
            S = np.matrix(subelement_cov_mat)

            element_cov_mat = np.array( M * S * M.transpose() )

            t1 = time.time()
            print("\n Finished in... %4.1fs" %(t1-t0))

            # this flips the 'cov_mat' so that the flipped_cov_mat[0,0] corresponds to the highest energy
            flipped_element_cov_mat = flip_array(element_cov_mat)
        
            cov_mat_list.append(element_cov_mat)

        if num_groups < 999:         
            if ( mat == 125 and 'poly' in mat_name[num] ) : 
              f = open(os.path.join(srcDirr,'xs_data/matrices/cov_mat_125_poly'),'w') 
            elif ( mat == 600 and 'graphite' in mat_name[num] ) : 
              f = open(os.path.join(srcDirr,'xs_data/matrices/cov_mat_600_graphite'),'w') 
            else : 
              f = open(os.path.join(srcDirr,'xs_data/matrices/cov_mat_%s') %mat[num],'w')

            f.write('MAT %i %s Covariance Matrix \n' %(mat[num], mat_name[num]) )
            for row in range(0,num_elements*len(mt)) : 
              for column in range(0,num_elements*len(mt)) : 
                f.write('%10e ' %flipped_element_cov_mat[row,column] )
              f.write('\n')
            f.close() 

            num_xs = len(flipped_element_cov_mat[0])

            read_njoy_out_June2017.plot_covariance_matrix( flipped_element_cov_mat, mat[num], mat_name[num], 
                                        mt, mt_name, num_elements, num_xs, figure_format ) 

    return cov_mat_list
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"""

class problem:
    def __init__(self):
        self = self

# >>>>> PROBLEM 1
prob_1 = problem()

prob_1.filename_format = ('short')

prob_1.range_bounds = [1e-5, 1.77828, 31622.8, 1.42e7]
prob_1.log_spacing = True
prob_1.num_low_E_bins = 1
prob_1.num_mid_E_bins = 2
prob_1.num_high_E_bins = 1

prob_1.num_bands_RRR = 2
prob_1.min_binwidth = 1e-8

prob_1.create_multigroup_structure = True
prob_1.create_PDT_cross_section = True
prob_1.new_PENDF = False
prob_1.new_GENDF = True
prob_1.run_PDT_cross_section = True
prob_1.scat_leg_order = 1
prob_1.apportion_algorithm = 'equal'
prob_1.plot_fluxes = False
prob_1.create_MCNP_cross_sections = False
prob_1.propagate_uncertainties = True

#simulate(prob_1)

import copy

prob_2 = copy.deepcopy(prob_1)
prob_2.num_low_E_bins = 2
prob_2.num_mid_E_bins = 8
prob_2.num_high_E_bins = 10
prob_2.num_bands_RRR = 8
#simulate(prob_2)

prob_3 = copy.deepcopy(prob_1)
prob_3.num_low_E_bins = 5
prob_3.num_mid_E_bins = 45
prob_3.num_high_E_bins = 50
prob_3.num_bands_RRR = 45
#simulate(prob_3)

prob_4 = copy.deepcopy(prob_1)
prob_4.create_PDT_cross_section = False
prob_4.new_PENDF = False
prob_4.new_GENDF = False
prob_4.run_PDT_cross_section = False
prob_4.num_low_E_bins = 5
prob_4.num_mid_E_bins = 25
prob_4.num_high_E_bins = 45
prob_4.num_bands_RRR = 50
#simulate(prob_4)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def find_append_to_file(filename, find, new_lines, option='after'):


    with open(filename, 'r+') as f:
        while len(f.readline()) > 0:
            line = f.readline()
            print line
            index = repr(line).find(find) - 1
            if index > -1: 
                print line
                f.write(new_lines)
                    
         
        '''
        lines = f.readlines()

        for i in range(len(lines)):
            characters = lines[i]
            index = repr(characters).find(find) - 1
            if index > -1:
                print index
                print "string found!"
                f.write(new_lines)

        '''    
        '''index = repr(lines).find(find) - 1
        if index < 0:
            raise ValueError("The text was not found in the file!")

        len_found = len(find) - 1
        old_lines = lines[index + len_found:]

        print len_found
        print old_lines

        file.seek(index)
        file.write(insert)
        file.write(old_lines)
        '''
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class Isotope():
    def __init__(self):
        self = self
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class Material_Geometry:
    def __init__(self):
        self = self
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class Material():
    def __init__(self, Name=None, temperature=None, atomDensity=None, massDensity=None, chordLength=None, abundanceDict=None, elemAtomFracDict=None, elemMassFracDict=None, ZAList=None, ZList=None, symDict=None, backgroundXSDict=None, thermalOpt=0, elemWeightDict=None, matlWeight=None, SabDict=None, thermalXSDict=None, temperatureIndex=0):
        '''The following units are used:
        temperature in Kelvin is the temperature of the material
        temperatureIndex is the least-significant digit of an MCNP-like matl. name and refers to temperature
        atomDensity in atoms/barn-cm is the atom density of the material
        massDensity in g/cm^3 is the mass density of the material
        chordLength in cm is used to calculate the escape cross section; set to zero to use 0 escape XS
        abundanceDict is the atom fraction of each isotope in its element
        elemAtomFracDict is the atom fraction of each element in the material
        elemMassFracDict is the mass/weight fraction of each element in the material
        elemWeightDict is the elemental mass/weight in g/mole calculated using the correct abundances
        matlWeight in g/mole is the effective weight of the material
        ZAList is a list of all (Z,A) = (atomic number, atomic mass) pairs in the material
        ZList is a list of all elements in the material stored as atomic number
        symDict is the chemical symbol for each element in the material
        backgroundXSDict is an approximate background XS seen by each nuclide in the material
        thermalOpt specifies which thermal treatment to use
        SabDict is the thermal S(alpha,beta) Hollerith string used for each nuclide in the material
        thermalXSDict is a list of thermal XS used for each nuclide (list of shortName's in endfMTList)
        shortName is a succinct name without whitespaces
        longName is a longer name that may contain whitespace
        '''
        # locals() includes local names, including 'self'. Update Material to include all keywords above.
        varss = locals()
        self.__dict__.update(varss)
        del self.__dict__["self"]
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def add_lines_to_file(file_name, search_string, new_lines, option='add', exception='get_unicornblood_material()'):
    f = open(file_name)
    for line in f:
        if exception in line:
            print '\n** Warning: "'+exception+'" was already found in "'+file_name+'"'
            option='none'
    f.close()

    if option == 'add':
        for i in range(len(new_lines)-1,-1,-1):
            print 'sed -i "/'+search_string+'/a'+new_lines[i]+'" '+file_name
            os.system('sed -i "/'+search_string+'/a'+new_lines[i]+'" '+file_name)

    elif option == 'replace':
        print 'sed -i s/"'+search_string+'"/"'+new_lines+'"/g '+file_name
        os.system('sed -i s/"'+search_string+'"/"'+new_lines+'"/g '+file_name)
        #for i in range(len(new_lines)-1,-1,-1):
        #    print 'sed -i "/'+search_string+'/a'+new_lines[i]+'" '+file_name
        #    os.system('sed -i "/'+search_string+'/a'+new_lines[i]+'" '+file_name)

    else:
        print '** Warning: Material not added to "'+file_name+'"'
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def modify_materials_materials_source_code(geom):
    for mat in geom.FuelList + geom.ModList:
        print mat.Name
        new_lines = []
        new_lines.append("\        '%s': get_%s_material," %(mat.Name, mat.Name))

        search_string = '# Call Generated By Python Script'
        add_lines_to_file(os.path.join(srcDirr,'materials_materials.py'), search_string, new_lines, exception='get_'+mat.Name+'_material,')

        new_lines = []
        new_lines.append("def get_%s_material(): " %mat.Name)
        new_lines.append("\    shortName = '%s' " %mat.Name)
        new_lines.append("\    longName = '%s' " %mat.Name)
        new_lines.append("\    massDensity = %.4f #g/cc " %mat.massDensity)
        new_lines.append("\    fuelRadius = 0.0 #cm ")
        new_lines.append("\    temperature = %.1f #K " %mat.temperature)
        new_lines.append("\    thermalOpt = 'none' ")
        for i in range( len(mat.isotopes) ): 
            new_lines.append("\    %sAtomFractionsDict = %s " %(mat.isotopes[i].name, mat.isotopes[i].AtomFractionsDict) )
        new_lines.append("\    elemAtomFracDict = %s" %mat.elemAtomFracDict)
        new_lines.append("\    # ")
        new_lines.append("\    chordLength = 0. ")
        new_lines.append("\    symDict, ZList, ZAList = get_all_isotopes(elemAtomFracDict) ")
        new_lines.append("\    abundanceDict = lookup_natl_abundances(ZAList) ")
        for i in range( len(mat.isotopes) ): 
            new_lines.append("\    override_abundances(ZAList, abundanceDict, %sAtomFractionsDict, '%s') " %(mat.isotopes[i].name, mat.isotopes[i].Name))
        new_lines.append("\    # ")
        new_lines.append("\    material = Material( ")
        new_lines.append("\        shortName=shortName, longName=longName, ")
        new_lines.append("\        temperature=temperature, thermalOpt=thermalOpt, ")
        new_lines.append("\        symDict=symDict, ZList=ZList, ZAList=ZAList, ")
        new_lines.append("\        abundanceDict=abundanceDict, chordLength=chordLength, ")
        new_lines.append("\        elemAtomFracDict=elemAtomFracDict, massDensity=massDensity) ")
        new_lines.append("\    return material ")
        new_lines.append("\ ")

        search_string = '# Function Generated By Python Script'

        add_lines_to_file(os.path.join(srcDirr,'materials_materials.py'), search_string, new_lines, exception='get_'+mat.Name+'_material()')

def modify_indicators_source_code(geom):
    #for mat in geom.FuelList + geom.ModList:
    #    search_string = "'godiva',"
    #    new_lines =  "'godiva','"+mat.Name+"',"
    #    add_lines_to_file(os.path.join(srcDirr,'indicators.py'), search_string, new_lines, option='replace', exception="'"+mat.Name+"',")

    search_string = "'3',"
    new_lines =  "'"+geom.Name+"','3',"
    add_lines_to_file(os.path.join(srcDirr,'indicators.py'), search_string, new_lines, option='replace', exception="'"+geom.Name+"',")

    search_string = '# Materials generated by python script'
    new_lines = []
    new_lines.append("\    elif materialOpt == '%s':" %geom.Name)
    for mat in geom.FuelList:
        new_lines.append("\        materials.append(mat.get_%s_material())" %mat.Name)
    new_lines.append("\        if workOpt == 'wgt':")
    for mat in geom.ModList:
        new_lines.append("\            materials.append(mat.get_%s_material())" %mat.Name)
        print search_string, new_lines
        #add_lines_to_file(os.path.join(srcDirr,'indicators.py'), search_string, new_lines, option='replace', exception="'"+mat.Name+"',")
    add_lines_to_file(os.path.join(srcDirr,'indicators.py'), search_string, new_lines, exception="materialOpt == '"+geom.Name+"'")



def modify_indicators_clustering_source_code(geom):
    #for mat in geom.FuelList + geom.ModList:
    #    print mat.Name
    #    search_string = "'godiva',"
    #    new_lines =  "'godiva','"+mat.Name+"',"
    #    add_lines_to_file(os.path.join(srcDirr,'indicators_clustering.py'), search_string, new_lines, option='replace', exception="'"+mat.Name+"',")
    search_string = "'4',"
    new_lines =  "'"+geom.Name+"','4',"
    add_lines_to_file(os.path.join(srcDirr,'indicators_clustering.py'), search_string, new_lines, option='replace', exception="'"+geom.Name+"',")

    search_string = '# Materials generated by python script'
    new_lines = []
    new_lines.append("\    elif materialOpt == '%s':" %geom.Name)
    new_lines.append("\        importanceDict = %s " %geom.importanceDict)
    add_lines_to_file(os.path.join(srcDirr,'indicators_clustering.py'), search_string, new_lines, exception="materialOpt == '"+geom.Name+"'")



# -----------------------------------------------------------------------------
U = Isotope()
U.name = 'u'
U.Name = 'U'
U.AtomFractionsDict = {234: 0.01024979, 235: 0.93956183, 238: 0.05018838}

HEU = Material()
HEU.Name = 'HEU'
HEU.temperature = 293.6
HEU.isotopes = [U]
HEU.elemAtomFracDict = {'U': 1.}
HEU.massDensity = 18.39374

geom = Material_Geometry()
geom.Name = 'HEU'
geom.FuelList = [HEU]
geom.importanceDict = {HEU.Name: 1}
geom.ModList = []

modify_materials_materials_source_code(geom)
modify_indicators_clustering_source_code(geom)
modify_indicators_source_code(geom)
#############################################################################

prob_1 = problem()

prob_1.filename_format = ('short')

prob_1.range_bounds = [1e-5, 1.77828, 31622.8, 1.42e7]
prob_1.log_spacing = True
prob_1.num_low_E_bins = 99
prob_1.num_mid_E_bins = 100
prob_1.num_high_E_bins = 100

prob_1.num_bands_RRR = 200
prob_1.min_binwidth = 1e-8

prob_1.create_multigroup_structure = True
prob_1.create_PDT_cross_section = True
prob_1.new_PENDF = True
prob_1.new_GENDF = True
prob_1.start_at_step = 0
prob_1.run_PDT_cross_section = False
prob_1.scat_leg_order = 7
prob_1.apportion_algorithm = 'equal'
prob_1.plot_fluxes = False
prob_1.create_MCNP_cross_sections = False
prob_1.propagate_uncertainties = False

simulate(prob_1, geom)


