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
g=398 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.3441012979e-03 1.8066082989e-03 2.4282645594e-03 3.2638335458e-03 4.3869229050e-03 5.8964687703e-03 7.9254513270e-03 1.0652609415e-02 1.4318186140e-02 1.9245092574e-02 2.5867353907e-02 3.4768343959e-02 4.6732176240e-02 6.2812778737e-02 8.4426737423e-02 1.1347808735e-01 1.5252604448e-01 2.0501045435e-01 2.7555481777e-01 3.7037358820e-01 4.9781962059e-01 6.6911999815e-01 8.9936505795e-01 1.2088377416e+00 1.6248003775e+00 2.1838962961e+00 2.9353778461e+00 3.9454451727e+00 5.3030779773e+00 7.1278739920e+00 9.5805846837e+00 1.2877276308e+01 1.7308363798e+01 2.3264194245e+01 3.1269433679e+01 4.2029286392e+01 5.6491618388e+01 7.5930457595e+01 1.0205822660e+02 1.3717659483e+02 1.8437923915e+02 2.4782437465e+02 3.3310106361e+02 4.4772157192e+02 6.0178314591e+02 8.0885750745e+02 1.0871864256e+03 1.4612886856e+03 1.9641200189e+03 2.6399762666e+03 3.5483955263e+03 4.7694030323e+03 6.4105608058e+03 8.6164430992e+03 1.1581372353e+04 1.5566537610e+04 2.0923003406e+04 2.8122636033e+04 3.7799671591e+04 5.0806587645e+04 6.8289200395e+04 9.1787602881e+04 1.2337183616e+05 1.6582424511e+05 2.2288458307e+05 2.9957945738e+05 4.0266513747e+05 5.4122273389e+05 7.2745817906e+05 9.7777748262e+05 1.3142319834e+06 1.7664609146e+06 2.3743024080e+06 3.1913029481e+06 4.2894344345e+06 5.7654343906e+06 7.7493278472e+06 1.0415881617e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-79-1 
 
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
#cd $SCRATCH_BARN/xs 
#./RunPendf.sh 
#cd $srcdir 
 
if [ "${unimportantMatsExist}" = 1 ] 
then 
    echo '------- Step 1: Generating the NJOY inputs -------'  
    mList=${mUNIMPORTANTlist[*]} 
    ./materials.py -m ${mList[*]} -W ${weightOpt[*]} -v  
      
    echo '------- Step 2: Running NJOY to generate the PENDF files -------'  
#    cd $SCRATCH_BARN/xs 
#    ./RunPendf.sh  
#    cd $srcdir  
fi 
 
echo '------- Step 3: Generating the indicators and their energy grid -------' 
./indicators.py -R ${c[0]} ${c[*]: -1} -m $m -w flux -r $res -G $G -v -Z -s $bin 
 
echo '------- Step 4: Generating more indicators on the same energy grid but using escape XS -------' 
./indicators.py -R ${c[0]} ${c[*]: -1} -m $m -w sigt -r $res -G $G -v -Z -s $bin
 
echo '------- Step 5: Clustering the indicators to get the clust file, which specifies the energy mesh -------' 
./indicators_clustering.py -c ${c[*]} -e $g -m $m -w $clusterer -E $penalty -r $res -a $appt -v 3 -d 500 -S -p none  
 
echo '------- Step 6: Generating the weighting spectrum on the subelements -------' 
./indicators.py -R ${c[0]} ${c[*]: -1} -m $m -w wgt -r $res -G $G -v -Z -s $bin -M clust-$g-$res 
 
# Do for important materials: 
mList=${mIMPORTANTlist[*]} 
echo '------- Step 7: Regenerating NJOY inputs with a group structure of the subelements -------'  
./materials.py -m ${mList[*]} -G clust-$g-$res -L $L -W ${weightOpt[*]} -v  
echo '------- Step 8: Running NJOY to generate GENDF files (on the subelements) -------'  
cd $SCRATCH_BARN/xs 
./RunGendf.sh 
echo '------- Step 9: Summing/averaging over the subelements to get PDT-formatted FEDS XS on the elements -------'  
cd $srcdir 
./materials.py -b -m ${mList[*]} -p $rxnOpt -M clust-$g-$res -W ${weightOpt[*]} -v 
 
if [ "${unimportantMatsExist}" = 1 ] 
then 
    # Do for unimportant materials: 
    mList=${mUNIMPORTANTlist[*]} 
    echo '------- Step 7: Regenerating NJOY inputs with a group structure of the subelements -------'  
    ./materials.py -m ${mList[*]} -G clust-$g-$res -L $L -W ${weightOpt[*]} -v  
    echo '------- Step 8: Running NJOY to generate GENDF files (on the subelements) -------'  
    cd $SCRATCH_BARN/xs 
    ./RunGendf.sh 
    echo '------- Step 9: Summing/averaging over the subelements to get PDT-formatted FEDS XS on the elements -------'  
    cd $srcdir 
    ./materials.py -b -m ${mList[*]} -p $rxnOpt -M clust-$g-$res -W ${weightOpt[*]} -v 2 
fi 
 
echo ' The result should be a list of .data files in $scratch/xs/pdtxs ' 
 
####################### 
sleep 0.1 
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HMF001_400.xml $scriptdir/hmf001_400oldfeds_5EperCG/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf001_400oldfeds_5EperCG/flux_1th_79cg_398el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf001_400oldfeds_5EperCG/clust_1th_79cg_398el_1urr.xml
#######################
rm *.~ *.pyc
