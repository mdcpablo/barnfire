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
g=298 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.0815520119e-03 1.1697547544e-03 1.2651506080e-03 1.3683261854e-03 1.4799159388e-03 1.6006060610e-03 1.7311387055e-03 1.8723165497e-03 2.0250077313e-03 2.1901511858e-03 2.3687624213e-03 2.5619397624e-03 2.7708711044e-03 2.9968412176e-03 3.2412396482e-03 3.5055692625e-03 3.7914554886e-03 4.1006563116e-03 4.4350730839e-03 4.7967622167e-03 5.1879478259e-03 5.6110354087e-03 6.0686266350e-03 6.5635353464e-03 7.0988048589e-03 7.6777266771e-03 8.3038607343e-03 8.9810572835e-03 9.7134805737e-03 1.0505634457e-02 1.1362390083e-02 1.2289015854e-02 1.3291209821e-02 1.4375134722e-02 1.5547455880e-02 1.6815382186e-02 1.8186710434e-02 1.9669873259e-02 2.1273990997e-02 2.3008927763e-02 2.4885352114e-02 2.6914802645e-02 2.9109758950e-02 3.1483718357e-02 3.4051278931e-02 3.6828229235e-02 3.9831645423e-02 4.3079996243e-02 4.6593256609e-02 5.0393030425e-02 5.4502683441e-02 5.8947486928e-02 6.3754773082e-02 6.8954103094e-02 7.4577448928e-02 8.0659389929e-02 8.7237325455e-02 9.4351704857e-02 1.0204627621e-01 1.1036835534e-01 1.1936911677e-01 1.2910390840e-01 1.3963259187e-01 1.5101991066e-01 1.6333588820e-01 1.7665625850e-01 1.9106293179e-01 2.0664449827e-01 2.2349677285e-01 2.4172338433e-01 2.6143641264e-01 2.8275707806e-01 3.0581648665e-01 3.3075643641e-01 3.5773028924e-01 3.8690391403e-01 4.1845670663e-01 4.5258269293e-01 4.8949172208e-01 5.2941075682e-01 5.7258526915e-01 6.1928074982e-01 6.6978434088e-01 7.2440660141e-01 7.8348341717e-01 8.4737806611e-01 9.1648345222e-01 9.9122452161e-01 1.0720608756e+00 1.1594895968e+00 1.2540483062e+00 1.3563184686e+00 1.4669289684e+00 1.5865599771e+00 1.7159471352e+00 1.8558860763e+00 2.0072373197e+00 2.1709315614e+00 2.3479753979e+00 2.5394575154e+00 2.7465553849e+00 2.9705425022e+00 3.2127962197e+00 3.4748062151e+00 3.7581836529e+00 4.0646710908e+00 4.3961531958e+00 4.7546683335e+00 5.1424211019e+00 5.5617958887e+00 6.0153715330e+00 6.5059371838e+00 7.0365094502e+00 7.6103509525e+00 8.2309903838e+00 8.9022442093e+00 9.6282401348e+00 1.0413442489e+01 1.1262679674e+01 1.2181173861e+01 1.3174573096e+01 1.4248986038e+01 1.5411019516e+01 1.6667819163e+01 1.8027113349e+01 1.9497260711e+01 2.1087301549e+01 2.2807013415e+01 2.4666971244e+01 2.6678612376e+01 2.8854306889e+01 3.1207433667e+01 3.3752462668e+01 3.6505043905e+01 3.9482103679e+01 4.2701948667e+01 4.6184378492e+01 4.9950807475e+01 5.4024396320e+01 5.8430194530e+01 6.3195294448e+01 6.8348997852e+01 7.3922996137e+01 7.9951565196e+01 8.6471776190e+01 9.3523723509e+01 1.0115077132e+02 1.0939982022e+02 1.1832159566e+02 1.2797095984e+02 1.3840724907e+02 1.4969463869e+02 1.6190253765e+02 1.7510601532e+02 1.8938626316e+02 2.0483109394e+02 2.2153548175e+02 2.3960214599e+02 2.5914218305e+02 2.8027574944e+02 3.0313280068e+02 3.2785389044e+02 3.5459103481e+02 3.8350864709e+02 4.1478454884e+02 4.4861106329e+02 4.8519619805e+02 5.2476492416e+02 5.6756055949e+02 6.1384626498e+02 6.6390666287e+02 7.1804958693e+02 7.7660797537e+02 8.3994191820e+02 9.0844087149e+02 9.8252605223e+02 1.0626530285e+03 1.1493145209e+03 1.2430434324e+03 1.3444161251e+03 1.4540559649e+03 1.5726371543e+03 1.7008888782e+03 1.8395997882e+03 1.9896228519e+03 2.1518805984e+03 2.3273707905e+03 2.5171725608e+03 2.7224530474e+03 2.9444745707e+03 3.1846023959e+03 3.4443131283e+03 3.7252037934e+03 4.0290016574e+03 4.3575748484e+03 4.7129438442e+03 5.0972938966e+03 5.5129884690e+03 5.9625837701e+03 6.4488444726e+03 6.9747607136e+03 7.5435664822e+03 8.1587595055e+03 8.8241227576e+03 9.5437477216e+03 1.0322059549e+04 1.1163844272e+04 1.2074278233e+04 1.3058959915e+04 1.4123944369e+04 1.5275780448e+04 1.6521551076e+04 1.7868916806e+04 1.9326162921e+04 2.0902250389e+04 2.2606870961e+04 2.4450506771e+04 2.6444494789e+04 2.8601096542e+04 3.0933573507e+04 3.3456268661e+04 3.6184694681e+04 3.9135629331e+04 4.2327218639e+04 4.5779088476e+04 4.9512465243e+04 5.3550306397e+04 5.7917441620e+04 6.2640725507e+04 6.7749202698e+04 7.3274286481e+04 7.9249951963e+04 8.5712944986e+04 9.2703008094e+04 1.0026312491e+05 1.0843978446e+05 1.1728326706e+05 1.2684795344e+05 1.3719265925e+05 1.4838099663e+05 1.6048176543e+05 1.7356937627e+05 1.8772430810e+05 2.0303360310e+05 2.1959140192e+05 2.3749952253e+05 2.5686808642e+05 2.7781619565e+05 3.0047266534e+05 3.2497681571e+05 3.5147932885e+05 3.8014317525e+05 4.1114461599e+05 4.4467428660e+05 4.8093836930e+05 5.2015986091e+05 5.6257994406e+05 6.0845947034e+05 6.5808056429e+05 7.1174835829e+05 7.6979286886e+05 8.3257102604e+05 9.0046886825e+05 9.7390391609e+05 1.0533277398e+06 1.1392287362e+06 1.2321351316e+06 1.3326182305e+06 1.4412959282e+06 1.5588365109e+06 1.6859627646e+06 1.8234564200e+06 1.9721629596e+06 2.1329968167e+06 2.3069469984e+06 2.4950831674e+06 2.6985622195e+06 2.9186353977e+06 3.1566559863e+06 3.4140876328e+06 3.6925133480e+06 3.9936452404e+06 4.3193350445e+06 4.6715855074e+06 5.0525627042e+06 5.4646093578e+06 5.9102592451e+06 6.3922527772e+06 6.9135538516e+06 7.4773680775e+06 8.0871624877e+06 8.7466868590e+06 9.4599967696e+06 1.0231478539e+07 1.1065876198e+07 1.1968320665e+07 1.2944361294e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-298-1 
 
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
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HMF001_300.xml $scriptdir/hmf001_300mg/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf001_300mg/flux_1th_298cg_298el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf001_300mg/clust_1th_298cg_298el_1urr.xml
#######################
rm *.~ *.pyc
