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
g=398 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.0604563183e-03 1.1245676030e-03 1.1925548199e-03 1.2646522937e-03 1.3411085153e-03 1.4221869985e-03 1.5081671884e-03 1.5993454240e-03 1.6960359600e-03 1.7985720498e-03 1.9073070941e-03 2.0226158588e-03 2.1448957669e-03 2.2745682681e-03 2.4120802913e-03 2.5579057851e-03 2.7125473514e-03 2.8765379775e-03 3.0504428730e-03 3.2348614182e-03 3.4304292297e-03 3.6378203511e-03 3.8577495761e-03 4.0909749123e-03 4.3383001937e-03 4.6005778511e-03 4.8787118499e-03 5.1736608064e-03 5.4864412908e-03 5.8181313317e-03 6.1698741313e-03 6.5428820056e-03 6.9384405626e-03 7.3579131337e-03 7.8027454720e-03 8.2744707357e-03 8.7747147722e-03 9.3052017213e-03 9.8677599583e-03 1.0464328395e-02 1.1096963163e-02 1.1767844700e-02 1.2479285265e-02 1.3233736907e-02 1.4033799917e-02 1.4882231792e-02 1.5781956734e-02 1.6736075733e-02 1.7747877255e-02 1.8820848571e-02 1.9958687783e-02 2.1165316564e-02 2.2444893679e-02 2.3801829315e-02 2.5240800283e-02 2.6766766139e-02 2.8384986272e-02 3.0101038037e-02 3.1920835973e-02 3.3850652193e-02 3.5897137996e-02 3.8067346796e-02 4.0368758430e-02 4.2809304939e-02 4.5397397904e-02 4.8141957441e-02 5.1052442943e-02 5.4138885682e-02 5.7411923387e-02 6.0882836900e-02 6.4563589066e-02 6.8466865956e-02 7.2606120597e-02 7.6995619333e-02 8.1650491002e-02 8.6586779074e-02 9.1821496949e-02 9.7372686594e-02 1.0325948073e-01 1.0950216876e-01 1.1612226673e-01 1.2314259144e-01 1.3058733915e-01 1.3848216889e-01 1.4685429097e-01 1.5573256072e-01 1.6514757798e-01 1.7513179252e-01 1.8571961591e-01 1.9694754012e-01 2.0885426329e-01 2.2148082311e-01 2.3487073824e-01 2.4907015835e-01 2.6412802312e-01 2.8009623095e-01 2.9702981784e-01 3.1498714705e-01 3.3403011027e-01 3.5422434093e-01 3.7563944043e-01 3.9834921800e-01 4.2243194512e-01 4.4797062524e-01 4.7505327995e-01 5.0377325224e-01 5.3422952832e-01 5.6652707872e-01 6.0077722011e-01 6.3709799895e-01 6.7561459835e-01 7.1645976955e-01 7.5977428942e-01 8.0570744568e-01 8.5441755146e-01 9.0607249090e-01 9.6085029780e-01 1.0189397692e+00 1.0805411162e+00 1.1458666539e+00 1.2151415330e+00 1.2886045163e+00 1.3665088011e+00 1.4491228921e+00 1.5367315269e+00 1.6296366572e+00 1.7281584896e+00 1.8326365893e+00 1.9434310503e+00 2.0609237364e+00 2.1855195978e+00 2.3176480662e+00 2.4577645354e+00 2.6063519304e+00 2.7639223723e+00 2.9310189429e+00 3.1082175570e+00 3.2961289470e+00 3.4954007677e+00 3.7067198291e+00 3.9308144628e+00 4.1684570331e+00 4.4204665983e+00 4.6877117339e+00 4.9711135265e+00 5.2716487481e+00 5.5903532227e+00 5.9283253965e+00 6.2867301235e+00 6.6668026809e+00 7.0698530257e+00 7.4972703104e+00 7.9505276706e+00 8.4311873020e+00 8.9409058450e+00 9.4814400946e+00 1.0054653055e+01 1.0662520360e+01 1.1307137085e+01 1.1990724963e+01 1.2715640048e+01 1.3484380830e+01 1.4299596849e+01 1.5164097828e+01 1.6080863353e+01 1.7053053146e+01 1.8084017954e+01 1.9177311100e+01 2.0336700723e+01 2.1566182775e+01 2.2869994785e+01 2.4252630469e+01 2.5718855216e+01 2.7273722513e+01 2.8922591362e+01 3.0671144751e+01 3.2525409240e+01 3.4491775734e+01 3.6577021506e+01 3.8788333560e+01 4.1133333399e+01 4.3620103295e+01 4.6257214144e+01 4.9053755005e+01 5.2019364431e+01 5.5164263684e+01 5.8499291967e+01 6.2035943782e+01 6.5786408544e+01 6.9763612598e+01 7.3981263766e+01 7.8453898595e+01 8.3196932459e+01 8.8226712688e+01 9.3560574912e+01 9.9216902808e+01 1.0521519146e+02 1.1157611457e+02 1.1832159566e+02 1.2547488371e+02 1.3306063322e+02 1.4110498921e+02 1.4963567735e+02 1.5868209948e+02 1.6827543500e+02 1.7844874825e+02 1.8923710258e+02 2.0067768108e+02 2.1280991484e+02 2.2567561879e+02 2.3931913583e+02 2.5378748967e+02 2.6913054693e+02 2.8540118893e+02 3.0265549405e+02 3.2095293093e+02 3.4035656347e+02 3.6093326821e+02 3.8275396475e+02 4.0589386027e+02 4.3043270867e+02 4.5645508551e+02 4.8405067944e+02 5.1331460138e+02 5.4434771231e+02 5.7725697086e+02 6.1215580202e+02 6.4916448803e+02 6.8841058294e+02 7.3002935225e+02 7.7416423913e+02 8.2096735877e+02 8.7060002272e+02 9.2323329479e+02 9.7904858071e+02 1.0382382533e+03 1.1010063156e+03 1.1675691039e+03 1.2381560332e+03 1.3130103885e+03 1.3923901624e+03 1.4765689453e+03 1.5658368674e+03 1.6605015994e+03 1.7608894126e+03 1.8673463034e+03 1.9802391859e+03 2.0999571564e+03 2.2269128346e+03 2.3615437858e+03 2.5043140285e+03 2.6557156345e+03 2.8162704242e+03 2.9865317653e+03 3.1670864803e+03 3.3585568686e+03 3.5616028516e+03 3.7769242472e+03 4.0052631817e+03 4.2474066474e+03 4.5041892155e+03 4.7764959124e+03 5.0652652695e+03 5.3714925589e+03 5.6962332227e+03 6.0406065114e+03 6.4057993413e+03 6.7930703852e+03 7.2037544105e+03 7.6392668800e+03 8.1011088299e+03 8.5908720438e+03 9.1102445385e+03 9.6610163819e+03 1.0245085863e+04 1.0864466035e+04 1.1521291652e+04 1.2217826527e+04 1.2956471336e+04 1.3739771891e+04 1.4570427914e+04 1.5451302341e+04 1.6385431193e+04 1.7376034037e+04 1.8426525081e+04 1.9540524946e+04 2.0721873142e+04 2.1974641300e+04 2.3303147209e+04 2.4711969694e+04 2.6205964399e+04 2.7790280523e+04 2.9470378568e+04 3.1252049155e+04 3.3141432985e+04 3.5145042006e+04 3.7269781852e+04 3.9522975646e+04 4.1912389242e+04 4.4446257986e+04 4.7133315105e+04 4.9982821805e+04 5.3004599189e+04 5.6209062108e+04 5.9607255057e+04 6.3210890241e+04 6.7032387940e+04 7.1084919321e+04 7.5382451829e+04 7.9939797330e+04 8.4772663161e+04 8.9897706267e+04 9.5332590610e+04 1.0109604805e+05 1.0720794291e+05 1.1368934043e+05 1.2056257938e+05 1.2785134905e+05 1.3558077090e+05 1.4377748514e+05 1.5246974255e+05 1.6168750183e+05 1.7146253290e+05 1.8182852637e+05 1.9282120963e+05 2.0447847005e+05 2.1684048552e+05 2.2994986293e+05 2.4385178503e+05 2.5859416616e+05 2.7422781738e+05 2.9080662159e+05 3.0838771926e+05 3.2703170537e+05 3.4680283824e+05 3.6776926101e+05 3.9000323651e+05 4.1358139631e+05 4.3858500485e+05 4.6510023949e+05 4.9321848761e+05 5.2303666148e+05 5.5465753236e+05 5.8819008467e+05 6.2374989165e+05 6.6145951363e+05 7.0144892051e+05 7.4385593971e+05 7.8882673116e+05 8.3651629109e+05 8.8708898624e+05 9.4071912034e+05 9.9759153490e+05 1.0579022462e+06 1.1218591212e+06 1.1896825933e+06 1.2616064228e+06 1.3378785022e+06 1.4187617108e+06 1.5045348203e+06 1.5954934563e+06 1.6919511165e+06 1.7942402518e+06 1.9027134115e+06 2.0177444591e+06 2.1397298603e+06 2.2690900498e+06 2.4062708801e+06 2.5517451583e+06 2.7060142758e+06 2.8696099361e+06 3.0430959878e+06 3.2270703674e+06 3.4221671606e+06 3.6290587877e+06 3.8484583209e+06 4.0811219420e+06 4.3278515491e+06 4.5894975199e+06 4.8669616427e+06 5.1612002248e+06 5.4732273884e+06 5.8041185654e+06 6.1550142048e+06 6.5271237026e+06 6.9217295706e+06 7.3401918566e+06 7.7839528318e+06 8.2545419617e+06 8.7535811778e+06 9.2827904677e+06 9.8439938028e+06 1.0439125425e+07 1.1070236515e+07 1.1739502257e+07 1.2449229342e+07 1.3201863913e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-398-1 
 
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
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_UnpolutedAir_400.xml $scriptdir/hmf019_400mg/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HEU19_400.xml $scriptdir/hmf019_400mg/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_Carbon12_400.xml $scriptdir/hmf019_400mg/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf019_400mg/flux_1th_398cg_398el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf019_400mg/clust_1th_398cg_398el_1urr.xml
#######################
rm *.~ *.pyc
