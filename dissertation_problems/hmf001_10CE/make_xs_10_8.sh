#! /usr/bin/env bash 
# Pablo Vaquer, Summer Internship 2018 

############################ 
# INITIALIZE VARIABLES 
############################ 

## !!!!! 
# You need to set and export the following: 
# export SCRATCH_BARN=... 
# export ENDF=... 
# export NJOY=... 
## !!!!! 

# This is a resolution parameter used in indicators.py only. I usually just set it at 9.
res=9 

# This is the minimum bin width for a single sublement (use 1e-4 to avoid seg faulting in ERRORR)
bin=1.00e-16 

# In addition to coarse groups, I use energy penalties. 
# See my dissertation, Appendix B, section 1 for more details 
penalty=-0.5 

# Which problem to run, materials-wise. 
# This is only used in indicators.py and indicators_clustering.py, 
# where there is a mapping from this string to a set of materials defined in 
# materials_materials.py. 
unimportantMatsExist=0 
m=HMF001 

# The specific list of materials to generate NJOY inputs for / read NJOY outputs from  
# This is only used in calls to materials.py 
mUNIMPORTANTlist=()  

# We need PENDF files for all the materials to do the clustering, 
# but we can only do half of the materials at a time due to incompatible 
# thermal treatments  
mIMPORTANTlist=(HMF001 )  

# How many elements to use in the resolved resonance region (RRR). 
g=8 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.8546672554e-02 3.4397906283e-01 6.3796670436e+00 1.1832159566e+02 2.1944718908e+03 4.0700151588e+04 7.5485238440e+05 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-8-1 
 
# How many Legendre moments to use for the scattering transfer matrices 
L=7 

# Which clustering algorithm to use. Recommended: use 'tmg' for MG XS and 'har' for FEDS XS 
# Use './indicators_clustering.py -h' for more information. 
clusterer=har 

# Which apportioning algorithm to use. Recommended: use 'var' for FEDS and 'L1' or 'max' for MG XS 
# Use './indicators_clustering.py -h' for more information. 
appt=equal 
 
# Which reactions to include in the PDT XS file. Recommended: use 'abs' if absorption edits are needed 
# Use './materials.py -h' for more information 
rxnOpt=invel 

# Use './materials.py -h' for more information 
weightOpt=(2) 
#weightOpt=(4 .1265 .0253 .1265 1.4e6) 
 
############################ 
# GENERATE CROSS SECTIONS 
############################ 
 
#NB: In many cases, if a previous step has run successfully, you don't need 
# to rerun it to run a later step if you make changes that affect that later 
# step only. 
echo '                  (         )   (      (      (           ' 
echo '   (      (       )\ )   ( /(   )\ )   )\ )   )\ )        ' 
echo ' ( )\     )\     (()/(   )\()) (()/(  (()/(  (()/(   (    ' 
echo ' )((_) ((((_)(    /(_)) ((_)\   /(_))  /(_))  /(_))  )\   ' 
echo '((_)_   )\ _ )\  (_))    _((_) (_))_| (_))   (_))   ((_)  ' 
echo ' | _ )  (_)_\(_) | _ \  | \| | | |_   |_ _|  | _ \  | __| ' 
echo ' | _ \   / _ \   |   /  | .` | | __|   | |   |   /  | _|  ' 
echo ' |___/  /_/ \_\  |_|_\  |_|\_| |_|    |___|  |_|_\  |___| ' 
echo 
echo '------- Step 0: Initializing the scratch directory -------' 
scriptdir=`pwd` 
srcdir=/home/pablo/barnfire/src 
cd $srcdir
./Initialize.py $scriptdir $0 
 
echo '------- Step 1: Generating the NJOY inputs -------' 
mList=${mIMPORTANTlist[*]} 
./materials.py -m ${mList[*]} -W ${weightOpt[*]} -v 
 
echo '------- Step 2: Running NJOY to generate the PENDF file -------' 
cd $SCRATCH_BARN/xs 
./RunPendf.sh 
cd $srcdir 
 
# Step 2b: Run NJOY to generate the ACE files (can be done after step 2)
cd $SCRATCH_BARN/xs
./RunAce.sh
# Step 2c: Copy ACE files and create xsdir
cd ace/xdata
./copyAce.sh
cd $scriptdir
# The result should be ACE files and xsdir (tells MCNP where the ACE files are) in $SCRATCH_BARN/xs/ace/xdata
cp $SCRATCH_BARN/xs/ace/xdata/*.90c $scriptdir/hmf001_10CE/.
cp xsdir $scriptdir/hmf001_10CE/xsdir_hmf001_10CE

if [ "${unimportantMatsExist}" = 1 ] 
then 
    echo '------- Step 1: Generating the NJOY inputs -------'  
    mList=${mUNIMPORTANTlist[*]} 
    ./materials.py -m ${mList[*]} -W ${weightOpt[*]} -v  
      
    echo '------- Step 2: Running NJOY to generate the PENDF files -------'  
    cd $SCRATCH_BARN/xs 
    ./RunPendf.sh  
    cd $srcdir  
fi 
# Step 2b: Run NJOY to generate the ACE files (can be done after step 2)
cd $SCRATCH_BARN/xs
./RunAce.sh
# Step 2c: Copy ACE files and create xsdir
cd ace/xdata
./copyAce.sh
cd $scriptdir
# The result should be ACE files and xsdir (tells MCNP where the ACE files are) in $SCRATCH_BARN/xs/ace/xdata
cp $SCRATCH_BARN/xs/ace/xdata/*.90c $scriptdir/hmf001_10CE/.
cp xsdir $scriptdir/hmf001_10CE/xsdir_hmf001_10CE

 
echo ' The result should be a list of .data files in $scratch/xs/pdtxs ' 
 
####################### 
sleep 0.1 
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HMF001_10.xml $scriptdir/hmf001_10CE/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf001_10CE/flux_1th_8cg_8el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf001_10CE/clust_1th_8cg_8el_1urr.xml
#######################
rm *.~ *.pyc
