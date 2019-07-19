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
unimportantMatsExist=1 
m=HEU_MET_FAST_085_3 

# The specific list of materials to generate NJOY inputs for / read NJOY outputs from  
# This is only used in calls to materials.py 
mUNIMPORTANTlist=(UnpolutedAir )  

# We need PENDF files for all the materials to do the clustering, 
# but we can only do half of the materials at a time due to incompatible 
# thermal treatments  
mIMPORTANTlist=(HEU85 SteelyKnife )  

# How many elements to use in the resolved resonance region (RRR). 
g=598 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.2169187429e-03 1.4808912268e-03 1.8021242901e-03 2.1930388257e-03 2.6687500509e-03 3.2476519571e-03 3.9521285371e-03 4.8094192911e-03 5.8526724779e-03 7.1222268344e-03 8.6671713260e-03 1.0547243235e-02 1.2835137978e-02 1.5619319973e-02 1.9007443227e-02 2.3130513918e-02 2.8147955920e-02 3.4253775133e-02 4.1684060975e-02 5.0726115081e-02 6.1729560196e-02 7.5119858794e-02 9.1414764131e-02 1.1124433985e-01 1.3537532221e-01 1.6474076692e-01 2.0047612698e-01 2.4396315643e-01 2.9688333764e-01 3.6128289803e-01 4.3965193011e-01 5.3502067410e-01 6.5107668615e-01 7.9230742245e-01 9.6417375252e-01 1.1733211109e+00 1.4278364513e+00 1.7375609393e+00 2.1144704740e+00 2.5731387512e+00 3.1313007744e+00 3.8105386020e+00 4.6371158454e+00 5.6429931853e+00 6.8670641732e+00 8.3566591012e+00 1.0169375088e+01 1.2375303149e+01 1.5059738351e+01 1.8326477862e+01 2.2301834402e+01 2.7139520285e+01 3.3026590908e+01 4.0190677490e+01 4.8908788728e+01 5.9518021696e+01 7.2428596143e+01 8.8139716169e+01 1.0725887260e+02 1.3052533241e+02 1.5883872343e+02 1.9329381965e+02 2.3522287201e+02 2.8624712171e+02 3.4833948752e+02 4.2390085125e+02 5.1585289103e+02 6.2775105167e+02 7.6392202066e+02 9.2963102506e+02 1.1312854184e+03 1.3766824292e+03 1.6753106511e+03 2.0387169315e+03 2.4809528455e+03 3.0191180179e+03 3.6740213031e+03 4.4709853855e+03 5.4408259149e+03 6.6210430327e+03 8.0572713641e+03 9.8050445397e+03 1.1931942475e+04 1.4520204438e+04 1.7669908931e+04 2.1502843363e+04 2.6167213115e+04 3.1843372089e+04 3.8750796332e+04 4.7156570359e+04 5.7385714322e+04 6.9833751333e+04 8.4982000885e+04 1.0341618969e+05 1.2584909955e+05 1.5314812802e+05 1.8636882743e+05 2.2679571919e+05 2.7599196149e+05 3.3585979083e+05 4.0871407445e+05 4.9737181769e+05 6.0526108714e+05 7.3655356129e+05 8.9632583389e+05 1.0907557070e+06 1.3273610638e+06 1.6152905571e+06 1.9656773542e+06 2.3920696149e+06 2.9109543487e+06 3.5423949066e+06 4.3108067566e+06 5.2459015392e+06 6.3838359065e+06 7.7686095663e+06 9.4537665875e+06 1.1504465751e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-119-1 
 
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
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_UnpolutedAir_600.xml $scriptdir/hmf085_3_600oldfeds_5EperCG/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HEU85_600.xml $scriptdir/hmf085_3_600oldfeds_5EperCG/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_SteelyKnife_600.xml $scriptdir/hmf085_3_600oldfeds_5EperCG/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf085_3_600oldfeds_5EperCG/flux_1th_119cg_598el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf085_3_600oldfeds_5EperCG/clust_1th_119cg_598el_1urr.xml
#######################
rm *.~ *.pyc
