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
m=heu_water 

# The specific list of materials to generate NJOY inputs for / read NJOY outputs from  
# This is only used in calls to materials.py 
mUNIMPORTANTlist=(H2O )  

# We need PENDF files for all the materials to do the clustering, 
# but we can only do half of the materials at a time due to incompatible 
# thermal treatments  
mIMPORTANTlist=(HMF001 )  

# How many elements to use in the resolved resonance region (RRR). 
g=498 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.0480300881e-03 1.0983670656e-03 1.1511217325e-03 1.2064102108e-03 1.2643541995e-03 1.3250812431e-03 1.3887250119e-03 1.4554255966e-03 1.5253298163e-03 1.5985915417e-03 1.6753720343e-03 1.7558403008e-03 1.8401734651e-03 1.9285571588e-03 2.0211859290e-03 2.1182636673e-03 2.2200040579e-03 2.3266310484e-03 2.4383793426e-03 2.5554949173e-03 2.6782355634e-03 2.8068714534e-03 2.9416857367e-03 3.0829751618e-03 3.2310507304e-03 3.3862383817e-03 3.5488797096e-03 3.7193327147e-03 3.8979725927e-03 4.0851925598e-03 4.2814047184e-03 4.4870409642e-03 4.7025539371e-03 4.9284180170e-03 5.1651303686e-03 5.4132120353e-03 5.6732090863e-03 5.9456938186e-03 6.2312660166e-03 6.5305542724e-03 6.8442173695e-03 7.1729457328e-03 7.5174629484e-03 7.8785273562e-03 8.2569337192e-03 8.6535149733e-03 9.0691440599e-03 9.5047358482e-03 9.9612491485e-03 1.0439688823e-02 1.0941107997e-02 1.1466610378e-02 1.2017352685e-02 1.2594547193e-02 1.3199464404e-02 1.3833435843e-02 1.4497856985e-02 1.5194190333e-02 1.5923968634e-02 1.6688798250e-02 1.7490362701e-02 1.8330426362e-02 1.9210838356e-02 2.0133536615e-02 2.1100552152e-02 2.2114013531e-02 2.3176151550e-02 2.4289304150e-02 2.5455921569e-02 2.6678571725e-02 2.7959945875e-02 2.9302864539e-02 3.0710283705e-02 3.2185301337e-02 3.3731164196e-02 3.5351274985e-02 3.7049199837e-02 3.8828676170e-02 4.0693620907e-02 4.2648139105e-02 4.4696532984e-02 4.6843311401e-02 4.9093199775e-02 5.1451150486e-02 5.3922353777e-02 5.6512249180e-02 5.9226537488e-02 6.2071193302e-02 6.5052478185e-02 6.8176954444e-02 7.1451499573e-02 7.4883321393e-02 7.8479973918e-02 8.2249373980e-02 8.6199818659e-02 9.0340003544e-02 9.4679041874e-02 9.9226484598e-02 1.0399234140e-01 1.0898710272e-01 1.1422176286e-01 1.1970784420e-01 1.2545742250e-01 1.3148315356e-01 1.3779830101e-01 1.4441676555e-01 1.5135311552e-01 1.5862261899e-01 1.6624127736e-01 1.7422586056e-01 1.8259394399e-01 1.9136394721e-01 2.0055517446e-01 2.1018785716e-01 2.2028319846e-01 2.3086341989e-01 2.4195181029e-01 2.5357277705e-01 2.6575189988e-01 2.7851598704e-01 2.9189313444e-01 3.0591278741e-01 3.2060580554e-01 3.3600453063e-01 3.5214285784e-01 3.6905631033e-01 3.8678211743e-01 4.0535929661e-01 4.2482873934e-01 4.4523330112e-01 4.6661789581e-01 4.8902959446e-01 5.1251772897e-01 5.3713400065e-01 5.6293259402e-01 5.8997029612e-01 6.1830662142e-01 6.4800394293e-01 6.7912762940e-01 7.1174618928e-01 7.4593142146e-01 7.8175857336e-01 8.1930650652e-01 8.5865787021e-01 8.9989928338e-01 9.4312152525e-01 9.8841973520e-01 1.0358936222e+00 1.0856476841e+00 1.1377914380e+00 1.1924396611e+00 1.2497126430e+00 1.3097364514e+00 1.3726432086e+00 1.4385713828e+00 1.5076660931e+00 1.5800794284e+00 1.6559707825e+00 1.7355072051e+00 1.8188637691e+00 1.9062239562e+00 1.9977800608e+00 2.0937336131e+00 2.1942958230e+00 2.2996880448e+00 2.4101422642e+00 2.5259016095e+00 2.6472208863e+00 2.7743671388e+00 2.9076202369e+00 3.0472734930e+00 3.1936343074e+00 3.3470248446e+00 3.5077827428e+00 3.6762618570e+00 3.8528330379e+00 4.0378849482e+00 4.2318249180e+00 4.4350798417e+00 4.6480971173e+00 4.8713456313e+00 5.1053167912e+00 5.3505256065e+00 5.6075118229e+00 5.8768411098e+00 6.1591063061e+00 6.4549287247e+00 6.7649595201e+00 7.0898811219e+00 7.4304087368e+00 7.7872919232e+00 8.1613162404e+00 8.5533049785e+00 8.9641209702e+00 9.3946684902e+00 9.8458952456e+00 1.0318794462e+01 1.0814407069e+01 1.1333823993e+01 1.1878188558e+01 1.2448699001e+01 1.3046611111e+01 1.3673240992e+01 1.4329967962e+01 1.5018237586e+01 1.5739564860e+01 1.6495537547e+01 1.7287819669e+01 1.8118155171e+01 1.8988371761e+01 1.9900384929e+01 2.0856202171e+01 2.1857927399e+01 2.2907765578e+01 2.4008027577e+01 2.5161135257e+01 2.6369626800e+01 2.7636162298e+01 2.8963529609e+01 3.0354650488e+01 3.1812587025e+01 3.3340548383e+01 3.4941897859e+01 3.6620160292e+01 3.8379029818e+01 4.0222378002e+01 4.2154262361e+01 4.4178935296e+01 4.6300853451e+01 4.8524687522e+01 5.0855332539e+01 5.3297918642e+01 5.5857822370e+01 5.8540678501e+01 6.1352392447e+01 6.4299153262e+01 6.7387447258e+01 7.0624072288e+01 7.4016152702e+01 7.7571155038e+01 8.1296904450e+01 8.5201601933e+01 8.9293842381e+01 9.3582633498e+01 9.8077415631e+01 1.0278808255e+02 1.0772500321e+02 1.1289904460e+02 1.1832159566e+02 1.2400459233e+02 1.2996054382e+02 1.3620256019e+02 1.4274438116e+02 1.4960040636e+02 1.5678572706e+02 1.6431615935e+02 1.7220827896e+02 1.8047945777e+02 1.8914790203e+02 1.9823269243e+02 2.0775382611e+02 2.1773226069e+02 2.2818996035e+02 2.3914994425e+02 2.5063633715e+02 2.6267442250e+02 2.7529069816e+02 2.8851293465e+02 3.0237023632e+02 3.1689310542e+02 3.3211350919e+02 3.4806495030e+02 3.6478254053e+02 3.8230307809e+02 4.0066512862e+02 4.1990911005e+02 4.4007738160e+02 4.6121433701e+02 4.8336650226e+02 5.0658263795e+02 5.3091384669e+02 5.5641368552e+02 5.8313828386e+02 6.1114646702e+02 6.4049988568e+02 6.7126315162e+02 7.0350397994e+02 7.3729333808e+02 7.7270560207e+02 8.0981872022e+02 8.4871438470e+02 8.8947821138e+02 9.3219992825e+02 9.7697357294e+02 1.0238976997e+03 1.0730755965e+03 1.1246155119e+03 1.1786308940e+03 1.2352406397e+03 1.2945693565e+03 1.3567476367e+03 1.4219123453e+03 1.4902069205e+03 1.5617816902e+03 1.6367942024e+03 1.7154095721e+03 1.7978008450e+03 1.8841493780e+03 1.9746452387e+03 2.0694876235e+03 2.1688852964e+03 2.2730570482e+03 2.3822321786e+03 2.4966510000e+03 2.6165653675e+03 2.7422392326e+03 2.8739492246e+03 3.0119852591e+03 3.1566511765e+03 3.3082654106e+03 3.4671616898e+03 3.6336897712e+03 3.8082162111e+03 3.9911251713e+03 4.1828192649e+03 4.3837204427e+03 4.5942709218e+03 4.8149341590e+03 5.0461958709e+03 5.2885651032e+03 5.5425753511e+03 5.8087857336e+03 6.0877822242e+03 6.3801789408e+03 6.6866194975e+03 7.0077784211e+03 7.3443626361e+03 7.6971130206e+03 8.0668060372e+03 8.4542554419e+03 8.8603140757e+03 9.2858757414e+03 9.7318771715e+03 1.0199300089e+04 1.0689173371e+04 1.1202575310e+04 1.1740635990e+04 1.2304539771e+04 1.2895527900e+04 1.3514901241e+04 1.4164023139e+04 1.4844322418e+04 1.5557296532e+04 1.6304514855e+04 1.7087622140e+04 1.7908342137e+04 1.8768481387e+04 1.9669933202e+04 2.0614681827e+04 2.1604806812e+04 2.2642487586e+04 2.3730008260e+04 2.4869762648e+04 2.6064259539e+04 2.7316128221e+04 2.8628124266e+04 3.0003135597e+04 3.1444188844e+04 3.2954456004e+04 3.4537261430e+04 3.6196089139e+04 3.7934590490e+04 3.9756592214e+04 4.1666104840e+04 4.3667331527e+04 4.5764677308e+04 4.7962758791e+04 5.0266414322e+04 5.2680714631e+04 5.5210973996e+04 5.7862761942e+04 6.0641915496e+04 6.3554552041e+04 6.6607082775e+04 6.9806226830e+04 7.3159026055e+04 7.6672860522e+04 8.0355464769e+04 8.4214944822e+04 8.8259796042e+04 9.2498921822e+04 9.6941653187e+04 1.0159776933e+05 1.0647751914e+05 1.1159164377e+05 1.1695140025e+05 1.2256858631e+05 1.2845556631e+05 1.3462529848e+05 1.4109136343e+05 1.4786799404e+05 1.5497010683e+05 1.6241333471e+05 1.7021406149e+05 1.7838945786e+05 1.8695751924e+05 1.9593710536e+05 2.0534798179e+05 2.1521086345e+05 2.2554746019e+05 2.3638052457e+05 2.4773390200e+05 2.5963258314e+05 2.7210275898e+05 2.8517187847e+05 2.9886870892e+05 3.1322339934e+05 3.2826754681e+05 3.4403426601e+05 3.6055826212e+05 3.7787590721e+05 3.9602532033e+05 4.1504645136e+05 4.3498116899e+05 4.5587335286e+05 4.7776899017e+05 5.0071627686e+05 5.2476572376e+05 5.4997026771e+05 5.7638538812e+05 6.0406922910e+05 6.3308272740e+05 6.6348974657e+05 6.9535721756e+05 7.2875528599e+05 7.6375746659e+05 8.0044080500e+05 8.3888604739e+05 8.7917781816e+05 9.2140480623e+05 9.6565996026e+05 1.0120406932e+06 1.0606490969e+06 1.1115921665e+06 1.1649820362e+06 1.2209362260e+06 1.2795779005e+06 1.3410361398e+06 1.4054462238e+06 1.4729499298e+06 1.5436958447e+06 1.6178396921e+06 1.6955446751e+06 1.7769818352e+06 1.8623304293e+06 1.9517783239e+06 2.0455224088e+06 2.1437690303e+06 2.2467344457e+06 2.3546452991e+06 2.4677391203e+06 2.5862648477e+06 2.7104833762e+06 2.8406681316e+06 2.9771056722e+06 3.1200963200e+06 3.2699548211e+06 3.4270110393e+06 3.5916106815e+06 3.7641160590e+06 3.9449068849e+06 4.1343811102e+06 4.3329557992e+06 4.5410680480e+06 4.7591759465e+06 4.9877595865e+06 5.2273221189e+06 5.4783908609e+06 5.7415184566e+06 6.0172840940e+06 6.3062947792e+06 6.6091866731e+06 6.9266264913e+06 7.2593129720e+06 7.6079784137e+06 7.9733902872e+06 8.3563529252e+06 8.7577092925e+06 9.1783428415e+06 9.6191794568e+06 1.0081189494e+07 1.0565389913e+07 1.1072846522e+07 1.1604676316e+07 1.2162049942e+07 1.2746194272e+07 1.3358395106e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-498-1 
 
# How many Legendre moments to use for the scattering transfer matrices 
L=7 

# Which clustering algorithm to use. Recommended: use 'tmg' for MG XS and 'har' for FEDS XS 
# Use './indicators_clustering.py -h' for more information. 
clusterer=har 

# Which apportioning algorithm to use. Recommended: use 'var' for FEDS and 'L1' or 'max' for MG XS 
# Use './indicators_clustering.py -h' for more information. 
appt=var 
 
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
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_H2O_500.xml $scriptdir/heu_water_500mg/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HMF001_500.xml $scriptdir/heu_water_500mg/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/heu_water_500mg/flux_1th_498cg_498el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/heu_water_500mg/clust_1th_498cg_498el_1urr.xml
#######################
rm *.~ *.pyc
