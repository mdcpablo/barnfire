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
c=(1.0000000000e-03 1.0398405978e-03 1.0812684688e-03 1.1243468510e-03 1.1691415016e-03 1.2157207979e-03 1.2641558413e-03 1.3145205657e-03 1.3668918508e-03 1.4213496393e-03 1.4779770585e-03 1.5368605481e-03 1.5980899910e-03 1.6617588516e-03 1.7279643176e-03 1.7968074489e-03 1.8683933318e-03 1.9428312390e-03 2.0202347970e-03 2.1007221590e-03 2.1844161856e-03 2.2714446322e-03 2.3619403442e-03 2.4560414594e-03 2.5538916194e-03 2.6556401882e-03 2.7614424808e-03 2.8714599999e-03 2.9858606828e-03 3.1048191573e-03 3.2285170086e-03 3.3571430562e-03 3.4908936424e-03 3.6299729319e-03 3.7745932234e-03 3.9249752738e-03 4.0813486350e-03 4.2439520044e-03 4.4130335892e-03 4.5888514855e-03 4.7716740718e-03 4.9617804192e-03 5.1594607172e-03 5.3650167164e-03 5.5787621895e-03 5.8010234101e-03 6.0321396505e-03 6.2724637001e-03 6.5223624035e-03 6.7822172206e-03 7.0524248090e-03 7.3333976292e-03 7.6255645745e-03 7.9293716256e-03 8.2452825312e-03 8.5737795161e-03 8.9153640173e-03 9.2705574492e-03 9.6399019998e-03 1.0023961458e-02 1.0423322075e-02 1.0838593457e-02 1.1270409500e-02 1.1719429351e-02 1.2186338422e-02 1.2671849430e-02 1.3176703486e-02 1.3701671230e-02 1.4247554002e-02 1.4815185071e-02 1.5405430900e-02 1.6019192476e-02 1.6657406681e-02 1.7321047720e-02 1.8011128616e-02 1.8728702747e-02 1.9474865460e-02 2.0250755741e-02 2.1057557956e-02 2.1896503653e-02 2.2768873447e-02 2.3675998976e-02 2.4619264929e-02 2.5600111161e-02 2.6620034893e-02 2.7680592996e-02 2.8783404368e-02 2.9930152404e-02 3.1122587567e-02 3.2362530061e-02 3.3651872604e-02 3.4992583325e-02 3.6386708763e-02 3.7836376991e-02 3.9343800869e-02 4.0911281414e-02 4.2541211322e-02 4.4236078612e-02 4.5998470427e-02 4.7831076986e-02 4.9736695686e-02 5.1718235374e-02 5.3778720787e-02 5.5921297172e-02 5.8149235080e-02 6.0465935366e-02 6.2874934377e-02 6.5379909348e-02 6.7984684019e-02 7.0693234471e-02 7.3509695191e-02 7.6438365391e-02 7.9483715562e-02 8.2650394304e-02 8.5943235420e-02 8.9367265294e-02 9.2927710566e-02 9.6630006106e-02 1.0047980331e-01 1.0448297874e-01 1.0864564307e-01 1.1297415044e-01 1.1747510813e-01 1.2215538666e-01 1.2702213029e-01 1.3208276789e-01 1.3734502432e-01 1.4281693219e-01 1.4850684414e-01 1.5442344559e-01 1.6057576797e-01 1.6697320256e-01 1.7362551476e-01 1.8054285906e-01 1.8773579449e-01 1.9521530077e-01 2.0299279505e-01 2.1108014935e-01 2.1948970868e-01 2.2823430988e-01 2.3732730122e-01 2.4678256277e-01 2.5661452760e-01 2.6683820378e-01 2.7746919733e-01 2.8852373601e-01 3.0001869413e-01 3.1197161825e-01 3.2440075401e-01 3.3732507398e-01 3.5076430657e-01 3.6473896623e-01 3.7927038468e-01 3.9438074352e-01 4.1009310810e-01 4.2643146267e-01 4.4342074706e-01 4.6108689469e-01 4.7945687221e-01 4.9855872061e-01 5.1842159807e-01 5.3907582444e-01 5.6055292753e-01 5.8288569126e-01 6.0610820564e-01 6.3025591887e-01 6.5536569143e-01 6.8147585235e-01 7.0862625768e-01 7.3685835139e-01 7.6621522859e-01 7.9674170133e-01 8.2848436699e-01 8.6149167943e-01 8.9581402292e-01 9.3150378910e-01 9.6861545690e-01 1.0072056757e+00 1.0473333519e+00 1.0890597388e+00 1.1324485298e+00 1.1775659562e+00 1.2244808878e+00 1.2732649383e+00 1.3239925746e+00 1.3767412302e+00 1.4315914238e+00 1.4886268819e+00 1.5479346668e+00 1.6096053093e+00 1.6737329470e+00 1.7404154681e+00 1.8097546608e+00 1.8818563683e+00 1.9568306509e+00 2.0347919538e+00 2.1158592816e+00 2.2001563802e+00 2.2878119257e+00 2.3789597204e+00 2.4737388978e+00 2.5722941342e+00 2.6747758702e+00 2.7813405398e+00 2.8921508095e+00 3.0073758267e+00 3.1271914774e+00 3.2517806552e+00 3.3813335404e+00 3.5160478899e+00 3.6561293397e+00 3.8017917182e+00 3.9532573729e+00 4.1107575098e+00 4.2745325463e+00 4.4448324782e+00 4.6219172612e+00 4.8060572078e+00 4.9975333999e+00 5.1966381180e+00 5.4036752871e+00 5.6189609408e+00 5.8428237036e+00 6.0756052927e+00 6.3176610395e+00 6.5693604319e+00 6.8310876785e+00 7.1032422952e+00 7.3862397144e+00 7.6805119200e+00 7.9865081062e+00 8.3046953633e+00 8.6355593910e+00 8.9796052394e+00 9.3373580800e+00 9.7093640076e+00 1.0096190874e+01 1.0498429154e+01 1.0916692847e+01 1.1351620416e+01 1.1803875759e+01 1.2274149225e+01 1.2763158668e+01 1.3271650539e+01 1.3800401030e+01 1.4350217256e+01 1.4921938490e+01 1.5516437440e+01 1.6134621583e+01 1.6777434552e+01 1.7445857573e+01 1.8140910968e+01 1.8863655705e+01 1.9615195025e+01 2.0396676120e+01 2.1209291890e+01 2.2054282757e+01 2.2932938566e+01 2.3846600547e+01 2.4796663368e+01 2.5784577260e+01 2.6811850232e+01 2.7880050373e+01 2.8990808246e+01 3.0145819376e+01 3.1346846841e+01 3.2595723958e+01 3.3894357086e+01 3.5244728533e+01 3.6648899587e+01 3.8109013655e+01 3.9627299539e+01 4.1206074842e+01 4.2847749496e+01 4.4554829449e+01 4.6329920489e+01 4.8175732216e+01 5.0095082186e+01 5.2090900207e+01 5.4166232810e+01 5.6324247905e+01 5.8568239611e+01 6.0901633289e+01 6.3327990765e+01 6.5851015773e+01 6.8474559606e+01 7.1202626994e+01 7.4039382217e+01 7.6989155464e+01 8.0056449441e+01 8.3245946243e+01 8.6562514505e+01 9.0011216828e+01 9.3597317514e+01 9.7326290595e+01 1.0120382819e+02 1.0523584921e+02 1.0942850835e+02 1.1378820553e+02 1.1832159566e+02 1.2303559876e+02 1.2793741057e+02 1.3303451348e+02 1.3833468803e+02 1.4384602469e+02 1.4957693630e+02 1.5553617086e+02 1.6173282489e+02 1.6817635731e+02 1.7487660392e+02 1.8184379236e+02 1.8908855775e+02 1.9662195892e+02 2.0445549530e+02 2.1260112446e+02 2.2107128034e+02 2.2987889231e+02 2.3903740479e+02 2.4856079789e+02 2.5846360867e+02 2.6876095334e+02 2.7946855038e+02 2.9060274449e+02 3.0218053155e+02 3.1421958457e+02 3.2673828065e+02 3.3975572907e+02 3.5329180042e+02 3.6736715694e+02 3.8200328408e+02 3.9722252327e+02 4.1304810605e+02 4.2950418951e+02 4.4661589317e+02 4.6440933733e+02 4.8291168295e+02 5.0215117308e+02 5.2215717599e+02 5.4296023002e+02 5.6459209015e+02 5.8708577653e+02 6.1047562482e+02 6.3479733864e+02 6.6008804409e+02 6.8638634635e+02 7.1373238870e+02 7.4216791372e+02 7.7173632706e+02 8.0248276367e+02 8.3445415668e+02 8.6769930911e+02 9.0226896828e+02 9.3821590334e+02 9.7559498578e+02 1.0144632732e+03 1.0548800964e+03 1.0969071501e+03 1.1406085866e+03 1.1860511146e+03 1.2333041000e+03 1.2824396726e+03 1.3335328357e+03 1.3866615811e+03 1.4419070074e+03 1.4993534445e+03 1.5590885820e+03 1.6212036032e+03 1.6857933238e+03 1.7529563376e+03 1.8227951660e+03 1.8954164150e+03 1.9709309380e+03 2.0494540048e+03 2.1311054775e+03 2.2160099937e+03 2.3042971565e+03 2.3961017327e+03 2.4915638581e+03 2.5908292516e+03 2.6940494377e+03 2.8013819778e+03 2.9129907104e+03 3.0290460016e+03 3.1497250051e+03 3.2752119321e+03 3.4056983334e+03 3.5413833908e+03 3.6824742221e+03 3.8291861964e+03 3.9817432635e+03 4.1403782954e+03 4.3053334417e+03 4.4768604997e+03 4.6552212982e+03 4.8406880975e+03 5.0335440050e+03 5.2340834072e+03 5.4426124190e+03 5.6594493512e+03 5.8849251965e+03 6.1193841343e+03 6.3631840562e+03 6.6166971128e+03 6.8803102812e+03 7.1544259557e+03 7.4394625626e+03 7.7358551983e+03 8.0440562937e+03 8.3645363051e+03 8.6977844317e+03 9.0443093628e+03 9.4046400544e+03 9.7793265361e+03 1.0168940751e+04 1.0574077430e+04 1.0995354995e+04 1.1433416511e+04 1.1888930660e+04 1.2362592764e+04 1.2855125850e+04 1.3367281749e+04 1.3899842244e+04 1.4453620268e+04 1.5029461140e+04 1.5628243856e+04 1.6250882434e+04 1.6898327304e+04 1.7571566766e+04 1.8271628490e+04 1.8999581091e+04 1.9756535759e+04 2.0543647954e+04 2.1362119169e+04 2.2213198767e+04 2.3098185885e+04 2.4018431418e+04 2.4975340084e+04 2.5970372562e+04 2.7005047730e+04 2.8080944975e+04 2.9199706609e+04 3.0363040375e+04 3.1572722054e+04 3.2830598175e+04 3.4138588831e+04 3.5498690618e+04 3.6912979673e+04 3.8383614849e+04 3.9912841010e+04 4.1502992455e+04 4.3156496484e+04 4.4875877102e+04 4.6663758872e+04 4.8522870920e+04 5.0456051104e+04 5.2466250342e+04 5.4556537119e+04 5.6730102171e+04 5.8990263353e+04 6.1340470709e+04 6.3784311730e+04 6.6325516839e+04 6.8967965078e+04 7.1715690035e+04 7.4572885996e+04 7.7543914353e+04 8.0633310255e+04 8.3845789537e+04 8.7186255914e+04 9.0659808468e+04 9.4271749432e+04 9.8027592284e+04 1.0193307016e+05 1.0599414461e+05 1.1021701469e+05 1.1460812644e+05 1.1917418271e+05 1.2392215339e+05 1.2885928606e+05 1.3399311705e+05 1.3933148293e+05 1.4488253250e+05 1.5065473920e+05 1.5665691407e+05 1.6289821917e+05 1.6938818160e+05 1.7613670802e+05 1.8315409976e+05 1.9045106858e+05 1.9803875300e+05 2.0592873530e+05 2.1413305922e+05 2.2266424830e+05 2.3153532506e+05 2.4075983082e+05 2.5035184640e+05 2.6032601362e+05 2.7069755762e+05 2.8148231013e+05 2.9269673363e+05 3.0435794647e+05 3.1648374900e+05 3.2909265075e+05 3.4220389868e+05 3.5583750657e+05 3.7001428554e+05 3.8475587587e+05 4.0008477996e+05 4.1602439676e+05 4.3259905742e+05 4.4983406247e+05 4.6775572042e+05 4.8639138794e+05 5.0576951159e+05 5.2591967127e+05 5.4687262536e+05 5.6866035767e+05 5.9131612626e+05 6.1487451420e+05 6.3937148241e+05 6.6484442448e+05 6.9133222378e+05 7.1887531285e+05 7.4751573504e+05 7.7729720878e+05 8.0826519423e+05 8.4046696274e+05 8.7395166895e+05 9.0877042588e+05 9.4497638289e+05 9.8262480688e+05 1.0217731666e+06 1.0624812203e+06 1.1048111073e+06 1.1488274422e+06 1.1945974143e+06 1.2421908894e+06 1.2916805170e+06 1.3431418409e+06 1.3966534148e+06 1.4522969217e+06 1.5101572992e+06 1.5703228688e+06 1.6328854706e+06 1.6979406039e+06 1.7655875725e+06 1.8359296368e+06 1.9090741711e+06 1.9851328273e+06 2.0642217058e+06 2.1464615325e+06 2.2319778431e+06 2.3209011746e+06 2.4133672648e+06 2.5095172593e+06 2.6094979270e+06 2.7134618844e+06 2.8215678279e+06 2.9339807768e+06 3.0508723249e+06 3.1724209021e+06 3.2988120472e+06 3.4302386912e+06 3.5669014512e+06 3.7090089372e+06 3.8567780705e+06 4.0104344143e+06 4.1702125187e+06 4.3363562784e+06 4.5091193047e+06 4.6887653133e+06 4.8755685262e+06 5.0698140909e+06 5.2717985149e+06 5.4818301191e+06 5.7002295080e+06 5.9273300591e+06 6.1634784319e+06 6.4090350971e+06 6.6643748866e+06 6.9298875659e+06 7.2059784291e+06 7.4930689174e+06 7.7915972623e+06 8.1020191549e+06 8.4248084413e+06 8.7604578458e+06 9.1094797232e+06 9.4724068409e+06 9.8497931919e+06 1.0242214841e+07 1.0650270803e+07 1.1074583958e+07 1.1515802003e+07 1.1974598439e+07 1.2451673599e+07 1.2947755718e+07 1.3463602046e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-598-1 
 
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
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_UnpolutedAir_600.xml $scriptdir/hmf085_3_600mg/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HEU85_600.xml $scriptdir/hmf085_3_600mg/. 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_SteelyKnife_600.xml $scriptdir/hmf085_3_600mg/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf085_3_600mg/flux_1th_598cg_598el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf085_3_600mg/clust_1th_598cg_598el_1urr.xml
#######################
rm *.~ *.pyc
