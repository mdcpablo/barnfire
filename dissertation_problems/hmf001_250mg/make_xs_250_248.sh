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
g=248 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.0987826839e-03 1.2073233864e-03 1.3265860308e-03 1.4576297593e-03 1.6016183391e-03 1.7598304971e-03 1.9336712768e-03 2.1246845153e-03 2.3345665541e-03 2.5651813040e-03 2.8185767978e-03 3.0970033786e-03 3.4029336844e-03 3.7390846068e-03 4.1084414195e-03 4.5142842894e-03 4.9602174073e-03 5.4502009955e-03 5.9885864775e-03 6.5801551223e-03 7.2301605057e-03 7.9443751653e-03 8.7291418659e-03 9.5914299273e-03 1.0538897118e-02 1.1579957660e-02 1.2723856957e-02 1.3980753697e-02 1.5361810069e-02 1.6879290897e-02 1.8546672554e-02 2.0378762646e-02 2.2391831514e-02 2.4603756728e-02 2.7034181851e-02 2.9704690891e-02 3.2638999981e-02 3.5863167998e-02 3.9405827985e-02 4.3298441434e-02 4.7575577687e-02 5.2275220938e-02 5.7439107562e-02 6.3113096767e-02 6.9347577853e-02 7.6197917714e-02 8.3724952532e-02 9.1995528051e-02 1.0108309322e-01 1.1106835246e-01 1.2203998241e-01 1.3409541941e-01 1.4734172484e-01 1.6189653586e-01 1.7788911019e-01 1.9546147392e-01 2.1476968291e-01 2.3598520861e-01 2.5929646087e-01 2.8491046119e-01 3.1305468121e-01 3.4397906283e-01 3.7795823785e-01 4.1529396698e-01 4.5631781963e-01 5.0139411856e-01 5.5092317527e-01 6.0534484513e-01 6.6514243361e-01 7.3084698836e-01 8.0304201538e-01 8.8236866092e-01 9.6953140542e-01 1.0653043198e+00 1.1705379396e+00 1.2861668189e+00 1.4132178291e+00 1.5528192792e+00 1.7062109352e+00 1.8747550306e+00 2.0599483642e+00 2.2634355922e+00 2.4870238348e+00 2.7326987241e+00 3.0026420383e+00 3.2992510775e+00 3.6251599538e+00 3.9832629835e+00 4.3767403916e+00 4.8090865541e+00 5.2841410309e+00 5.8061226640e+00 6.3796670436e+00 7.0098676765e+00 7.7023212192e+00 8.4631771813e+00 9.2991925374e+00 1.0217791734e+01 1.1227132625e+01 1.2336178918e+01 1.3554779780e+01 1.4893757306e+01 1.6365002626e+01 1.7981581507e+01 1.9757850389e+01 2.1709583878e+01 2.3854114839e+01 2.6210488325e+01 2.8799630707e+01 3.1644535523e+01 3.4770467672e+01 3.8205187788e+01 4.1979198776e+01 4.6126016698e+01 5.0682468424e+01 5.5689018681e+01 6.1190129409e+01 6.7234654619e+01 7.3876274251e+01 8.1173970897e+01 8.9192553603e+01 9.8003233430e+01 1.0768425586e+02 1.1832159566e+02 1.3000972044e+02 1.4285242956e+02 1.5696377595e+02 1.7246907901e+02 1.8950603752e+02 2.0822595252e+02 2.2879507096e+02 2.5139606213e+02 2.7622963986e+02 3.0351634505e+02 3.3349850422e+02 3.6644238153e+02 4.0264054347e+02 4.4241445699e+02 4.8611734444e+02 5.3413732040e+02 5.8690083847e+02 6.4487647846e+02 7.0857910777e+02 7.7857445378e+02 8.5548412792e+02 9.3999114609e+02 1.0328459943e+03 1.1348732937e+03 1.2469791235e+03 1.3701590681e+03 1.5055070581e+03 1.6542250859e+03 1.8176338797e+03 1.9971846326e+03 2.1944718908e+03 2.4112477139e+03 2.6494372346e+03 2.9111557553e+03 3.1987275340e+03 3.5147064249e+03 3.8618985585e+03 4.2433872630e+03 4.6625604456e+03 5.1231406802e+03 5.6292182664e+03 6.1852875549e+03 6.7962868602e+03 7.4676423166e+03 8.2053160669e+03 9.0158592101e+03 9.9064699803e+03 1.0885057673e+04 1.1960312884e+04 1.3141784690e+04 1.4439965453e+04 1.5866383996e+04 1.7433707990e+04 1.9155856455e+04 2.1048123368e+04 2.3127313485e+04 2.5411891582e+04 2.7922146435e+04 3.0680370999e+04 3.3711060389e+04 3.7041129411e+04 4.0700151588e+04 4.4720621796e+04 4.9138244842e+04 5.3992252548e+04 5.9325752163e+04 6.5186109185e+04 7.1625368002e+04 7.8700714087e+04 8.6474981848e+04 9.5017212643e+04 1.0440326792e+05 1.1471650293e+05 1.2604850698e+05 1.3849991680e+05 1.5218131029e+05 1.6721418856e+05 1.8373205489e+05 2.0188160039e+05 2.2182400670e+05 2.4373637743e+05 2.6781331095e+05 2.9426862858e+05 3.2333727350e+05 3.5527739717e+05 3.9037265199e+05 4.2893471026e+05 4.7130603215e+05 5.1786290693e+05 5.6901879476e+05 6.2522799848e+05 6.8698969821e+05 7.5485238440e+05 8.2941872886e+05 9.1135093695e+05 1.0013766285e+06 1.1002952994e+06 1.2089854221e+06 1.3284122469e+06 1.4596363739e+06 1.6038231724e+06 1.7622531299e+06 1.9363332237e+06 2.1276094164e+06 2.3377803849e+06 2.5687126056e+06 2.8224569309e+06 3.1012668016e+06 3.4076182597e+06 3.7442319371e+06 4.1140972169e+06 4.5204987817e+06 4.9670457838e+06 5.4577038973e+06 5.9968305361e+06 6.5892135512e+06 7.2401137504e+06 7.9553116183e+06 8.7411586510e+06 9.6046337627e+06 1.0553405263e+07 1.1595898959e+07 1.2741372981e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-248-1 
 
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
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HMF001_250.xml $scriptdir/hmf001_250mg/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf001_250mg/flux_1th_248cg_248el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf001_250mg/clust_1th_248cg_248el_1urr.xml
#######################
rm *.~ *.pyc
