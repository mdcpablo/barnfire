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
g=998 

# These are the coarse-group boundaries in eV. c also specifies the extent of the RRR 
c=(1.0000000000e-03 1.0236852860e-03 1.0479315647e-03 1.0727521235e-03 1.0981605643e-03 1.1241708113e-03 1.1507971184e-03 1.1780540772e-03 1.2059566249e-03 1.2345200524e-03 1.2637600129e-03 1.2936925302e-03 1.3243340077e-03 1.3557012374e-03 1.3878114089e-03 1.4206821190e-03 1.4543313812e-03 1.4887776359e-03 1.5240397599e-03 1.5601370774e-03 1.5970893702e-03 1.6349168887e-03 1.6736403627e-03 1.7132810133e-03 1.7538605640e-03 1.7954012530e-03 1.8379258451e-03 1.8814576443e-03 1.9260205066e-03 1.9716388531e-03 2.0183376831e-03 2.0661425883e-03 2.1150797664e-03 2.1651760355e-03 2.2164588490e-03 2.2689563107e-03 2.3226971897e-03 2.3777109369e-03 2.4340277003e-03 2.4916783424e-03 2.5506944565e-03 2.6111083841e-03 2.6729532329e-03 2.7362628945e-03 2.8010720636e-03 2.8674162565e-03 2.9353318305e-03 3.0048560043e-03 3.0760268780e-03 3.1488834542e-03 3.2234656593e-03 3.2998143652e-03 3.3779714121e-03 3.4579796309e-03 3.5398828673e-03 3.6237260053e-03 3.7095549920e-03 3.7974168627e-03 3.8873597670e-03 3.9794329948e-03 4.0736870032e-03 4.1701734448e-03 4.2689451953e-03 4.3700563830e-03 4.4735624181e-03 4.5795200232e-03 4.6879872645e-03 4.7990235835e-03 4.9126898294e-03 5.0290482928e-03 5.1481627397e-03 5.2700984464e-03 5.3949222351e-03 5.5227025110e-03 5.6535092993e-03 5.7874142837e-03 5.9244908460e-03 6.0648141058e-03 6.2084609622e-03 6.3555101355e-03 6.5060422105e-03 6.6601396807e-03 6.8178869935e-03 6.9793705966e-03 7.1446789850e-03 7.3139027499e-03 7.4871346280e-03 7.6644695527e-03 7.8460047058e-03 8.0318395709e-03 8.2220759879e-03 8.4168182088e-03 8.6161729550e-03 8.8202494753e-03 9.0291596064e-03 9.2430178336e-03 9.4619413541e-03 9.6860501408e-03 9.9154670082e-03 1.0150317680e-02 1.0390730857e-02 1.0636838288e-02 1.0888774845e-02 1.1146678591e-02 1.1410690861e-02 1.1680956337e-02 1.1957623128e-02 1.2240842851e-02 1.2530770714e-02 1.2827565602e-02 1.3131390161e-02 1.3442410892e-02 1.3760798238e-02 1.4086726680e-02 1.4420374829e-02 1.4761925531e-02 1.5111565958e-02 1.5469487719e-02 1.5835886960e-02 1.6210964471e-02 1.6594925800e-02 1.6987981363e-02 1.7390346560e-02 1.7802241891e-02 1.8223893081e-02 1.8655531200e-02 1.9097392791e-02 1.9549720000e-02 2.0012760709e-02 2.0486768669e-02 2.0972003643e-02 2.1468731547e-02 2.1977224593e-02 2.2497761442e-02 2.3030627355e-02 2.3576114350e-02 2.4134521360e-02 2.4706154400e-02 2.5291326732e-02 2.5890359038e-02 2.6503579595e-02 2.7131324457e-02 2.7773937635e-02 2.8431771290e-02 2.9105185923e-02 2.9794550575e-02 3.0500243025e-02 3.1222650003e-02 3.1962167397e-02 3.2719200472e-02 3.3494164091e-02 3.4287482946e-02 3.5099591784e-02 3.5930935652e-02 3.6781970138e-02 3.7653161619e-02 3.8544987519e-02 3.9457936571e-02 4.0392509082e-02 4.1349217210e-02 4.2328585244e-02 4.3331149890e-02 4.4357460566e-02 4.5408079704e-02 4.6483583057e-02 4.7584560014e-02 4.8711613925e-02 4.9865362430e-02 5.1046437799e-02 5.2255487276e-02 5.3493173435e-02 5.4760174544e-02 5.6057184938e-02 5.7384915393e-02 5.8744093524e-02 6.0135464177e-02 6.1559789843e-02 6.3017851069e-02 6.4510446892e-02 6.6038395274e-02 6.7602533550e-02 6.9203718889e-02 7.0842828761e-02 7.2520761418e-02 7.4238436390e-02 7.5996794985e-02 7.7796800806e-02 7.9639440280e-02 8.1525723197e-02 8.3456683264e-02 8.5433378672e-02 8.7456892677e-02 8.9528334189e-02 9.1648838386e-02 9.3819567331e-02 9.6041710612e-02 9.8316485992e-02 1.0064514008e-01 1.0302894900e-01 1.0546921912e-01 1.0796728773e-01 1.1052452382e-01 1.1314232877e-01 1.1582213718e-01 1.1856541762e-01 1.2137367344e-01 1.2424844361e-01 1.2719130352e-01 1.3020386592e-01 1.3328778172e-01 1.3644474094e-01 1.3967647365e-01 1.4298475087e-01 1.4637138558e-01 1.4983823370e-01 1.5338719512e-01 1.5702021470e-01 1.6073928338e-01 1.6454643927e-01 1.6844376874e-01 1.7243340757e-01 1.7651754214e-01 1.8069841060e-01 1.8497830413e-01 1.8935956816e-01 1.9384460368e-01 1.9843586855e-01 2.0313587884e-01 2.0794721022e-01 2.1287249936e-01 2.1791444538e-01 2.2307581133e-01 2.2835942572e-01 2.3376818402e-01 2.3930505030e-01 2.4497305885e-01 2.5077531580e-01 2.5671500087e-01 2.6279536907e-01 2.6901975254e-01 2.7539156231e-01 2.8191429021e-01 2.8859151079e-01 2.9542688325e-01 3.0242415346e-01 3.0958715602e-01 3.1691981634e-01 3.2442615281e-01 3.3211027901e-01 3.3997640594e-01 3.4802884434e-01 3.5627200704e-01 3.6471041140e-01 3.7334868179e-01 3.8219155208e-01 3.9124386828e-01 4.0051059118e-01 4.0999679907e-01 4.1970769049e-01 4.2964858716e-01 4.3982493681e-01 4.5024231621e-01 4.6090643422e-01 4.7182313492e-01 4.8299840079e-01 4.9443835603e-01 5.0614926989e-01 5.1813756008e-01 5.3040979636e-01 5.4297270406e-01 5.5583316782e-01 5.6899823535e-01 5.8247512127e-01 5.9627121108e-01 6.1039406522e-01 6.2485142320e-01 6.3965120784e-01 6.5480152962e-01 6.7031069109e-01 6.8618719149e-01 7.0243973135e-01 7.1907721725e-01 7.3610876677e-01 7.5354371341e-01 7.7139161174e-01 7.8966224265e-01 8.0836561868e-01 8.2751198952e-01 8.4711184763e-01 8.6717593398e-01 8.8771524395e-01 9.0874103336e-01 9.3026482460e-01 9.5229841299e-01 9.7485387322e-01 9.9794356597e-01 1.0215801447e+00 1.0457765626e+00 1.0705460795e+00 1.0959022695e+00 1.1218590282e+00 1.1484305800e+00 1.1756314867e+00 1.2034766547e+00 1.2319813434e+00 1.2611611738e+00 1.2910321369e+00 1.3216106022e+00 1.3529133272e+00 1.3849574663e+00 1.4177605799e+00 1.4513406447e+00 1.4857160629e+00 1.5209056727e+00 1.5569287584e+00 1.5938050613e+00 1.6315547899e+00 1.6701986317e+00 1.7097577639e+00 1.7502538655e+00 1.7917091288e+00 1.8341462718e+00 1.8775885508e+00 1.9220597725e+00 1.9675843079e+00 2.0141871049e+00 2.0618937024e+00 2.1107302444e+00 2.1607234938e+00 2.2119008476e+00 2.2642903517e+00 2.3179207162e+00 2.3728213312e+00 2.4290222829e+00 2.4865543703e+00 2.5454491216e+00 2.6057388120e+00 2.6674564809e+00 2.7306359504e+00 2.7953118437e+00 2.8615196041e+00 2.9292955142e+00 2.9986767161e+00 3.0697012317e+00 3.1424079831e+00 3.2168368148e+00 3.2930285147e+00 3.3710248367e+00 3.4508685239e+00 3.5326033317e+00 3.6162740518e+00 3.7019265369e+00 3.7896077255e+00 3.8793656681e+00 3.9712495533e+00 4.0653097346e+00 4.1615977582e+00 4.2601663912e+00 4.3610696504e+00 4.4643628321e+00 4.5701025424e+00 4.6783467280e+00 4.7891547081e+00 4.9025872069e+00 5.0187063868e+00 5.1375758827e+00 5.2592608366e+00 5.3838279335e+00 5.5113454377e+00 5.6418832304e+00 5.7755128480e+00 5.9123075214e+00 6.0523422157e+00 6.1956936718e+00 6.3424404482e+00 6.4926629639e+00 6.6464435428e+00 6.8038664587e+00 6.9650179814e+00 7.1299864240e+00 7.2988621914e+00 7.4717378296e+00 7.6487080767e+00 7.8298699147e+00 8.0153226227e+00 8.2051678310e+00 8.3995095775e+00 8.5984543637e+00 8.8021112141e+00 9.0105917353e+00 9.2240101772e+00 9.4424834960e+00 9.6661314177e+00 9.8950765045e+00 1.0129444221e+01 1.0369363004e+01 1.0614964332e+01 1.0866382798e+01 1.1123756182e+01 1.1387225528e+01 1.1656935221e+01 1.1933033065e+01 1.2215670365e+01 1.2505002011e+01 1.2801186560e+01 1.3104386324e+01 1.3414767461e+01 1.3732500065e+01 1.4057758256e+01 1.4390720280e+01 1.4731568605e+01 1.5080490020e+01 1.5437675739e+01 1.5803321503e+01 1.6177627692e+01 1.6560799430e+01 1.6953046700e+01 1.7354584459e+01 1.7765632755e+01 1.8186416847e+01 1.8617167330e+01 1.9058120262e+01 1.9509517291e+01 1.9971605787e+01 2.0444638981e+01 2.0928876101e+01 2.1424582517e+01 2.1932029880e+01 2.2451496279e+01 2.2983266389e+01 2.3527631626e+01 2.4084890309e+01 2.4655347823e+01 2.5239316787e+01 2.5837117222e+01 2.6449076732e+01 2.7075530678e+01 2.7716822364e+01 2.8373303228e+01 2.9045333029e+01 2.9733280047e+01 3.0437521288e+01 3.1158442683e+01 3.1896439308e+01 3.2651915594e+01 3.3425285552e+01 3.4216972999e+01 3.5027411789e+01 3.5857046054e+01 3.6706330443e+01 3.7575730376e+01 3.8465722295e+01 3.9376793928e+01 4.0309444552e+01 4.1264185273e+01 4.2241539301e+01 4.3242042239e+01 4.4266242375e+01 4.5314700984e+01 4.6387992635e+01 4.7486705505e+01 4.8611441705e+01 4.9762817602e+01 5.0941464167e+01 5.2148027313e+01 5.3383168253e+01 5.4647563858e+01 5.5941907035e+01 5.7266907100e+01 5.8623290171e+01 6.0011799563e+01 6.1433196196e+01 6.2888259016e+01 6.4377785414e+01 6.5902591671e+01 6.7463513400e+01 6.9061406007e+01 7.0697145157e+01 7.2371627256e+01 7.4085769943e+01 7.5840512590e+01 7.7636816818e+01 7.9475667025e+01 8.1358070926e+01 8.3285060101e+01 8.5257690565e+01 8.7277043347e+01 8.9344225076e+01 9.1460368596e+01 9.3626633580e+01 9.5844207170e+01 9.8114304624e+01 1.0043816999e+02 1.0281707676e+02 1.0525232863e+02 1.0774526013e+02 1.1029723743e+02 1.1290965904e+02 1.1558395660e+02 1.1832159566e+02 1.2112407649e+02 1.2399293488e+02 1.2692974300e+02 1.2993611026e+02 1.3301368419e+02 1.3616415133e+02 1.3938923819e+02 1.4269071216e+02 1.4607038248e+02 1.4953010126e+02 1.5307176447e+02 1.5669731298e+02 1.6040873365e+02 1.6420806038e+02 1.6809737524e+02 1.7207880965e+02 1.7615454546e+02 1.8032681624e+02 1.8459790845e+02 1.8897016270e+02 1.9344597504e+02 1.9802779828e+02 2.0271814331e+02 2.0751958050e+02 2.1243474111e+02 2.1746631870e+02 2.2261707064e+02 2.2788981962e+02 2.3328745517e+02 2.3881293525e+02 2.4446928792e+02 2.5025961291e+02 2.5618708341e+02 2.6225494773e+02 2.6846653117e+02 2.7482523773e+02 2.8133455207e+02 2.8799804139e+02 2.9481935735e+02 3.0180223814e+02 3.0895051045e+02 3.1626809164e+02 3.2375899183e+02 3.3142731614e+02 3.3927726689e+02 3.4731314598e+02 3.5553935716e+02 3.6396040850e+02 3.7258091486e+02 3.8140560037e+02 3.9043930108e+02 3.9968696758e+02 4.0915366770e+02 4.1884458932e+02 4.2876504319e+02 4.3892046585e+02 4.4931642259e+02 4.5995861055e+02 4.7085286177e+02 4.8200514645e+02 4.9342157617e+02 5.0510840730e+02 5.1707204437e+02 5.2931904360e+02 5.4185611652e+02 5.5469013358e+02 5.6782812802e+02 5.8127729961e+02 5.9504501867e+02 6.0913883009e+02 6.2356645747e+02 6.3833580734e+02 6.5345497347e+02 6.6893224138e+02 6.8477609280e+02 7.0099521038e+02 7.1759848239e+02 7.3459500765e+02 7.5199410048e+02 7.6980529578e+02 7.8803835435e+02 8.0670326812e+02 8.2581026571e+02 8.4536981800e+02 8.6539264388e+02 8.8588971612e+02 9.0687226738e+02 9.2835179636e+02 9.5034007412e+02 9.7284915054e+02 9.9589136087e+02 1.0194793325e+03 1.0436259921e+03 1.0683445721e+03 1.0936486188e+03 1.1195519991e+03 1.1460689083e+03 1.1732138781e+03 1.2010017843e+03 1.2294478550e+03 1.2585676791e+03 1.2883772144e+03 1.3188927972e+03 1.3501311502e+03 1.3821093926e+03 1.4148450488e+03 1.4483560584e+03 1.4826607858e+03 1.5177780305e+03 1.5537270372e+03 1.5905275063e+03 1.6281996052e+03 1.6667639784e+03 1.7062417599e+03 1.7466545839e+03 1.7880245972e+03 1.8303744710e+03 1.8737274138e+03 1.9181071834e+03 1.9635381005e+03 2.0100450620e+03 2.0576535540e+03 2.1063896669e+03 2.1562801085e+03 2.2073522195e+03 2.2596339880e+03 2.3131540652e+03 2.3679417807e+03 2.4240271589e+03 2.4814409353e+03 2.5402145734e+03 2.6003802820e+03 2.6619710326e+03 2.7250205777e+03 2.7895634694e+03 2.8556350778e+03 2.9232716112e+03 2.9925101353e+03 3.0633885936e+03 3.1359458284e+03 3.2102216021e+03 3.2862566188e+03 3.3640925465e+03 3.4437720405e+03 3.5253387660e+03 3.6088374228e+03 3.6943137692e+03 3.7818146472e+03 3.8713880086e+03 3.9630829406e+03 4.0569496934e+03 4.1530397070e+03 4.2514056400e+03 4.3521013983e+03 4.4551821645e+03 4.5607044281e+03 4.6687260166e+03 4.7793061274e+03 4.8925053597e+03 5.0083857482e+03 5.1270107968e+03 5.2484455137e+03 5.3727564465e+03 5.5000117194e+03 5.6302810697e+03 5.7636358869e+03 5.9001492510e+03 6.0398959732e+03 6.1829526365e+03 6.3293976378e+03 6.4793112308e+03 6.6327755701e+03 6.7898747562e+03 6.9506948815e+03 7.1153240773e+03 7.2838525628e+03 7.4563726937e+03 7.6329790131e+03 7.8137683038e+03 7.9988396405e+03 8.1882944447e+03 8.3822365402e+03 8.5807722096e+03 8.7840102531e+03 8.9920620479e+03 9.2050416088e+03 9.4230656516e+03 9.6462536562e+03 9.8747279325e+03 1.0108613687e+04 1.0348039093e+04 1.0593135358e+04 1.0844036798e+04 1.1100880911e+04 1.1363808450e+04 1.1632963502e+04 1.1908493570e+04 1.2190549645e+04 1.2479286299e+04 1.2774861764e+04 1.3077438018e+04 1.3387180877e+04 1.3704260084e+04 1.4028849403e+04 1.4361126713e+04 1.4701274106e+04 1.5049477987e+04 1.5405929177e+04 1.5770823015e+04 1.6144359468e+04 1.6526743238e+04 1.6918183878e+04 1.7318895901e+04 1.7729098903e+04 1.8149017680e+04 1.8578882354e+04 1.9018928495e+04 1.9469397255e+04 1.9930535497e+04 2.0402595929e+04 2.0885837248e+04 2.1380524276e+04 2.1886928108e+04 2.2405326259e+04 2.2936002818e+04 2.3479248604e+04 2.4035361321e+04 2.4604645727e+04 2.5187413797e+04 2.5783984895e+04 2.6394685951e+04 2.7019851635e+04 2.7659824548e+04 2.8314955402e+04 2.8985603217e+04 2.9672135518e+04 3.0374928533e+04 3.1094367401e+04 3.1830846385e+04 3.2584769084e+04 3.3356548658e+04 3.4146608051e+04 3.4955380228e+04 3.5783308404e+04 3.6630846296e+04 3.7498458366e+04 3.8386620075e+04 3.9295818149e+04 4.0226550839e+04 4.1179328198e+04 4.2154672362e+04 4.3153117832e+04 4.4175211768e+04 4.5221514291e+04 4.6292598788e+04 4.7389052228e+04 4.8511475482e+04 4.9660483651e+04 5.0836706407e+04 5.2040788336e+04 5.3273389289e+04 5.4535184748e+04 5.5826866194e+04 5.7149141484e+04 5.8502735242e+04 5.9888389256e+04 6.1306862881e+04 6.2758933460e+04 6.4245396745e+04 6.5767067339e+04 6.7324779135e+04 6.8919385782e+04 7.0551761142e+04 7.2222799780e+04 7.3933417445e+04 7.5684551579e+04 7.7477161826e+04 7.9312230559e+04 8.1190763420e+04 8.3113789869e+04 8.5082363749e+04 8.7097563865e+04 8.9160494572e+04 9.1272286382e+04 9.3434096585e+04 9.5647109881e+04 9.7912539030e+04 1.0023162552e+05 1.0260564023e+05 1.0503588416e+05 1.0752368911e+05 1.1007041843e+05 1.1267746777e+05 1.1534626582e+05 1.1807827511e+05 1.2087499282e+05 1.2373795159e+05 1.2666872036e+05 1.2966890522e+05 1.3274015032e+05 1.3588413874e+05 1.3910259342e+05 1.4239727812e+05 1.4576999838e+05 1.4922260247e+05 1.5275698248e+05 1.5637507530e+05 1.6007886367e+05 1.6387037733e+05 1.6775169408e+05 1.7172494093e+05 1.7579229526e+05 1.7995598604e+05 1.8421829503e+05 1.8858155803e+05 1.9304816616e+05 1.9762056718e+05 2.0230126682e+05 2.0709283018e+05 2.1199788308e+05 2.1701911356e+05 2.2215927333e+05 2.2742117924e+05 2.3280771491e+05 2.3832183221e+05 2.4396655295e+05 2.4974497053e+05 2.5566025157e+05 2.6171563774e+05 2.6791444746e+05 2.7426007776e+05 2.8075600613e+05 2.8740579242e+05 2.9421308080e+05 3.0118160175e+05 3.0831517411e+05 3.1561770718e+05 3.2309320282e+05 3.3074575772e+05 3.3857956558e+05 3.4659891941e+05 3.5480821393e+05 3.6321194793e+05 3.7181472679e+05 3.8062126491e+05 3.8963638842e+05 3.9886503770e+05 4.0831227017e+05 4.1798326305e+05 4.2788331616e+05 4.3801785486e+05 4.4839243301e+05 4.5901273601e+05 4.6988458392e+05 4.8101393466e+05 4.9240688725e+05 5.0406968519e+05 5.1600871982e+05 5.2823053391e+05 5.4074182516e+05 5.5354944992e+05 5.6666042693e+05 5.8008194119e+05 5.9382134784e+05 6.0788617628e+05 6.2228413419e+05 6.3702311186e+05 6.5211118643e+05 6.6755662636e+05 6.8336789595e+05 6.9955365998e+05 7.1612278846e+05 7.3308436148e+05 7.5044767422e+05 7.6822224198e+05 7.8641780546e+05 8.0504433607e+05 8.2411204138e+05 8.4363137074e+05 8.6361302100e+05 8.8406794236e+05 9.0500734439e+05 9.2644270213e+05 9.4838576246e+05 9.7084855044e+05 9.9384337598e+05 1.0173828405e+06 1.0414798441e+06 1.0661475920e+06 1.0913996026e+06 1.1172497143e+06 1.1437120932e+06 1.1708012412e+06 1.1985320034e+06 1.2269195766e+06 1.2559795177e+06 1.2857277517e+06 1.3161805812e+06 1.3473546946e+06 1.3792671758e+06 1.4119355133e+06 1.4453776097e+06 1.4796117917e+06 1.5146568201e+06 1.5505319000e+06 1.5872566915e+06 1.6248513201e+06 1.6633363882e+06 1.7027329862e+06 1.7430627039e+06 1.7843476425e+06 1.8266104267e+06 1.8698742170e+06 1.9141627225e+06 1.9595002140e+06 2.0059115369e+06 2.0534221253e+06 2.1020580155e+06 2.1518458607e+06 2.2028129452e+06 2.2549871998e+06 2.3083972164e+06 2.3630722646e+06 2.4190423069e+06 2.4763380157e+06 2.5349907898e+06 2.5950327715e+06 2.6564968648e+06 2.7194167527e+06 2.7838269161e+06 2.8497626527e+06 2.9172600960e+06 2.9863562356e+06 3.0570889370e+06 3.1294969627e+06 3.2036199932e+06 3.2794986488e+06 3.3571745121e+06 3.4366901505e+06 3.5180891394e+06 3.6014160867e+06 3.6867166566e+06 3.7740375949e+06 3.8634267545e+06 3.9549331220e+06 4.0486068440e+06 4.1444992548e+06 4.2426629048e+06 4.3431515889e+06 4.4460203763e+06 4.5513256403e+06 4.6591250896e+06 4.7694777996e+06 4.8824442452e+06 4.9980863333e+06 5.1164674374e+06 5.2376524317e+06 5.3617077273e+06 5.4887013081e+06 5.6187027681e+06 5.7517833499e+06 5.8880159833e+06 6.0274753256e+06 6.1702378023e+06 6.3163816491e+06 6.4659869547e+06 6.6191357048e+06 6.7759118267e+06 6.9364012360e+06 7.1006918828e+06 7.2688738006e+06 7.4410391551e+06 7.6172822954e+06 7.7976998048e+06 7.9823905545e+06 8.1714557574e+06 8.3649990237e+06 8.5631264176e+06 8.7659465155e+06 8.9735704655e+06 9.1861120480e+06 9.4036877387e+06 9.6264167719e+06 9.8544212059e+06 1.0087825990e+07 1.0326759033e+07 1.0571351274e+07 1.0821736752e+07 1.1078052682e+07 1.1340439527e+07 1.1609041080e+07 1.1884004538e+07 1.2165480584e+07 1.2453623470e+07 1.2748591104e+07 1.3050545129e+07 1.3359651023e+07 1.3676078178e+07 1.4000000000e+07 ) 

# The group structure to use outside the RRR in the thermal and fast energy ranges. 
# G=shem-361 would point to ../dat/energy_groups/shem-361.txt 
G=log-1-998-1 
 
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
 
cp $SCRATCH_BARN/xs/pdtxs/BarnfireXS_HMF001_1000.xml $scriptdir/hmf001_1000mg/. 
cp $SCRATCH_BARN/dat/indicators/flux.xml $scriptdir/hmf001_1000mg/flux_1th_998cg_998el_1urr.xml 
cp $SCRATCH_BARN/dat/energy_groups/clust-$g-$res.xml $scriptdir/hmf001_1000mg/clust_1th_998cg_998el_1urr.xml
#######################
rm *.~ *.pyc
