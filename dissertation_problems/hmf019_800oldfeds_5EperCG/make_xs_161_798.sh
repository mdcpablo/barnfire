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
m=HEU_MET_FAST_019 

# The specific list of materials to generate NJOY inputs for / read NJOY outputs from  
# This is only used in calls to materials.py 
mUNIMPORTANTlist=(UnpolutedAir )  

# We need PENDF files for all the materials to do the clustering, 
# but we can only do half of the materials at a time due to incompatible 
# thermal treatments  
mIMPORTANTlist=(HEU19 Carbon12 )  

# How many elements to use in the resolved resonance region (RRR). 
g=798 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.1582761823e-03 1.3416037145e-03 1.5539476285e-03 1.7999005267e-03 2.0847819105e-03 2.4147532323e-03 2.7969511550e-03 3.2396419059e-03 3.7524000588e-03 4.3463156145e-03 5.0342338570e-03 5.8310331727e-03 6.7539468421e-03 7.8229357637e-03 9.0611201707e-03 1.0495279679e-02 1.2156432478e-02 1.4080506201e-02 1.6309114968e-02 1.8890459421e-02 2.1880369220e-02 2.5343510527e-02 2.9354784620e-02 3.4000947861e-02 3.9382488083e-02 4.5615797946e-02 5.2835692297e-02 6.1198323963e-02 7.0884561043e-02 8.2103898748e-02 9.5098990393e-02 1.1015089553e-01 1.2758515875e-01 1.4777885060e-01 1.7116872289e-01 1.9826065488e-01 2.2964059444e-01 2.6598723102e-01 3.0808667449e-01 3.5684945714e-01 4.1333022687e-01 4.7875055721e-01 5.5452536767e-01 6.4229352585e-01 7.4395329304e-01 8.6170338006e-01 9.9809050133e-01 1.1560644555e+00 1.3390419240e+00 1.5509803676e+00 1.7964636190e+00 2.0808010223e+00 2.4101422642e+00 2.7916103805e+00 3.2334558140e+00 3.7452348559e+00 4.3380163307e+00 5.0246209942e+00 5.8198988226e+00 6.7410501896e+00 7.8079978783e+00 9.0438179738e+00 1.0475238956e+01 1.2133219787e+01 1.4053619493e+01 1.6277972734e+01 1.8854388114e+01 2.1838588684e+01 2.5295117128e+01 2.9298731697e+01 3.3936023097e+01 3.9307287274e+01 4.5528694641e+01 5.2734802613e+01 6.1081465845e+01 7.0749207068e+01 8.1947121462e+01 9.4917398997e+01 1.0994056254e+02 1.2734153506e+02 1.4749666708e+02 1.7084187645e+02 1.9788207643e+02 2.2920209603e+02 2.6547932876e+02 3.0749838339e+02 3.5616805358e+02 4.1254097335e+02 4.7783638366e+02 5.5346650222e+02 6.4106706722e+02 7.4253271521e+02 8.6005795861e+02 9.9618464885e+02 1.1538569519e+03 1.3364850252e+03 1.5480187727e+03 1.7930332741e+03 2.0768277355e+03 2.4055401007e+03 2.7862798042e+03 3.2272815344e+03 3.7380833349e+03 4.3297328942e+03 5.0150264871e+03 5.8087857336e+03 6.7281781632e+03 7.7930885167e+03 9.0265488154e+03 1.0455236501e+04 1.2110051420e+04 1.4026784126e+04 1.6246889967e+04 1.8818385685e+04 2.1796887928e+04 2.5246816135e+04 2.9242785808e+04 3.3871222306e+04 3.9232230062e+04 4.5441757659e+04 5.2634105578e+04 6.0964830867e+04 7.0614111551e+04 8.1790643543e+04 9.4736154350e+04 1.0973063119e+05 1.2709837657e+05 1.4721502239e+05 1.7051565411e+05 1.9750422086e+05 2.2876443493e+05 2.6497239633e+05 3.0691121564e+05 3.5548795115e+05 4.1175322691e+05 4.7692395572e+05 5.5240965867e+05 6.3984295051e+05 7.4111484998e+05 8.5841567908e+05 9.9428243558e+05 1.1516536636e+06 1.3339330088e+06 1.5450628329e+06 1.7896094795e+06 2.0728620357e+06 2.4009467251e+06 2.7809594066e+06 3.2211190446e+06 3.7309454697e+06 4.3214652750e+06 5.0054503007e+06 5.7976938649e+06 6.7153307160e+06 7.7782076245e+06 9.0093126324e+06 1.0435272241e+07 1.2086927292e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-159-1 
 
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
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_UnpolutedAir_800.xml $scriptdir/hmf019_800oldfeds_5EperCG/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HEU19_800.xml $scriptdir/hmf019_800oldfeds_5EperCG/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_Carbon12_800.xml $scriptdir/hmf019_800oldfeds_5EperCG/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf019_800oldfeds_5EperCG/flux_1th_159cg_798el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf019_800oldfeds_5EperCG/clust_1th_159cg_798el_1urr.xml
#######################
rm *.~ *.pyc
