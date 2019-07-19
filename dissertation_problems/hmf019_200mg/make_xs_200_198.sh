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
penalty=0 

# Which problem to run, materials-wise. 
# This is only used in indicators.py and indicators_clustering.py, 
# where there is a mapping from this string to a set of materials defined in 
# materials_materials.py. 
unimportantMatsExist=1 
m=HEU_MET_FAST_019 

# The specific list of materials to generate NJOY inputs for / read NJOY outputs from  
# This is only used in calls to materials.py 
mUNIMPORTANTlist=(UnpolutedAir )  

# We need PENDF files for all the materials to do the clustering, 
# but we can only do half of the materials at a time due to incompatible 
# thermal treatments  
mIMPORTANTlist=(HEU19 Carbon12 )  

# How many elements to use in the resolved resonance region (RRR). 
g=198 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.1252345819e-03 1.2661528643e-03 1.4247189888e-03 1.6031430757e-03 1.8039120284e-03 2.0298241971e-03 2.2840283817e-03 2.5700677210e-03 2.8919290775e-03 3.2540986063e-03 3.6616242847e-03 4.1201862709e-03 4.6361760758e-03 5.2167856482e-03 5.8701076176e-03 6.6052480907e-03 7.4324535735e-03 8.3632537891e-03 9.4106223805e-03 1.0589157740e-02 1.1915286481e-02 1.3407492402e-02 1.5086574107e-02 1.6975934907e-02 1.9101909017e-02 2.1494128606e-02 2.4185936815e-02 2.7214852499e-02 3.0623093173e-02 3.4458163442e-02 3.8773517133e-02 4.3629302339e-02 4.9093199775e-02 5.5241366122e-02 6.2159495511e-02 6.9944013941e-02 7.8703423282e-02 8.8559813589e-02 9.9650564815e-02 1.1213026163e-01 1.2617284806e-01 1.4197405194e-01 1.5975411297e-01 1.7976085251e-01 2.0227312771e-01 2.2760471828e-01 2.5610870001e-01 2.8818236597e-01 3.2427276408e-01 3.6488292810e-01 4.1057888904e-01 4.6199756454e-01 5.1985563636e-01 5.8495953962e-01 6.5821670297e-01 7.4064819656e-01 8.3340296377e-01 9.3777383547e-01 1.0552155497e+00 1.1873650278e+00 1.3360641906e+00 1.5033856309e+00 1.6916615018e+00 1.9035160226e+00 2.1419020558e+00 2.4101422642e+00 2.7119754229e+00 3.0516085310e+00 3.4337754495e+00 3.8638028822e+00 4.3476846206e+00 4.8921650862e+00 5.5048333352e+00 6.1942288362e+00 6.9699604946e+00 7.8428405828e+00 8.8250354440e+00 9.9302350679e+00 1.1173843905e+01 1.2573195574e+01 1.4147794464e+01 1.5919587589e+01 1.7913270484e+01 2.0156631423e+01 2.2680938731e+01 2.5521376610e+01 2.8717535539e+01 3.2313964095e+01 3.6360789877e+01 4.0914418194e+01 4.6038318249e+01 5.1803907785e+01 5.8291548516e+01 6.5591666222e+01 7.3806011116e+01 8.3049076058e+01 9.3449692373e+01 1.0515282552e+02 1.1832159566e+02 1.3313955122e+02 1.4981322725e+02 1.6857502412e+02 1.8968644679e+02 2.1344174964e+02 2.4017203791e+02 2.7024988265e+02 3.0409451371e+02 3.4217766299e+02 3.8503013954e+02 4.3324922807e+02 4.8750701400e+02 5.4855975106e+02 6.1725840212e+02 6.9456050002e+02 7.8154349383e+02 8.7941976650e+02 9.8955353325e+02 1.1134798562e+03 1.2529260405e+03 1.4098357093e+03 1.5863958948e+03 1.7850675214e+03 2.0086197061e+03 2.2601683551e+03 2.5432195940e+03 2.8617186365e+03 3.2201047734e+03 3.6233732483e+03 4.0771448821e+03 4.5877444166e+03 5.1622886704e+03 5.8087857336e+03 6.5362465861e+03 7.3548106944e+03 8.2758873365e+03 9.3123146267e+03 1.0478538455e+04 1.1790813837e+04 1.3267431478e+04 1.4928972712e+04 1.6798596368e+04 1.8902361560e+04 2.1269590906e+04 2.3933279230e+04 2.6930553448e+04 3.0303190048e+04 3.4098197384e+04 3.8368470876e+04 4.3173530283e+04 4.8580349296e+04 5.4664289028e+04 6.1510148408e+04 6.9213346125e+04 7.7881250587e+04 8.7634676441e+04 9.8609568503e+04 1.1095889658e+05 1.2485478760e+05 1.4049092472e+05 1.5808524694e+05 1.7788298674e+05 2.0016008821e+05 2.2522705316e+05 2.5343326899e+05 2.8517187847e+05 3.2088525943e+05 3.6107119073e+05 4.0628979033e+05 4.5717132234e+05 5.1442498174e+05 5.7884877924e+05 6.5134066407e+05 7.3291103980e+05 8.2469684742e+05 9.2797741228e+05 1.0441922755e+06 1.1749612585e+06 1.3221070405e+06 1.4876805629e+06 1.6739896161e+06 1.8836310058e+06 2.1195267472e+06 2.3849647932e+06 2.6836448618e+06 3.0197300040e+06 3.3979046284e+06 3.8234397938e+06 4.3022666777e+06 4.8410592463e+06 5.4473272768e+06 6.1295210307e+06 6.8971490341e+06 7.7609106095e+06 8.7328450047e+06 9.8264991974e+06 1.1057116716e+07 1.2441850104e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-198-1 
 
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
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_UnpolutedAir_200.xml $scriptdir/hmf019_200mg/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HEU19_200.xml $scriptdir/hmf019_200mg/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_Carbon12_200.xml $scriptdir/hmf019_200mg/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf019_200mg/flux_1th_198cg_198el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf019_200mg/clust_1th_198cg_198el_1urr.xml
#######################
rm *.~ *.pyc
