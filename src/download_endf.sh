mkdir downloaded_endf_files 

if [ ! -f downloaded_endf_files/endf_1001_vii1 ]; then
  echo "endf_1001_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0125_1-H-1.zip 
  unzip n_0125_1-H-1.zip 
  mv n_0125_1-H-1.dat downloaded_endf_files/endf_1001_vii1
  rm n_0125_1-H-1.zip 
fi 

if [ ! -f downloaded_endf_files/endf_1002_vii1 ]; then
  echo "endf_1002_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0128_1-H-2.zip 
  unzip n_0128_1-H-2.zip 
  mv n_0128_1-H-2.dat downloaded_endf_files/endf_1002_vii1
  rm n_0128_1-H-2.zip 
fi 

if [ ! -f downloaded_endf_files/endf_1003_vii1 ]; then
  echo "endf_1003_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0131_1-H-3.zip 
  unzip n_0131_1-H-3.zip 
  mv n_0131_1-H-3.dat downloaded_endf_files/endf_1003_vii1
  rm n_0131_1-H-3.zip 
fi 

if [ ! -f downloaded_endf_files/endf_2003_vii1 ]; then
  echo "endf_2003_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0225_2-He-3.zip 
  unzip n_0225_2-He-3.zip 
  mv n_0225_2-He-3.dat downloaded_endf_files/endf_2003_vii1
  rm n_0225_2-He-3.zip 
fi 

if [ ! -f downloaded_endf_files/endf_2004_vii1 ]; then
  echo "endf_2004_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0228_2-He-4.zip 
  unzip n_0228_2-He-4.zip 
  mv n_0228_2-He-4.dat downloaded_endf_files/endf_2004_vii1
  rm n_0228_2-He-4.zip 
fi 

if [ ! -f downloaded_endf_files/endf_3006_vii1 ]; then
  echo "endf_3006_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0325_3-Li-6.zip 
  unzip n_0325_3-Li-6.zip 
  mv n_0325_3-Li-6.dat downloaded_endf_files/endf_3006_vii1
  rm n_0325_3-Li-6.zip 
fi 

if [ ! -f downloaded_endf_files/endf_3007_vii1 ]; then
  echo "endf_3007_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0328_3-Li-7.zip 
  unzip n_0328_3-Li-7.zip 
  mv n_0328_3-Li-7.dat downloaded_endf_files/endf_3007_vii1
  rm n_0328_3-Li-7.zip 
fi 

if [ ! -f downloaded_endf_files/endf_4007_vii1 ]; then
  echo "endf_4007_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0419_4-Be-7.zip 
  unzip n_0419_4-Be-7.zip 
  mv n_0419_4-Be-7.dat downloaded_endf_files/endf_4007_vii1
  rm n_0419_4-Be-7.zip 
fi 

if [ ! -f downloaded_endf_files/endf_4009_vii1 ]; then
  echo "endf_4009_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0425_4-Be-9.zip 
  unzip n_0425_4-Be-9.zip 
  mv n_0425_4-Be-9.dat downloaded_endf_files/endf_4009_vii1
  rm n_0425_4-Be-9.zip 
fi 

if [ ! -f downloaded_endf_files/endf_5010_vii1 ]; then
  echo "endf_5010_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0525_5-B-10.zip 
  unzip n_0525_5-B-10.zip 
  mv n_0525_5-B-10.dat downloaded_endf_files/endf_5010_vii1
  rm n_0525_5-B-10.zip 
fi 

if [ ! -f downloaded_endf_files/endf_5011_vii1 ]; then
  echo "endf_5011_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0528_5-B-11.zip 
  unzip n_0528_5-B-11.zip 
  mv n_0528_5-B-11.dat downloaded_endf_files/endf_5011_vii1
  rm n_0528_5-B-11.zip 
fi 

if [ ! -f downloaded_endf_files/endf_6000_vii1 ]; then
  echo "endf_6000_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0600_6-C-0.zip 
  unzip n_0600_6-C-0.zip 
  mv n_0600_6-C-0.dat downloaded_endf_files/endf_6000_vii1
  rm n_0600_6-C-0.zip 
fi 

if [ ! -f downloaded_endf_files/endf_7014_vii1 ]; then
  echo "endf_7014_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0725_7-N-14.zip 
  unzip n_0725_7-N-14.zip 
  mv n_0725_7-N-14.dat downloaded_endf_files/endf_7014_vii1
  rm n_0725_7-N-14.zip 
fi 

if [ ! -f downloaded_endf_files/endf_7015_vii1 ]; then
  echo "endf_7015_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0728_7-N-15.zip 
  unzip n_0728_7-N-15.zip 
  mv n_0728_7-N-15.dat downloaded_endf_files/endf_7015_vii1
  rm n_0728_7-N-15.zip 
fi 

if [ ! -f downloaded_endf_files/endf_8016_vii1 ]; then
  echo "endf_8016_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0825_8-O-16.zip 
  unzip n_0825_8-O-16.zip 
  mv n_0825_8-O-16.dat downloaded_endf_files/endf_8016_vii1
  rm n_0825_8-O-16.zip 
fi 

if [ ! -f downloaded_endf_files/endf_8017_vii1 ]; then
  echo "endf_8017_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0828_8-O-17.zip 
  unzip n_0828_8-O-17.zip 
  mv n_0828_8-O-17.dat downloaded_endf_files/endf_8017_vii1
  rm n_0828_8-O-17.zip 
fi 

if [ ! -f downloaded_endf_files/endf_9019_vii1 ]; then
  echo "endf_9019_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_0925_9-F-19.zip 
  unzip n_0925_9-F-19.zip 
  mv n_0925_9-F-19.dat downloaded_endf_files/endf_9019_vii1
  rm n_0925_9-F-19.zip 
fi 

if [ ! -f downloaded_endf_files/endf_11022_vii1 ]; then
  echo "endf_11022_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1122_11-Na-22.zip 
  unzip n_1122_11-Na-22.zip 
  mv n_1122_11-Na-22.dat downloaded_endf_files/endf_11022_vii1
  rm n_1122_11-Na-22.zip 
fi 

if [ ! -f downloaded_endf_files/endf_11023_vii1 ]; then
  echo "endf_11023_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1125_11-Na-23.zip 
  unzip n_1125_11-Na-23.zip 
  mv n_1125_11-Na-23.dat downloaded_endf_files/endf_11023_vii1
  rm n_1125_11-Na-23.zip 
fi 

if [ ! -f downloaded_endf_files/endf_12024_vii1 ]; then
  echo "endf_12024_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1225_12-Mg-24.zip 
  unzip n_1225_12-Mg-24.zip 
  mv n_1225_12-Mg-24.dat downloaded_endf_files/endf_12024_vii1
  rm n_1225_12-Mg-24.zip 
fi 

if [ ! -f downloaded_endf_files/endf_12025_vii1 ]; then
  echo "endf_12025_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1228_12-Mg-25.zip 
  unzip n_1228_12-Mg-25.zip 
  mv n_1228_12-Mg-25.dat downloaded_endf_files/endf_12025_vii1
  rm n_1228_12-Mg-25.zip 
fi 

if [ ! -f downloaded_endf_files/endf_12026_vii1 ]; then
  echo "endf_12026_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1231_12-Mg-26.zip 
  unzip n_1231_12-Mg-26.zip 
  mv n_1231_12-Mg-26.dat downloaded_endf_files/endf_12026_vii1
  rm n_1231_12-Mg-26.zip 
fi 

if [ ! -f downloaded_endf_files/endf_13027_vii1 ]; then
  echo "endf_13027_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1325_13-Al-27.zip 
  unzip n_1325_13-Al-27.zip 
  mv n_1325_13-Al-27.dat downloaded_endf_files/endf_13027_vii1
  rm n_1325_13-Al-27.zip 
fi 

if [ ! -f downloaded_endf_files/endf_14028_vii1 ]; then
  echo "endf_14028_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1425_14-Si-28.zip 
  unzip n_1425_14-Si-28.zip 
  mv n_1425_14-Si-28.dat downloaded_endf_files/endf_14028_vii1
  rm n_1425_14-Si-28.zip 
fi 

if [ ! -f downloaded_endf_files/endf_14029_vii1 ]; then
  echo "endf_14029_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1428_14-Si-29.zip 
  unzip n_1428_14-Si-29.zip 
  mv n_1428_14-Si-29.dat downloaded_endf_files/endf_14029_vii1
  rm n_1428_14-Si-29.zip 
fi 

if [ ! -f downloaded_endf_files/endf_14030_vii1 ]; then
  echo "endf_14030_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1431_14-Si-30.zip 
  unzip n_1431_14-Si-30.zip 
  mv n_1431_14-Si-30.dat downloaded_endf_files/endf_14030_vii1
  rm n_1431_14-Si-30.zip 
fi 

if [ ! -f downloaded_endf_files/endf_15031_vii1 ]; then
  echo "endf_15031_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1525_15-P-31.zip 
  unzip n_1525_15-P-31.zip 
  mv n_1525_15-P-31.dat downloaded_endf_files/endf_15031_vii1
  rm n_1525_15-P-31.zip 
fi 

if [ ! -f downloaded_endf_files/endf_16032_vii1 ]; then
  echo "endf_16032_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1625_16-S-32.zip 
  unzip n_1625_16-S-32.zip 
  mv n_1625_16-S-32.dat downloaded_endf_files/endf_16032_vii1
  rm n_1625_16-S-32.zip 
fi 

if [ ! -f downloaded_endf_files/endf_16033_vii1 ]; then
  echo "endf_16033_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1628_16-S-33.zip 
  unzip n_1628_16-S-33.zip 
  mv n_1628_16-S-33.dat downloaded_endf_files/endf_16033_vii1
  rm n_1628_16-S-33.zip 
fi 

if [ ! -f downloaded_endf_files/endf_16034_vii1 ]; then
  echo "endf_16034_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1631_16-S-34.zip 
  unzip n_1631_16-S-34.zip 
  mv n_1631_16-S-34.dat downloaded_endf_files/endf_16034_vii1
  rm n_1631_16-S-34.zip 
fi 

if [ ! -f downloaded_endf_files/endf_16036_vii1 ]; then
  echo "endf_16036_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1637_16-S-36.zip 
  unzip n_1637_16-S-36.zip 
  mv n_1637_16-S-36.dat downloaded_endf_files/endf_16036_vii1
  rm n_1637_16-S-36.zip 
fi 

if [ ! -f downloaded_endf_files/endf_17035_vii1 ]; then
  echo "endf_17035_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1725_17-Cl-35.zip 
  unzip n_1725_17-Cl-35.zip 
  mv n_1725_17-Cl-35.dat downloaded_endf_files/endf_17035_vii1
  rm n_1725_17-Cl-35.zip 
fi 

if [ ! -f downloaded_endf_files/endf_17037_vii1 ]; then
  echo "endf_17037_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1731_17-Cl-37.zip 
  unzip n_1731_17-Cl-37.zip 
  mv n_1731_17-Cl-37.dat downloaded_endf_files/endf_17037_vii1
  rm n_1731_17-Cl-37.zip 
fi 

if [ ! -f downloaded_endf_files/endf_18036_vii1 ]; then
  echo "endf_18036_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1825_18-Ar-36.zip 
  unzip n_1825_18-Ar-36.zip 
  mv n_1825_18-Ar-36.dat downloaded_endf_files/endf_18036_vii1
  rm n_1825_18-Ar-36.zip 
fi 

if [ ! -f downloaded_endf_files/endf_18038_vii1 ]; then
  echo "endf_18038_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1831_18-Ar-38.zip 
  unzip n_1831_18-Ar-38.zip 
  mv n_1831_18-Ar-38.dat downloaded_endf_files/endf_18038_vii1
  rm n_1831_18-Ar-38.zip 
fi 

if [ ! -f downloaded_endf_files/endf_18040_vii1 ]; then
  echo "endf_18040_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1837_18-Ar-40.zip 
  unzip n_1837_18-Ar-40.zip 
  mv n_1837_18-Ar-40.dat downloaded_endf_files/endf_18040_vii1
  rm n_1837_18-Ar-40.zip 
fi 

if [ ! -f downloaded_endf_files/endf_19039_vii1 ]; then
  echo "endf_19039_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1925_19-K-39.zip 
  unzip n_1925_19-K-39.zip 
  mv n_1925_19-K-39.dat downloaded_endf_files/endf_19039_vii1
  rm n_1925_19-K-39.zip 
fi 

if [ ! -f downloaded_endf_files/endf_19040_vii1 ]; then
  echo "endf_19040_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1928_19-K-40.zip 
  unzip n_1928_19-K-40.zip 
  mv n_1928_19-K-40.dat downloaded_endf_files/endf_19040_vii1
  rm n_1928_19-K-40.zip 
fi 

if [ ! -f downloaded_endf_files/endf_19041_vii1 ]; then
  echo "endf_19041_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_1931_19-K-41.zip 
  unzip n_1931_19-K-41.zip 
  mv n_1931_19-K-41.dat downloaded_endf_files/endf_19041_vii1
  rm n_1931_19-K-41.zip 
fi 

if [ ! -f downloaded_endf_files/endf_20040_vii1 ]; then
  echo "endf_20040_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2025_20-Ca-40.zip 
  unzip n_2025_20-Ca-40.zip 
  mv n_2025_20-Ca-40.dat downloaded_endf_files/endf_20040_vii1
  rm n_2025_20-Ca-40.zip 
fi 

if [ ! -f downloaded_endf_files/endf_20042_vii1 ]; then
  echo "endf_20042_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2031_20-Ca-42.zip 
  unzip n_2031_20-Ca-42.zip 
  mv n_2031_20-Ca-42.dat downloaded_endf_files/endf_20042_vii1
  rm n_2031_20-Ca-42.zip 
fi 

if [ ! -f downloaded_endf_files/endf_20043_vii1 ]; then
  echo "endf_20043_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2034_20-Ca-43.zip 
  unzip n_2034_20-Ca-43.zip 
  mv n_2034_20-Ca-43.dat downloaded_endf_files/endf_20043_vii1
  rm n_2034_20-Ca-43.zip 
fi 

if [ ! -f downloaded_endf_files/endf_20044_vii1 ]; then
  echo "endf_20044_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2037_20-Ca-44.zip 
  unzip n_2037_20-Ca-44.zip 
  mv n_2037_20-Ca-44.dat downloaded_endf_files/endf_20044_vii1
  rm n_2037_20-Ca-44.zip 
fi 

if [ ! -f downloaded_endf_files/endf_20046_vii1 ]; then
  echo "endf_20046_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2043_20-Ca-46.zip 
  unzip n_2043_20-Ca-46.zip 
  mv n_2043_20-Ca-46.dat downloaded_endf_files/endf_20046_vii1
  rm n_2043_20-Ca-46.zip 
fi 

if [ ! -f downloaded_endf_files/endf_20048_vii1 ]; then
  echo "endf_20048_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2049_20-Ca-48.zip 
  unzip n_2049_20-Ca-48.zip 
  mv n_2049_20-Ca-48.dat downloaded_endf_files/endf_20048_vii1
  rm n_2049_20-Ca-48.zip 
fi 

if [ ! -f downloaded_endf_files/endf_21045_vii1 ]; then
  echo "endf_21045_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2125_21-Sc-45.zip 
  unzip n_2125_21-Sc-45.zip 
  mv n_2125_21-Sc-45.dat downloaded_endf_files/endf_21045_vii1
  rm n_2125_21-Sc-45.zip 
fi 

if [ ! -f downloaded_endf_files/endf_22046_vii1 ]; then
  echo "endf_22046_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2225_22-Ti-46.zip 
  unzip n_2225_22-Ti-46.zip 
  mv n_2225_22-Ti-46.dat downloaded_endf_files/endf_22046_vii1
  rm n_2225_22-Ti-46.zip 
fi 

if [ ! -f downloaded_endf_files/endf_22047_vii1 ]; then
  echo "endf_22047_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2228_22-Ti-47.zip 
  unzip n_2228_22-Ti-47.zip 
  mv n_2228_22-Ti-47.dat downloaded_endf_files/endf_22047_vii1
  rm n_2228_22-Ti-47.zip 
fi 

if [ ! -f downloaded_endf_files/endf_22048_vii1 ]; then
  echo "endf_22048_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2231_22-Ti-48.zip 
  unzip n_2231_22-Ti-48.zip 
  mv n_2231_22-Ti-48.dat downloaded_endf_files/endf_22048_vii1
  rm n_2231_22-Ti-48.zip 
fi 

if [ ! -f downloaded_endf_files/endf_22049_vii1 ]; then
  echo "endf_22049_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2234_22-Ti-49.zip 
  unzip n_2234_22-Ti-49.zip 
  mv n_2234_22-Ti-49.dat downloaded_endf_files/endf_22049_vii1
  rm n_2234_22-Ti-49.zip 
fi 

if [ ! -f downloaded_endf_files/endf_22050_vii1 ]; then
  echo "endf_22050_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2237_22-Ti-50.zip 
  unzip n_2237_22-Ti-50.zip 
  mv n_2237_22-Ti-50.dat downloaded_endf_files/endf_22050_vii1
  rm n_2237_22-Ti-50.zip 
fi 

if [ ! -f downloaded_endf_files/endf_23050_vii1 ]; then
  echo "endf_23050_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2325_23-V-50.zip 
  unzip n_2325_23-V-50.zip 
  mv n_2325_23-V-50.dat downloaded_endf_files/endf_23050_vii1
  rm n_2325_23-V-50.zip 
fi 

if [ ! -f downloaded_endf_files/endf_23051_vii1 ]; then
  echo "endf_23051_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2328_23-V-51.zip 
  unzip n_2328_23-V-51.zip 
  mv n_2328_23-V-51.dat downloaded_endf_files/endf_23051_vii1
  rm n_2328_23-V-51.zip 
fi 

if [ ! -f downloaded_endf_files/endf_24050_vii1 ]; then
  echo "endf_24050_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2425_24-Cr-50.zip 
  unzip n_2425_24-Cr-50.zip 
  mv n_2425_24-Cr-50.dat downloaded_endf_files/endf_24050_vii1
  rm n_2425_24-Cr-50.zip 
fi 

if [ ! -f downloaded_endf_files/endf_24052_vii1 ]; then
  echo "endf_24052_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2431_24-Cr-52.zip 
  unzip n_2431_24-Cr-52.zip 
  mv n_2431_24-Cr-52.dat downloaded_endf_files/endf_24052_vii1
  rm n_2431_24-Cr-52.zip 
fi 

if [ ! -f downloaded_endf_files/endf_24053_vii1 ]; then
  echo "endf_24053_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2434_24-Cr-53.zip 
  unzip n_2434_24-Cr-53.zip 
  mv n_2434_24-Cr-53.dat downloaded_endf_files/endf_24053_vii1
  rm n_2434_24-Cr-53.zip 
fi 

if [ ! -f downloaded_endf_files/endf_24054_vii1 ]; then
  echo "endf_24054_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2437_24-Cr-54.zip 
  unzip n_2437_24-Cr-54.zip 
  mv n_2437_24-Cr-54.dat downloaded_endf_files/endf_24054_vii1
  rm n_2437_24-Cr-54.zip 
fi 

if [ ! -f downloaded_endf_files/endf_25055_vii1 ]; then
  echo "endf_25055_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2525_25-Mn-55.zip 
  unzip n_2525_25-Mn-55.zip 
  mv n_2525_25-Mn-55.dat downloaded_endf_files/endf_25055_vii1
  rm n_2525_25-Mn-55.zip 
fi 

if [ ! -f downloaded_endf_files/endf_26054_vii1 ]; then
  echo "endf_26054_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2625_26-Fe-54.zip 
  unzip n_2625_26-Fe-54.zip 
  mv n_2625_26-Fe-54.dat downloaded_endf_files/endf_26054_vii1
  rm n_2625_26-Fe-54.zip 
fi 

if [ ! -f downloaded_endf_files/endf_26056_vii1 ]; then
  echo "endf_26056_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2631_26-Fe-56.zip 
  unzip n_2631_26-Fe-56.zip 
  mv n_2631_26-Fe-56.dat downloaded_endf_files/endf_26056_vii1
  rm n_2631_26-Fe-56.zip 
fi 

if [ ! -f downloaded_endf_files/endf_26057_vii1 ]; then
  echo "endf_26057_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2634_26-Fe-57.zip 
  unzip n_2634_26-Fe-57.zip 
  mv n_2634_26-Fe-57.dat downloaded_endf_files/endf_26057_vii1
  rm n_2634_26-Fe-57.zip 
fi 

if [ ! -f downloaded_endf_files/endf_26058_vii1 ]; then
  echo "endf_26058_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2637_26-Fe-58.zip 
  unzip n_2637_26-Fe-58.zip 
  mv n_2637_26-Fe-58.dat downloaded_endf_files/endf_26058_vii1
  rm n_2637_26-Fe-58.zip 
fi 

if [ ! -f downloaded_endf_files/endf_27058_vii1 ]; then
  echo "endf_27058_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2722_27-Co-58.zip 
  unzip n_2722_27-Co-58.zip 
  mv n_2722_27-Co-58.dat downloaded_endf_files/endf_27058_vii1
  rm n_2722_27-Co-58.zip 
fi 

if [ ! -f downloaded_endf_files/endf_27058m_vii1 ]; then
  echo "endf_27058m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2723_27-Co-58M.zip 
  unzip n_2723_27-Co-58M.zip 
  mv n_2723_27-Co-58M.dat downloaded_endf_files/endf_27058m_vii1
  rm n_2723_27-Co-58M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_27059_vii1 ]; then
  echo "endf_27059_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2725_27-Co-59.zip 
  unzip n_2725_27-Co-59.zip 
  mv n_2725_27-Co-59.dat downloaded_endf_files/endf_27059_vii1
  rm n_2725_27-Co-59.zip 
fi 

if [ ! -f downloaded_endf_files/endf_28058_vii1 ]; then
  echo "endf_28058_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2825_28-Ni-58.zip 
  unzip n_2825_28-Ni-58.zip 
  mv n_2825_28-Ni-58.dat downloaded_endf_files/endf_28058_vii1
  rm n_2825_28-Ni-58.zip 
fi 

if [ ! -f downloaded_endf_files/endf_28059_vii1 ]; then
  echo "endf_28059_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2828_28-Ni-59.zip 
  unzip n_2828_28-Ni-59.zip 
  mv n_2828_28-Ni-59.dat downloaded_endf_files/endf_28059_vii1
  rm n_2828_28-Ni-59.zip 
fi 

if [ ! -f downloaded_endf_files/endf_28060_vii1 ]; then
  echo "endf_28060_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2831_28-Ni-60.zip 
  unzip n_2831_28-Ni-60.zip 
  mv n_2831_28-Ni-60.dat downloaded_endf_files/endf_28060_vii1
  rm n_2831_28-Ni-60.zip 
fi 

if [ ! -f downloaded_endf_files/endf_28061_vii1 ]; then
  echo "endf_28061_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2834_28-Ni-61.zip 
  unzip n_2834_28-Ni-61.zip 
  mv n_2834_28-Ni-61.dat downloaded_endf_files/endf_28061_vii1
  rm n_2834_28-Ni-61.zip 
fi 

if [ ! -f downloaded_endf_files/endf_28062_vii1 ]; then
  echo "endf_28062_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2837_28-Ni-62.zip 
  unzip n_2837_28-Ni-62.zip 
  mv n_2837_28-Ni-62.dat downloaded_endf_files/endf_28062_vii1
  rm n_2837_28-Ni-62.zip 
fi 

if [ ! -f downloaded_endf_files/endf_28064_vii1 ]; then
  echo "endf_28064_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2843_28-Ni-64.zip 
  unzip n_2843_28-Ni-64.zip 
  mv n_2843_28-Ni-64.dat downloaded_endf_files/endf_28064_vii1
  rm n_2843_28-Ni-64.zip 
fi 

if [ ! -f downloaded_endf_files/endf_29063_vii1 ]; then
  echo "endf_29063_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2925_29-Cu-63.zip 
  unzip n_2925_29-Cu-63.zip 
  mv n_2925_29-Cu-63.dat downloaded_endf_files/endf_29063_vii1
  rm n_2925_29-Cu-63.zip 
fi 

if [ ! -f downloaded_endf_files/endf_29065_vii1 ]; then
  echo "endf_29065_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_2931_29-Cu-65.zip 
  unzip n_2931_29-Cu-65.zip 
  mv n_2931_29-Cu-65.dat downloaded_endf_files/endf_29065_vii1
  rm n_2931_29-Cu-65.zip 
fi 

if [ ! -f downloaded_endf_files/endf_30064_vii1 ]; then
  echo "endf_30064_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3025_30-Zn-64.zip 
  unzip n_3025_30-Zn-64.zip 
  mv n_3025_30-Zn-64.dat downloaded_endf_files/endf_30064_vii1
  rm n_3025_30-Zn-64.zip 
fi 

if [ ! -f downloaded_endf_files/endf_30065_vii1 ]; then
  echo "endf_30065_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3028_30-Zn-65.zip 
  unzip n_3028_30-Zn-65.zip 
  mv n_3028_30-Zn-65.dat downloaded_endf_files/endf_30065_vii1
  rm n_3028_30-Zn-65.zip 
fi 

if [ ! -f downloaded_endf_files/endf_30066_vii1 ]; then
  echo "endf_30066_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3031_30-Zn-66.zip 
  unzip n_3031_30-Zn-66.zip 
  mv n_3031_30-Zn-66.dat downloaded_endf_files/endf_30066_vii1
  rm n_3031_30-Zn-66.zip 
fi 

if [ ! -f downloaded_endf_files/endf_30067_vii1 ]; then
  echo "endf_30067_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3034_30-Zn-67.zip 
  unzip n_3034_30-Zn-67.zip 
  mv n_3034_30-Zn-67.dat downloaded_endf_files/endf_30067_vii1
  rm n_3034_30-Zn-67.zip 
fi 

if [ ! -f downloaded_endf_files/endf_30068_vii1 ]; then
  echo "endf_30068_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3037_30-Zn-68.zip 
  unzip n_3037_30-Zn-68.zip 
  mv n_3037_30-Zn-68.dat downloaded_endf_files/endf_30068_vii1
  rm n_3037_30-Zn-68.zip 
fi 

if [ ! -f downloaded_endf_files/endf_30070_vii1 ]; then
  echo "endf_30070_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3043_30-Zn-70.zip 
  unzip n_3043_30-Zn-70.zip 
  mv n_3043_30-Zn-70.dat downloaded_endf_files/endf_30070_vii1
  rm n_3043_30-Zn-70.zip 
fi 

if [ ! -f downloaded_endf_files/endf_31069_vii1 ]; then
  echo "endf_31069_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3125_31-Ga-69.zip 
  unzip n_3125_31-Ga-69.zip 
  mv n_3125_31-Ga-69.dat downloaded_endf_files/endf_31069_vii1
  rm n_3125_31-Ga-69.zip 
fi 

if [ ! -f downloaded_endf_files/endf_31071_vii1 ]; then
  echo "endf_31071_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3131_31-Ga-71.zip 
  unzip n_3131_31-Ga-71.zip 
  mv n_3131_31-Ga-71.dat downloaded_endf_files/endf_31071_vii1
  rm n_3131_31-Ga-71.zip 
fi 

if [ ! -f downloaded_endf_files/endf_32070_vii1 ]; then
  echo "endf_32070_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3225_32-Ge-70.zip 
  unzip n_3225_32-Ge-70.zip 
  mv n_3225_32-Ge-70.dat downloaded_endf_files/endf_32070_vii1
  rm n_3225_32-Ge-70.zip 
fi 

if [ ! -f downloaded_endf_files/endf_32072_vii1 ]; then
  echo "endf_32072_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3231_32-Ge-72.zip 
  unzip n_3231_32-Ge-72.zip 
  mv n_3231_32-Ge-72.dat downloaded_endf_files/endf_32072_vii1
  rm n_3231_32-Ge-72.zip 
fi 

if [ ! -f downloaded_endf_files/endf_32073_vii1 ]; then
  echo "endf_32073_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3234_32-Ge-73.zip 
  unzip n_3234_32-Ge-73.zip 
  mv n_3234_32-Ge-73.dat downloaded_endf_files/endf_32073_vii1
  rm n_3234_32-Ge-73.zip 
fi 

if [ ! -f downloaded_endf_files/endf_32074_vii1 ]; then
  echo "endf_32074_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3237_32-Ge-74.zip 
  unzip n_3237_32-Ge-74.zip 
  mv n_3237_32-Ge-74.dat downloaded_endf_files/endf_32074_vii1
  rm n_3237_32-Ge-74.zip 
fi 

if [ ! -f downloaded_endf_files/endf_32076_vii1 ]; then
  echo "endf_32076_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3243_32-Ge-76.zip 
  unzip n_3243_32-Ge-76.zip 
  mv n_3243_32-Ge-76.dat downloaded_endf_files/endf_32076_vii1
  rm n_3243_32-Ge-76.zip 
fi 

if [ ! -f downloaded_endf_files/endf_33074_vii1 ]; then
  echo "endf_33074_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3322_33-As-74.zip 
  unzip n_3322_33-As-74.zip 
  mv n_3322_33-As-74.dat downloaded_endf_files/endf_33074_vii1
  rm n_3322_33-As-74.zip 
fi 

if [ ! -f downloaded_endf_files/endf_33075_vii1 ]; then
  echo "endf_33075_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3325_33-As-75.zip 
  unzip n_3325_33-As-75.zip 
  mv n_3325_33-As-75.dat downloaded_endf_files/endf_33075_vii1
  rm n_3325_33-As-75.zip 
fi 

if [ ! -f downloaded_endf_files/endf_34074_vii1 ]; then
  echo "endf_34074_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3425_34-Se-74.zip 
  unzip n_3425_34-Se-74.zip 
  mv n_3425_34-Se-74.dat downloaded_endf_files/endf_34074_vii1
  rm n_3425_34-Se-74.zip 
fi 

if [ ! -f downloaded_endf_files/endf_34076_vii1 ]; then
  echo "endf_34076_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3431_34-Se-76.zip 
  unzip n_3431_34-Se-76.zip 
  mv n_3431_34-Se-76.dat downloaded_endf_files/endf_34076_vii1
  rm n_3431_34-Se-76.zip 
fi 

if [ ! -f downloaded_endf_files/endf_34077_vii1 ]; then
  echo "endf_34077_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3434_34-Se-77.zip 
  unzip n_3434_34-Se-77.zip 
  mv n_3434_34-Se-77.dat downloaded_endf_files/endf_34077_vii1
  rm n_3434_34-Se-77.zip 
fi 

if [ ! -f downloaded_endf_files/endf_34078_vii1 ]; then
  echo "endf_34078_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3437_34-Se-78.zip 
  unzip n_3437_34-Se-78.zip 
  mv n_3437_34-Se-78.dat downloaded_endf_files/endf_34078_vii1
  rm n_3437_34-Se-78.zip 
fi 

if [ ! -f downloaded_endf_files/endf_34079_vii1 ]; then
  echo "endf_34079_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3440_34-Se-79.zip 
  unzip n_3440_34-Se-79.zip 
  mv n_3440_34-Se-79.dat downloaded_endf_files/endf_34079_vii1
  rm n_3440_34-Se-79.zip 
fi 

if [ ! -f downloaded_endf_files/endf_34080_vii1 ]; then
  echo "endf_34080_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3443_34-Se-80.zip 
  unzip n_3443_34-Se-80.zip 
  mv n_3443_34-Se-80.dat downloaded_endf_files/endf_34080_vii1
  rm n_3443_34-Se-80.zip 
fi 

if [ ! -f downloaded_endf_files/endf_34082_vii1 ]; then
  echo "endf_34082_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3449_34-Se-82.zip 
  unzip n_3449_34-Se-82.zip 
  mv n_3449_34-Se-82.dat downloaded_endf_files/endf_34082_vii1
  rm n_3449_34-Se-82.zip 
fi 

if [ ! -f downloaded_endf_files/endf_35079_vii1 ]; then
  echo "endf_35079_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3525_35-Br-79.zip 
  unzip n_3525_35-Br-79.zip 
  mv n_3525_35-Br-79.dat downloaded_endf_files/endf_35079_vii1
  rm n_3525_35-Br-79.zip 
fi 

if [ ! -f downloaded_endf_files/endf_35081_vii1 ]; then
  echo "endf_35081_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3531_35-Br-81.zip 
  unzip n_3531_35-Br-81.zip 
  mv n_3531_35-Br-81.dat downloaded_endf_files/endf_35081_vii1
  rm n_3531_35-Br-81.zip 
fi 

if [ ! -f downloaded_endf_files/endf_36078_vii1 ]; then
  echo "endf_36078_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3625_36-Kr-78.zip 
  unzip n_3625_36-Kr-78.zip 
  mv n_3625_36-Kr-78.dat downloaded_endf_files/endf_36078_vii1
  rm n_3625_36-Kr-78.zip 
fi 

if [ ! -f downloaded_endf_files/endf_36080_vii1 ]; then
  echo "endf_36080_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3631_36-Kr-80.zip 
  unzip n_3631_36-Kr-80.zip 
  mv n_3631_36-Kr-80.dat downloaded_endf_files/endf_36080_vii1
  rm n_3631_36-Kr-80.zip 
fi 

if [ ! -f downloaded_endf_files/endf_36082_vii1 ]; then
  echo "endf_36082_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3637_36-Kr-82.zip 
  unzip n_3637_36-Kr-82.zip 
  mv n_3637_36-Kr-82.dat downloaded_endf_files/endf_36082_vii1
  rm n_3637_36-Kr-82.zip 
fi 

if [ ! -f downloaded_endf_files/endf_36083_vii1 ]; then
  echo "endf_36083_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3640_36-Kr-83.zip 
  unzip n_3640_36-Kr-83.zip 
  mv n_3640_36-Kr-83.dat downloaded_endf_files/endf_36083_vii1
  rm n_3640_36-Kr-83.zip 
fi 

if [ ! -f downloaded_endf_files/endf_36084_vii1 ]; then
  echo "endf_36084_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3643_36-Kr-84.zip 
  unzip n_3643_36-Kr-84.zip 
  mv n_3643_36-Kr-84.dat downloaded_endf_files/endf_36084_vii1
  rm n_3643_36-Kr-84.zip 
fi 

if [ ! -f downloaded_endf_files/endf_36085_vii1 ]; then
  echo "endf_36085_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3646_36-Kr-85.zip 
  unzip n_3646_36-Kr-85.zip 
  mv n_3646_36-Kr-85.dat downloaded_endf_files/endf_36085_vii1
  rm n_3646_36-Kr-85.zip 
fi 

if [ ! -f downloaded_endf_files/endf_36086_vii1 ]; then
  echo "endf_36086_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3649_36-Kr-86.zip 
  unzip n_3649_36-Kr-86.zip 
  mv n_3649_36-Kr-86.dat downloaded_endf_files/endf_36086_vii1
  rm n_3649_36-Kr-86.zip 
fi 

if [ ! -f downloaded_endf_files/endf_37085_vii1 ]; then
  echo "endf_37085_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3725_37-Rb-85.zip 
  unzip n_3725_37-Rb-85.zip 
  mv n_3725_37-Rb-85.dat downloaded_endf_files/endf_37085_vii1
  rm n_3725_37-Rb-85.zip 
fi 

if [ ! -f downloaded_endf_files/endf_37086_vii1 ]; then
  echo "endf_37086_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3728_37-Rb-86.zip 
  unzip n_3728_37-Rb-86.zip 
  mv n_3728_37-Rb-86.dat downloaded_endf_files/endf_37086_vii1
  rm n_3728_37-Rb-86.zip 
fi 

if [ ! -f downloaded_endf_files/endf_37087_vii1 ]; then
  echo "endf_37087_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3731_37-Rb-87.zip 
  unzip n_3731_37-Rb-87.zip 
  mv n_3731_37-Rb-87.dat downloaded_endf_files/endf_37087_vii1
  rm n_3731_37-Rb-87.zip 
fi 

if [ ! -f downloaded_endf_files/endf_38084_vii1 ]; then
  echo "endf_38084_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3825_38-Sr-84.zip 
  unzip n_3825_38-Sr-84.zip 
  mv n_3825_38-Sr-84.dat downloaded_endf_files/endf_38084_vii1
  rm n_3825_38-Sr-84.zip 
fi 

if [ ! -f downloaded_endf_files/endf_38086_vii1 ]; then
  echo "endf_38086_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3831_38-Sr-86.zip 
  unzip n_3831_38-Sr-86.zip 
  mv n_3831_38-Sr-86.dat downloaded_endf_files/endf_38086_vii1
  rm n_3831_38-Sr-86.zip 
fi 

if [ ! -f downloaded_endf_files/endf_38087_vii1 ]; then
  echo "endf_38087_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3834_38-Sr-87.zip 
  unzip n_3834_38-Sr-87.zip 
  mv n_3834_38-Sr-87.dat downloaded_endf_files/endf_38087_vii1
  rm n_3834_38-Sr-87.zip 
fi 

if [ ! -f downloaded_endf_files/endf_38088_vii1 ]; then
  echo "endf_38088_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3837_38-Sr-88.zip 
  unzip n_3837_38-Sr-88.zip 
  mv n_3837_38-Sr-88.dat downloaded_endf_files/endf_38088_vii1
  rm n_3837_38-Sr-88.zip 
fi 

if [ ! -f downloaded_endf_files/endf_38089_vii1 ]; then
  echo "endf_38089_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3840_38-Sr-89.zip 
  unzip n_3840_38-Sr-89.zip 
  mv n_3840_38-Sr-89.dat downloaded_endf_files/endf_38089_vii1
  rm n_3840_38-Sr-89.zip 
fi 

if [ ! -f downloaded_endf_files/endf_38090_vii1 ]; then
  echo "endf_38090_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3843_38-Sr-90.zip 
  unzip n_3843_38-Sr-90.zip 
  mv n_3843_38-Sr-90.dat downloaded_endf_files/endf_38090_vii1
  rm n_3843_38-Sr-90.zip 
fi 

if [ ! -f downloaded_endf_files/endf_39089_vii1 ]; then
  echo "endf_39089_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3925_39-Y-89.zip 
  unzip n_3925_39-Y-89.zip 
  mv n_3925_39-Y-89.dat downloaded_endf_files/endf_39089_vii1
  rm n_3925_39-Y-89.zip 
fi 

if [ ! -f downloaded_endf_files/endf_39090_vii1 ]; then
  echo "endf_39090_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3928_39-Y-90.zip 
  unzip n_3928_39-Y-90.zip 
  mv n_3928_39-Y-90.dat downloaded_endf_files/endf_39090_vii1
  rm n_3928_39-Y-90.zip 
fi 

if [ ! -f downloaded_endf_files/endf_39091_vii1 ]; then
  echo "endf_39091_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_3931_39-Y-91.zip 
  unzip n_3931_39-Y-91.zip 
  mv n_3931_39-Y-91.dat downloaded_endf_files/endf_39091_vii1
  rm n_3931_39-Y-91.zip 
fi 

if [ ! -f downloaded_endf_files/endf_40090_vii1 ]; then
  echo "endf_40090_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4025_40-Zr-90.zip 
  unzip n_4025_40-Zr-90.zip 
  mv n_4025_40-Zr-90.dat downloaded_endf_files/endf_40090_vii1
  rm n_4025_40-Zr-90.zip 
fi 

if [ ! -f downloaded_endf_files/endf_40091_vii1 ]; then
  echo "endf_40091_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4028_40-Zr-91.zip 
  unzip n_4028_40-Zr-91.zip 
  mv n_4028_40-Zr-91.dat downloaded_endf_files/endf_40091_vii1
  rm n_4028_40-Zr-91.zip 
fi 

if [ ! -f downloaded_endf_files/endf_40092_vii1 ]; then
  echo "endf_40092_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4031_40-Zr-92.zip 
  unzip n_4031_40-Zr-92.zip 
  mv n_4031_40-Zr-92.dat downloaded_endf_files/endf_40092_vii1
  rm n_4031_40-Zr-92.zip 
fi 

if [ ! -f downloaded_endf_files/endf_40093_vii1 ]; then
  echo "endf_40093_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4034_40-Zr-93.zip 
  unzip n_4034_40-Zr-93.zip 
  mv n_4034_40-Zr-93.dat downloaded_endf_files/endf_40093_vii1
  rm n_4034_40-Zr-93.zip 
fi 

if [ ! -f downloaded_endf_files/endf_40094_vii1 ]; then
  echo "endf_40094_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4037_40-Zr-94.zip 
  unzip n_4037_40-Zr-94.zip 
  mv n_4037_40-Zr-94.dat downloaded_endf_files/endf_40094_vii1
  rm n_4037_40-Zr-94.zip 
fi 

if [ ! -f downloaded_endf_files/endf_40095_vii1 ]; then
  echo "endf_40095_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4040_40-Zr-95.zip 
  unzip n_4040_40-Zr-95.zip 
  mv n_4040_40-Zr-95.dat downloaded_endf_files/endf_40095_vii1
  rm n_4040_40-Zr-95.zip 
fi 

if [ ! -f downloaded_endf_files/endf_40096_vii1 ]; then
  echo "endf_40096_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4043_40-Zr-96.zip 
  unzip n_4043_40-Zr-96.zip 
  mv n_4043_40-Zr-96.dat downloaded_endf_files/endf_40096_vii1
  rm n_4043_40-Zr-96.zip 
fi 

if [ ! -f downloaded_endf_files/endf_41093_vii1 ]; then
  echo "endf_41093_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4125_41-Nb-93.zip 
  unzip n_4125_41-Nb-93.zip 
  mv n_4125_41-Nb-93.dat downloaded_endf_files/endf_41093_vii1
  rm n_4125_41-Nb-93.zip 
fi 

if [ ! -f downloaded_endf_files/endf_41094_vii1 ]; then
  echo "endf_41094_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4128_41-Nb-94.zip 
  unzip n_4128_41-Nb-94.zip 
  mv n_4128_41-Nb-94.dat downloaded_endf_files/endf_41094_vii1
  rm n_4128_41-Nb-94.zip 
fi 

if [ ! -f downloaded_endf_files/endf_41095_vii1 ]; then
  echo "endf_41095_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4131_41-Nb-95.zip 
  unzip n_4131_41-Nb-95.zip 
  mv n_4131_41-Nb-95.dat downloaded_endf_files/endf_41095_vii1
  rm n_4131_41-Nb-95.zip 
fi 

if [ ! -f downloaded_endf_files/endf_42092_vii1 ]; then
  echo "endf_42092_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4225_42-Mo-92.zip 
  unzip n_4225_42-Mo-92.zip 
  mv n_4225_42-Mo-92.dat downloaded_endf_files/endf_42092_vii1
  rm n_4225_42-Mo-92.zip 
fi 

if [ ! -f downloaded_endf_files/endf_42094_vii1 ]; then
  echo "endf_42094_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4231_42-Mo-94.zip 
  unzip n_4231_42-Mo-94.zip 
  mv n_4231_42-Mo-94.dat downloaded_endf_files/endf_42094_vii1
  rm n_4231_42-Mo-94.zip 
fi 

if [ ! -f downloaded_endf_files/endf_42095_vii1 ]; then
  echo "endf_42095_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4234_42-Mo-95.zip 
  unzip n_4234_42-Mo-95.zip 
  mv n_4234_42-Mo-95.dat downloaded_endf_files/endf_42095_vii1
  rm n_4234_42-Mo-95.zip 
fi 

if [ ! -f downloaded_endf_files/endf_42096_vii1 ]; then
  echo "endf_42096_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4237_42-Mo-96.zip 
  unzip n_4237_42-Mo-96.zip 
  mv n_4237_42-Mo-96.dat downloaded_endf_files/endf_42096_vii1
  rm n_4237_42-Mo-96.zip 
fi 

if [ ! -f downloaded_endf_files/endf_42097_vii1 ]; then
  echo "endf_42097_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4240_42-Mo-97.zip 
  unzip n_4240_42-Mo-97.zip 
  mv n_4240_42-Mo-97.dat downloaded_endf_files/endf_42097_vii1
  rm n_4240_42-Mo-97.zip 
fi 

if [ ! -f downloaded_endf_files/endf_42098_vii1 ]; then
  echo "endf_42098_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4243_42-Mo-98.zip 
  unzip n_4243_42-Mo-98.zip 
  mv n_4243_42-Mo-98.dat downloaded_endf_files/endf_42098_vii1
  rm n_4243_42-Mo-98.zip 
fi 

if [ ! -f downloaded_endf_files/endf_42099_vii1 ]; then
  echo "endf_42099_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4246_42-Mo-99.zip 
  unzip n_4246_42-Mo-99.zip 
  mv n_4246_42-Mo-99.dat downloaded_endf_files/endf_42099_vii1
  rm n_4246_42-Mo-99.zip 
fi 

if [ ! -f downloaded_endf_files/endf_42100_vii1 ]; then
  echo "endf_42100_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4249_42-Mo-100.zip 
  unzip n_4249_42-Mo-100.zip 
  mv n_4249_42-Mo-100.dat downloaded_endf_files/endf_42100_vii1
  rm n_4249_42-Mo-100.zip 
fi 

if [ ! -f downloaded_endf_files/endf_43099_vii1 ]; then
  echo "endf_43099_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4325_43-Tc-99.zip 
  unzip n_4325_43-Tc-99.zip 
  mv n_4325_43-Tc-99.dat downloaded_endf_files/endf_43099_vii1
  rm n_4325_43-Tc-99.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44096_vii1 ]; then
  echo "endf_44096_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4425_44-Ru-96.zip 
  unzip n_4425_44-Ru-96.zip 
  mv n_4425_44-Ru-96.dat downloaded_endf_files/endf_44096_vii1
  rm n_4425_44-Ru-96.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44098_vii1 ]; then
  echo "endf_44098_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4431_44-Ru-98.zip 
  unzip n_4431_44-Ru-98.zip 
  mv n_4431_44-Ru-98.dat downloaded_endf_files/endf_44098_vii1
  rm n_4431_44-Ru-98.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44099_vii1 ]; then
  echo "endf_44099_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4434_44-Ru-99.zip 
  unzip n_4434_44-Ru-99.zip 
  mv n_4434_44-Ru-99.dat downloaded_endf_files/endf_44099_vii1
  rm n_4434_44-Ru-99.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44100_vii1 ]; then
  echo "endf_44100_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4437_44-Ru-100.zip 
  unzip n_4437_44-Ru-100.zip 
  mv n_4437_44-Ru-100.dat downloaded_endf_files/endf_44100_vii1
  rm n_4437_44-Ru-100.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44101_vii1 ]; then
  echo "endf_44101_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4440_44-Ru-101.zip 
  unzip n_4440_44-Ru-101.zip 
  mv n_4440_44-Ru-101.dat downloaded_endf_files/endf_44101_vii1
  rm n_4440_44-Ru-101.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44102_vii1 ]; then
  echo "endf_44102_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4443_44-Ru-102.zip 
  unzip n_4443_44-Ru-102.zip 
  mv n_4443_44-Ru-102.dat downloaded_endf_files/endf_44102_vii1
  rm n_4443_44-Ru-102.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44103_vii1 ]; then
  echo "endf_44103_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4446_44-Ru-103.zip 
  unzip n_4446_44-Ru-103.zip 
  mv n_4446_44-Ru-103.dat downloaded_endf_files/endf_44103_vii1
  rm n_4446_44-Ru-103.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44104_vii1 ]; then
  echo "endf_44104_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4449_44-Ru-104.zip 
  unzip n_4449_44-Ru-104.zip 
  mv n_4449_44-Ru-104.dat downloaded_endf_files/endf_44104_vii1
  rm n_4449_44-Ru-104.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44105_vii1 ]; then
  echo "endf_44105_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4452_44-Ru-105.zip 
  unzip n_4452_44-Ru-105.zip 
  mv n_4452_44-Ru-105.dat downloaded_endf_files/endf_44105_vii1
  rm n_4452_44-Ru-105.zip 
fi 

if [ ! -f downloaded_endf_files/endf_44106_vii1 ]; then
  echo "endf_44106_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4455_44-Ru-106.zip 
  unzip n_4455_44-Ru-106.zip 
  mv n_4455_44-Ru-106.dat downloaded_endf_files/endf_44106_vii1
  rm n_4455_44-Ru-106.zip 
fi 

if [ ! -f downloaded_endf_files/endf_45103_vii1 ]; then
  echo "endf_45103_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4525_45-Rh-103.zip 
  unzip n_4525_45-Rh-103.zip 
  mv n_4525_45-Rh-103.dat downloaded_endf_files/endf_45103_vii1
  rm n_4525_45-Rh-103.zip 
fi 

if [ ! -f downloaded_endf_files/endf_45105_vii1 ]; then
  echo "endf_45105_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4531_45-Rh-105.zip 
  unzip n_4531_45-Rh-105.zip 
  mv n_4531_45-Rh-105.dat downloaded_endf_files/endf_45105_vii1
  rm n_4531_45-Rh-105.zip 
fi 

if [ ! -f downloaded_endf_files/endf_46102_vii1 ]; then
  echo "endf_46102_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4625_46-Pd-102.zip 
  unzip n_4625_46-Pd-102.zip 
  mv n_4625_46-Pd-102.dat downloaded_endf_files/endf_46102_vii1
  rm n_4625_46-Pd-102.zip 
fi 

if [ ! -f downloaded_endf_files/endf_46104_vii1 ]; then
  echo "endf_46104_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4631_46-Pd-104.zip 
  unzip n_4631_46-Pd-104.zip 
  mv n_4631_46-Pd-104.dat downloaded_endf_files/endf_46104_vii1
  rm n_4631_46-Pd-104.zip 
fi 

if [ ! -f downloaded_endf_files/endf_46105_vii1 ]; then
  echo "endf_46105_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4634_46-Pd-105.zip 
  unzip n_4634_46-Pd-105.zip 
  mv n_4634_46-Pd-105.dat downloaded_endf_files/endf_46105_vii1
  rm n_4634_46-Pd-105.zip 
fi 

if [ ! -f downloaded_endf_files/endf_46106_vii1 ]; then
  echo "endf_46106_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4637_46-Pd-106.zip 
  unzip n_4637_46-Pd-106.zip 
  mv n_4637_46-Pd-106.dat downloaded_endf_files/endf_46106_vii1
  rm n_4637_46-Pd-106.zip 
fi 

if [ ! -f downloaded_endf_files/endf_46107_vii1 ]; then
  echo "endf_46107_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4640_46-Pd-107.zip 
  unzip n_4640_46-Pd-107.zip 
  mv n_4640_46-Pd-107.dat downloaded_endf_files/endf_46107_vii1
  rm n_4640_46-Pd-107.zip 
fi 

if [ ! -f downloaded_endf_files/endf_46108_vii1 ]; then
  echo "endf_46108_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4643_46-Pd-108.zip 
  unzip n_4643_46-Pd-108.zip 
  mv n_4643_46-Pd-108.dat downloaded_endf_files/endf_46108_vii1
  rm n_4643_46-Pd-108.zip 
fi 

if [ ! -f downloaded_endf_files/endf_46110_vii1 ]; then
  echo "endf_46110_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4649_46-Pd-110.zip 
  unzip n_4649_46-Pd-110.zip 
  mv n_4649_46-Pd-110.dat downloaded_endf_files/endf_46110_vii1
  rm n_4649_46-Pd-110.zip 
fi 

if [ ! -f downloaded_endf_files/endf_47107_vii1 ]; then
  echo "endf_47107_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4725_47-Ag-107.zip 
  unzip n_4725_47-Ag-107.zip 
  mv n_4725_47-Ag-107.dat downloaded_endf_files/endf_47107_vii1
  rm n_4725_47-Ag-107.zip 
fi 

if [ ! -f downloaded_endf_files/endf_47109_vii1 ]; then
  echo "endf_47109_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4731_47-Ag-109.zip 
  unzip n_4731_47-Ag-109.zip 
  mv n_4731_47-Ag-109.dat downloaded_endf_files/endf_47109_vii1
  rm n_4731_47-Ag-109.zip 
fi 

if [ ! -f downloaded_endf_files/endf_47110m_vii1 ]; then
  echo "endf_47110m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4735_47-Ag-110M.zip 
  unzip n_4735_47-Ag-110M.zip 
  mv n_4735_47-Ag-110M.dat downloaded_endf_files/endf_47110m_vii1
  rm n_4735_47-Ag-110M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_47111_vii1 ]; then
  echo "endf_47111_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4737_47-Ag-111.zip 
  unzip n_4737_47-Ag-111.zip 
  mv n_4737_47-Ag-111.dat downloaded_endf_files/endf_47111_vii1
  rm n_4737_47-Ag-111.zip 
fi 

if [ ! -f downloaded_endf_files/endf_48106_vii1 ]; then
  echo "endf_48106_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4825_48-Cd-106.zip 
  unzip n_4825_48-Cd-106.zip 
  mv n_4825_48-Cd-106.dat downloaded_endf_files/endf_48106_vii1
  rm n_4825_48-Cd-106.zip 
fi 

if [ ! -f downloaded_endf_files/endf_48108_vii1 ]; then
  echo "endf_48108_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4831_48-Cd-108.zip 
  unzip n_4831_48-Cd-108.zip 
  mv n_4831_48-Cd-108.dat downloaded_endf_files/endf_48108_vii1
  rm n_4831_48-Cd-108.zip 
fi 

if [ ! -f downloaded_endf_files/endf_48110_vii1 ]; then
  echo "endf_48110_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4837_48-Cd-110.zip 
  unzip n_4837_48-Cd-110.zip 
  mv n_4837_48-Cd-110.dat downloaded_endf_files/endf_48110_vii1
  rm n_4837_48-Cd-110.zip 
fi 

if [ ! -f downloaded_endf_files/endf_48111_vii1 ]; then
  echo "endf_48111_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4840_48-Cd-111.zip 
  unzip n_4840_48-Cd-111.zip 
  mv n_4840_48-Cd-111.dat downloaded_endf_files/endf_48111_vii1
  rm n_4840_48-Cd-111.zip 
fi 

if [ ! -f downloaded_endf_files/endf_48112_vii1 ]; then
  echo "endf_48112_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4843_48-Cd-112.zip 
  unzip n_4843_48-Cd-112.zip 
  mv n_4843_48-Cd-112.dat downloaded_endf_files/endf_48112_vii1
  rm n_4843_48-Cd-112.zip 
fi 

if [ ! -f downloaded_endf_files/endf_48113_vii1 ]; then
  echo "endf_48113_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4846_48-Cd-113.zip 
  unzip n_4846_48-Cd-113.zip 
  mv n_4846_48-Cd-113.dat downloaded_endf_files/endf_48113_vii1
  rm n_4846_48-Cd-113.zip 
fi 

if [ ! -f downloaded_endf_files/endf_48114_vii1 ]; then
  echo "endf_48114_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4849_48-Cd-114.zip 
  unzip n_4849_48-Cd-114.zip 
  mv n_4849_48-Cd-114.dat downloaded_endf_files/endf_48114_vii1
  rm n_4849_48-Cd-114.zip 
fi 

if [ ! -f downloaded_endf_files/endf_48115m_vii1 ]; then
  echo "endf_48115m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4853_48-Cd-115M.zip 
  unzip n_4853_48-Cd-115M.zip 
  mv n_4853_48-Cd-115M.dat downloaded_endf_files/endf_48115m_vii1
  rm n_4853_48-Cd-115M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_48116_vii1 ]; then
  echo "endf_48116_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4855_48-Cd-116.zip 
  unzip n_4855_48-Cd-116.zip 
  mv n_4855_48-Cd-116.dat downloaded_endf_files/endf_48116_vii1
  rm n_4855_48-Cd-116.zip 
fi 

if [ ! -f downloaded_endf_files/endf_49113_vii1 ]; then
  echo "endf_49113_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4925_49-In-113.zip 
  unzip n_4925_49-In-113.zip 
  mv n_4925_49-In-113.dat downloaded_endf_files/endf_49113_vii1
  rm n_4925_49-In-113.zip 
fi 

if [ ! -f downloaded_endf_files/endf_49115_vii1 ]; then
  echo "endf_49115_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_4931_49-In-115.zip 
  unzip n_4931_49-In-115.zip 
  mv n_4931_49-In-115.dat downloaded_endf_files/endf_49115_vii1
  rm n_4931_49-In-115.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50112_vii1 ]; then
  echo "endf_50112_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5025_50-Sn-112.zip 
  unzip n_5025_50-Sn-112.zip 
  mv n_5025_50-Sn-112.dat downloaded_endf_files/endf_50112_vii1
  rm n_5025_50-Sn-112.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50113_vii1 ]; then
  echo "endf_50113_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5028_50-Sn-113.zip 
  unzip n_5028_50-Sn-113.zip 
  mv n_5028_50-Sn-113.dat downloaded_endf_files/endf_50113_vii1
  rm n_5028_50-Sn-113.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50114_vii1 ]; then
  echo "endf_50114_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5031_50-Sn-114.zip 
  unzip n_5031_50-Sn-114.zip 
  mv n_5031_50-Sn-114.dat downloaded_endf_files/endf_50114_vii1
  rm n_5031_50-Sn-114.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50115_vii1 ]; then
  echo "endf_50115_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5034_50-Sn-115.zip 
  unzip n_5034_50-Sn-115.zip 
  mv n_5034_50-Sn-115.dat downloaded_endf_files/endf_50115_vii1
  rm n_5034_50-Sn-115.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50116_vii1 ]; then
  echo "endf_50116_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5037_50-Sn-116.zip 
  unzip n_5037_50-Sn-116.zip 
  mv n_5037_50-Sn-116.dat downloaded_endf_files/endf_50116_vii1
  rm n_5037_50-Sn-116.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50117_vii1 ]; then
  echo "endf_50117_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5040_50-Sn-117.zip 
  unzip n_5040_50-Sn-117.zip 
  mv n_5040_50-Sn-117.dat downloaded_endf_files/endf_50117_vii1
  rm n_5040_50-Sn-117.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50118_vii1 ]; then
  echo "endf_50118_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5043_50-Sn-118.zip 
  unzip n_5043_50-Sn-118.zip 
  mv n_5043_50-Sn-118.dat downloaded_endf_files/endf_50118_vii1
  rm n_5043_50-Sn-118.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50119_vii1 ]; then
  echo "endf_50119_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5046_50-Sn-119.zip 
  unzip n_5046_50-Sn-119.zip 
  mv n_5046_50-Sn-119.dat downloaded_endf_files/endf_50119_vii1
  rm n_5046_50-Sn-119.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50120_vii1 ]; then
  echo "endf_50120_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5049_50-Sn-120.zip 
  unzip n_5049_50-Sn-120.zip 
  mv n_5049_50-Sn-120.dat downloaded_endf_files/endf_50120_vii1
  rm n_5049_50-Sn-120.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50122_vii1 ]; then
  echo "endf_50122_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5055_50-Sn-122.zip 
  unzip n_5055_50-Sn-122.zip 
  mv n_5055_50-Sn-122.dat downloaded_endf_files/endf_50122_vii1
  rm n_5055_50-Sn-122.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50123_vii1 ]; then
  echo "endf_50123_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5058_50-Sn-123.zip 
  unzip n_5058_50-Sn-123.zip 
  mv n_5058_50-Sn-123.dat downloaded_endf_files/endf_50123_vii1
  rm n_5058_50-Sn-123.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50124_vii1 ]; then
  echo "endf_50124_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5061_50-Sn-124.zip 
  unzip n_5061_50-Sn-124.zip 
  mv n_5061_50-Sn-124.dat downloaded_endf_files/endf_50124_vii1
  rm n_5061_50-Sn-124.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50125_vii1 ]; then
  echo "endf_50125_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5064_50-Sn-125.zip 
  unzip n_5064_50-Sn-125.zip 
  mv n_5064_50-Sn-125.dat downloaded_endf_files/endf_50125_vii1
  rm n_5064_50-Sn-125.zip 
fi 

if [ ! -f downloaded_endf_files/endf_50126_vii1 ]; then
  echo "endf_50126_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5067_50-Sn-126.zip 
  unzip n_5067_50-Sn-126.zip 
  mv n_5067_50-Sn-126.dat downloaded_endf_files/endf_50126_vii1
  rm n_5067_50-Sn-126.zip 
fi 

if [ ! -f downloaded_endf_files/endf_51121_vii1 ]; then
  echo "endf_51121_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5125_51-Sb-121.zip 
  unzip n_5125_51-Sb-121.zip 
  mv n_5125_51-Sb-121.dat downloaded_endf_files/endf_51121_vii1
  rm n_5125_51-Sb-121.zip 
fi 

if [ ! -f downloaded_endf_files/endf_51123_vii1 ]; then
  echo "endf_51123_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5131_51-Sb-123.zip 
  unzip n_5131_51-Sb-123.zip 
  mv n_5131_51-Sb-123.dat downloaded_endf_files/endf_51123_vii1
  rm n_5131_51-Sb-123.zip 
fi 

if [ ! -f downloaded_endf_files/endf_51124_vii1 ]; then
  echo "endf_51124_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5134_51-Sb-124.zip 
  unzip n_5134_51-Sb-124.zip 
  mv n_5134_51-Sb-124.dat downloaded_endf_files/endf_51124_vii1
  rm n_5134_51-Sb-124.zip 
fi 

if [ ! -f downloaded_endf_files/endf_51125_vii1 ]; then
  echo "endf_51125_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5137_51-Sb-125.zip 
  unzip n_5137_51-Sb-125.zip 
  mv n_5137_51-Sb-125.dat downloaded_endf_files/endf_51125_vii1
  rm n_5137_51-Sb-125.zip 
fi 

if [ ! -f downloaded_endf_files/endf_51126_vii1 ]; then
  echo "endf_51126_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5140_51-Sb-126.zip 
  unzip n_5140_51-Sb-126.zip 
  mv n_5140_51-Sb-126.dat downloaded_endf_files/endf_51126_vii1
  rm n_5140_51-Sb-126.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52120_vii1 ]; then
  echo "endf_52120_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5225_52-Te-120.zip 
  unzip n_5225_52-Te-120.zip 
  mv n_5225_52-Te-120.dat downloaded_endf_files/endf_52120_vii1
  rm n_5225_52-Te-120.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52122_vii1 ]; then
  echo "endf_52122_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5231_52-Te-122.zip 
  unzip n_5231_52-Te-122.zip 
  mv n_5231_52-Te-122.dat downloaded_endf_files/endf_52122_vii1
  rm n_5231_52-Te-122.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52123_vii1 ]; then
  echo "endf_52123_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5234_52-Te-123.zip 
  unzip n_5234_52-Te-123.zip 
  mv n_5234_52-Te-123.dat downloaded_endf_files/endf_52123_vii1
  rm n_5234_52-Te-123.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52124_vii1 ]; then
  echo "endf_52124_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5237_52-Te-124.zip 
  unzip n_5237_52-Te-124.zip 
  mv n_5237_52-Te-124.dat downloaded_endf_files/endf_52124_vii1
  rm n_5237_52-Te-124.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52125_vii1 ]; then
  echo "endf_52125_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5240_52-Te-125.zip 
  unzip n_5240_52-Te-125.zip 
  mv n_5240_52-Te-125.dat downloaded_endf_files/endf_52125_vii1
  rm n_5240_52-Te-125.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52126_vii1 ]; then
  echo "endf_52126_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5243_52-Te-126.zip 
  unzip n_5243_52-Te-126.zip 
  mv n_5243_52-Te-126.dat downloaded_endf_files/endf_52126_vii1
  rm n_5243_52-Te-126.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52127m_vii1 ]; then
  echo "endf_52127m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5247_52-Te-127M.zip 
  unzip n_5247_52-Te-127M.zip 
  mv n_5247_52-Te-127M.dat downloaded_endf_files/endf_52127m_vii1
  rm n_5247_52-Te-127M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52128_vii1 ]; then
  echo "endf_52128_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5249_52-Te-128.zip 
  unzip n_5249_52-Te-128.zip 
  mv n_5249_52-Te-128.dat downloaded_endf_files/endf_52128_vii1
  rm n_5249_52-Te-128.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52129m_vii1 ]; then
  echo "endf_52129m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5253_52-Te-129M.zip 
  unzip n_5253_52-Te-129M.zip 
  mv n_5253_52-Te-129M.dat downloaded_endf_files/endf_52129m_vii1
  rm n_5253_52-Te-129M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52130_vii1 ]; then
  echo "endf_52130_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5255_52-Te-130.zip 
  unzip n_5255_52-Te-130.zip 
  mv n_5255_52-Te-130.dat downloaded_endf_files/endf_52130_vii1
  rm n_5255_52-Te-130.zip 
fi 

if [ ! -f downloaded_endf_files/endf_52132_vii1 ]; then
  echo "endf_52132_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5261_52-Te-132.zip 
  unzip n_5261_52-Te-132.zip 
  mv n_5261_52-Te-132.dat downloaded_endf_files/endf_52132_vii1
  rm n_5261_52-Te-132.zip 
fi 

if [ ! -f downloaded_endf_files/endf_53127_vii1 ]; then
  echo "endf_53127_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5325_53-I-127.zip 
  unzip n_5325_53-I-127.zip 
  mv n_5325_53-I-127.dat downloaded_endf_files/endf_53127_vii1
  rm n_5325_53-I-127.zip 
fi 

if [ ! -f downloaded_endf_files/endf_53129_vii1 ]; then
  echo "endf_53129_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5331_53-I-129.zip 
  unzip n_5331_53-I-129.zip 
  mv n_5331_53-I-129.dat downloaded_endf_files/endf_53129_vii1
  rm n_5331_53-I-129.zip 
fi 

if [ ! -f downloaded_endf_files/endf_53130_vii1 ]; then
  echo "endf_53130_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5334_53-I-130.zip 
  unzip n_5334_53-I-130.zip 
  mv n_5334_53-I-130.dat downloaded_endf_files/endf_53130_vii1
  rm n_5334_53-I-130.zip 
fi 

if [ ! -f downloaded_endf_files/endf_53131_vii1 ]; then
  echo "endf_53131_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5337_53-I-131.zip 
  unzip n_5337_53-I-131.zip 
  mv n_5337_53-I-131.dat downloaded_endf_files/endf_53131_vii1
  rm n_5337_53-I-131.zip 
fi 

if [ ! -f downloaded_endf_files/endf_53135_vii1 ]; then
  echo "endf_53135_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5349_53-I-135.zip 
  unzip n_5349_53-I-135.zip 
  mv n_5349_53-I-135.dat downloaded_endf_files/endf_53135_vii1
  rm n_5349_53-I-135.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54123_vii1 ]; then
  echo "endf_54123_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5422_54-Xe-123.zip 
  unzip n_5422_54-Xe-123.zip 
  mv n_5422_54-Xe-123.dat downloaded_endf_files/endf_54123_vii1
  rm n_5422_54-Xe-123.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54124_vii1 ]; then
  echo "endf_54124_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5425_54-Xe-124.zip 
  unzip n_5425_54-Xe-124.zip 
  mv n_5425_54-Xe-124.dat downloaded_endf_files/endf_54124_vii1
  rm n_5425_54-Xe-124.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54126_vii1 ]; then
  echo "endf_54126_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5431_54-Xe-126.zip 
  unzip n_5431_54-Xe-126.zip 
  mv n_5431_54-Xe-126.dat downloaded_endf_files/endf_54126_vii1
  rm n_5431_54-Xe-126.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54128_vii1 ]; then
  echo "endf_54128_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5437_54-Xe-128.zip 
  unzip n_5437_54-Xe-128.zip 
  mv n_5437_54-Xe-128.dat downloaded_endf_files/endf_54128_vii1
  rm n_5437_54-Xe-128.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54129_vii1 ]; then
  echo "endf_54129_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5440_54-Xe-129.zip 
  unzip n_5440_54-Xe-129.zip 
  mv n_5440_54-Xe-129.dat downloaded_endf_files/endf_54129_vii1
  rm n_5440_54-Xe-129.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54130_vii1 ]; then
  echo "endf_54130_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5443_54-Xe-130.zip 
  unzip n_5443_54-Xe-130.zip 
  mv n_5443_54-Xe-130.dat downloaded_endf_files/endf_54130_vii1
  rm n_5443_54-Xe-130.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54131_vii1 ]; then
  echo "endf_54131_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5446_54-Xe-131.zip 
  unzip n_5446_54-Xe-131.zip 
  mv n_5446_54-Xe-131.dat downloaded_endf_files/endf_54131_vii1
  rm n_5446_54-Xe-131.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54132_vii1 ]; then
  echo "endf_54132_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5449_54-Xe-132.zip 
  unzip n_5449_54-Xe-132.zip 
  mv n_5449_54-Xe-132.dat downloaded_endf_files/endf_54132_vii1
  rm n_5449_54-Xe-132.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54133_vii1 ]; then
  echo "endf_54133_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5452_54-Xe-133.zip 
  unzip n_5452_54-Xe-133.zip 
  mv n_5452_54-Xe-133.dat downloaded_endf_files/endf_54133_vii1
  rm n_5452_54-Xe-133.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54134_vii1 ]; then
  echo "endf_54134_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5455_54-Xe-134.zip 
  unzip n_5455_54-Xe-134.zip 
  mv n_5455_54-Xe-134.dat downloaded_endf_files/endf_54134_vii1
  rm n_5455_54-Xe-134.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54135_vii1 ]; then
  echo "endf_54135_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5458_54-Xe-135.zip 
  unzip n_5458_54-Xe-135.zip 
  mv n_5458_54-Xe-135.dat downloaded_endf_files/endf_54135_vii1
  rm n_5458_54-Xe-135.zip 
fi 

if [ ! -f downloaded_endf_files/endf_54136_vii1 ]; then
  echo "endf_54136_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5461_54-Xe-136.zip 
  unzip n_5461_54-Xe-136.zip 
  mv n_5461_54-Xe-136.dat downloaded_endf_files/endf_54136_vii1
  rm n_5461_54-Xe-136.zip 
fi 

if [ ! -f downloaded_endf_files/endf_55133_vii1 ]; then
  echo "endf_55133_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5525_55-Cs-133.zip 
  unzip n_5525_55-Cs-133.zip 
  mv n_5525_55-Cs-133.dat downloaded_endf_files/endf_55133_vii1
  rm n_5525_55-Cs-133.zip 
fi 

if [ ! -f downloaded_endf_files/endf_55134_vii1 ]; then
  echo "endf_55134_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5528_55-Cs-134.zip 
  unzip n_5528_55-Cs-134.zip 
  mv n_5528_55-Cs-134.dat downloaded_endf_files/endf_55134_vii1
  rm n_5528_55-Cs-134.zip 
fi 

if [ ! -f downloaded_endf_files/endf_55135_vii1 ]; then
  echo "endf_55135_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5531_55-Cs-135.zip 
  unzip n_5531_55-Cs-135.zip 
  mv n_5531_55-Cs-135.dat downloaded_endf_files/endf_55135_vii1
  rm n_5531_55-Cs-135.zip 
fi 

if [ ! -f downloaded_endf_files/endf_55136_vii1 ]; then
  echo "endf_55136_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5534_55-Cs-136.zip 
  unzip n_5534_55-Cs-136.zip 
  mv n_5534_55-Cs-136.dat downloaded_endf_files/endf_55136_vii1
  rm n_5534_55-Cs-136.zip 
fi 

if [ ! -f downloaded_endf_files/endf_55137_vii1 ]; then
  echo "endf_55137_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5537_55-Cs-137.zip 
  unzip n_5537_55-Cs-137.zip 
  mv n_5537_55-Cs-137.dat downloaded_endf_files/endf_55137_vii1
  rm n_5537_55-Cs-137.zip 
fi 

if [ ! -f downloaded_endf_files/endf_56130_vii1 ]; then
  echo "endf_56130_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5625_56-Ba-130.zip 
  unzip n_5625_56-Ba-130.zip 
  mv n_5625_56-Ba-130.dat downloaded_endf_files/endf_56130_vii1
  rm n_5625_56-Ba-130.zip 
fi 

if [ ! -f downloaded_endf_files/endf_56132_vii1 ]; then
  echo "endf_56132_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5631_56-Ba-132.zip 
  unzip n_5631_56-Ba-132.zip 
  mv n_5631_56-Ba-132.dat downloaded_endf_files/endf_56132_vii1
  rm n_5631_56-Ba-132.zip 
fi 

if [ ! -f downloaded_endf_files/endf_56133_vii1 ]; then
  echo "endf_56133_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5634_56-Ba-133.zip 
  unzip n_5634_56-Ba-133.zip 
  mv n_5634_56-Ba-133.dat downloaded_endf_files/endf_56133_vii1
  rm n_5634_56-Ba-133.zip 
fi 

if [ ! -f downloaded_endf_files/endf_56134_vii1 ]; then
  echo "endf_56134_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5637_56-Ba-134.zip 
  unzip n_5637_56-Ba-134.zip 
  mv n_5637_56-Ba-134.dat downloaded_endf_files/endf_56134_vii1
  rm n_5637_56-Ba-134.zip 
fi 

if [ ! -f downloaded_endf_files/endf_56135_vii1 ]; then
  echo "endf_56135_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5640_56-Ba-135.zip 
  unzip n_5640_56-Ba-135.zip 
  mv n_5640_56-Ba-135.dat downloaded_endf_files/endf_56135_vii1
  rm n_5640_56-Ba-135.zip 
fi 

if [ ! -f downloaded_endf_files/endf_56136_vii1 ]; then
  echo "endf_56136_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5643_56-Ba-136.zip 
  unzip n_5643_56-Ba-136.zip 
  mv n_5643_56-Ba-136.dat downloaded_endf_files/endf_56136_vii1
  rm n_5643_56-Ba-136.zip 
fi 

if [ ! -f downloaded_endf_files/endf_56137_vii1 ]; then
  echo "endf_56137_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5646_56-Ba-137.zip 
  unzip n_5646_56-Ba-137.zip 
  mv n_5646_56-Ba-137.dat downloaded_endf_files/endf_56137_vii1
  rm n_5646_56-Ba-137.zip 
fi 

if [ ! -f downloaded_endf_files/endf_56138_vii1 ]; then
  echo "endf_56138_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5649_56-Ba-138.zip 
  unzip n_5649_56-Ba-138.zip 
  mv n_5649_56-Ba-138.dat downloaded_endf_files/endf_56138_vii1
  rm n_5649_56-Ba-138.zip 
fi 

if [ ! -f downloaded_endf_files/endf_56140_vii1 ]; then
  echo "endf_56140_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5655_56-Ba-140.zip 
  unzip n_5655_56-Ba-140.zip 
  mv n_5655_56-Ba-140.dat downloaded_endf_files/endf_56140_vii1
  rm n_5655_56-Ba-140.zip 
fi 

if [ ! -f downloaded_endf_files/endf_57138_vii1 ]; then
  echo "endf_57138_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5725_57-La-138.zip 
  unzip n_5725_57-La-138.zip 
  mv n_5725_57-La-138.dat downloaded_endf_files/endf_57138_vii1
  rm n_5725_57-La-138.zip 
fi 

if [ ! -f downloaded_endf_files/endf_57139_vii1 ]; then
  echo "endf_57139_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5728_57-La-139.zip 
  unzip n_5728_57-La-139.zip 
  mv n_5728_57-La-139.dat downloaded_endf_files/endf_57139_vii1
  rm n_5728_57-La-139.zip 
fi 

if [ ! -f downloaded_endf_files/endf_57140_vii1 ]; then
  echo "endf_57140_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5731_57-La-140.zip 
  unzip n_5731_57-La-140.zip 
  mv n_5731_57-La-140.dat downloaded_endf_files/endf_57140_vii1
  rm n_5731_57-La-140.zip 
fi 

if [ ! -f downloaded_endf_files/endf_58136_vii1 ]; then
  echo "endf_58136_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5825_58-Ce-136.zip 
  unzip n_5825_58-Ce-136.zip 
  mv n_5825_58-Ce-136.dat downloaded_endf_files/endf_58136_vii1
  rm n_5825_58-Ce-136.zip 
fi 

if [ ! -f downloaded_endf_files/endf_58138_vii1 ]; then
  echo "endf_58138_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5831_58-Ce-138.zip 
  unzip n_5831_58-Ce-138.zip 
  mv n_5831_58-Ce-138.dat downloaded_endf_files/endf_58138_vii1
  rm n_5831_58-Ce-138.zip 
fi 

if [ ! -f downloaded_endf_files/endf_58139_vii1 ]; then
  echo "endf_58139_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5834_58-Ce-139.zip 
  unzip n_5834_58-Ce-139.zip 
  mv n_5834_58-Ce-139.dat downloaded_endf_files/endf_58139_vii1
  rm n_5834_58-Ce-139.zip 
fi 

if [ ! -f downloaded_endf_files/endf_58140_vii1 ]; then
  echo "endf_58140_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5837_58-Ce-140.zip 
  unzip n_5837_58-Ce-140.zip 
  mv n_5837_58-Ce-140.dat downloaded_endf_files/endf_58140_vii1
  rm n_5837_58-Ce-140.zip 
fi 

if [ ! -f downloaded_endf_files/endf_58141_vii1 ]; then
  echo "endf_58141_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5840_58-Ce-141.zip 
  unzip n_5840_58-Ce-141.zip 
  mv n_5840_58-Ce-141.dat downloaded_endf_files/endf_58141_vii1
  rm n_5840_58-Ce-141.zip 
fi 

if [ ! -f downloaded_endf_files/endf_58142_vii1 ]; then
  echo "endf_58142_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5843_58-Ce-142.zip 
  unzip n_5843_58-Ce-142.zip 
  mv n_5843_58-Ce-142.dat downloaded_endf_files/endf_58142_vii1
  rm n_5843_58-Ce-142.zip 
fi 

if [ ! -f downloaded_endf_files/endf_58143_vii1 ]; then
  echo "endf_58143_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5846_58-Ce-143.zip 
  unzip n_5846_58-Ce-143.zip 
  mv n_5846_58-Ce-143.dat downloaded_endf_files/endf_58143_vii1
  rm n_5846_58-Ce-143.zip 
fi 

if [ ! -f downloaded_endf_files/endf_58144_vii1 ]; then
  echo "endf_58144_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5849_58-Ce-144.zip 
  unzip n_5849_58-Ce-144.zip 
  mv n_5849_58-Ce-144.dat downloaded_endf_files/endf_58144_vii1
  rm n_5849_58-Ce-144.zip 
fi 

if [ ! -f downloaded_endf_files/endf_59141_vii1 ]; then
  echo "endf_59141_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5925_59-Pr-141.zip 
  unzip n_5925_59-Pr-141.zip 
  mv n_5925_59-Pr-141.dat downloaded_endf_files/endf_59141_vii1
  rm n_5925_59-Pr-141.zip 
fi 

if [ ! -f downloaded_endf_files/endf_59142_vii1 ]; then
  echo "endf_59142_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5928_59-Pr-142.zip 
  unzip n_5928_59-Pr-142.zip 
  mv n_5928_59-Pr-142.dat downloaded_endf_files/endf_59142_vii1
  rm n_5928_59-Pr-142.zip 
fi 

if [ ! -f downloaded_endf_files/endf_59143_vii1 ]; then
  echo "endf_59143_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_5931_59-Pr-143.zip 
  unzip n_5931_59-Pr-143.zip 
  mv n_5931_59-Pr-143.dat downloaded_endf_files/endf_59143_vii1
  rm n_5931_59-Pr-143.zip 
fi 

if [ ! -f downloaded_endf_files/endf_60142_vii1 ]; then
  echo "endf_60142_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6025_60-Nd-142.zip 
  unzip n_6025_60-Nd-142.zip 
  mv n_6025_60-Nd-142.dat downloaded_endf_files/endf_60142_vii1
  rm n_6025_60-Nd-142.zip 
fi 

if [ ! -f downloaded_endf_files/endf_60143_vii1 ]; then
  echo "endf_60143_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6028_60-Nd-143.zip 
  unzip n_6028_60-Nd-143.zip 
  mv n_6028_60-Nd-143.dat downloaded_endf_files/endf_60143_vii1
  rm n_6028_60-Nd-143.zip 
fi 

if [ ! -f downloaded_endf_files/endf_60144_vii1 ]; then
  echo "endf_60144_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6031_60-Nd-144.zip 
  unzip n_6031_60-Nd-144.zip 
  mv n_6031_60-Nd-144.dat downloaded_endf_files/endf_60144_vii1
  rm n_6031_60-Nd-144.zip 
fi 

if [ ! -f downloaded_endf_files/endf_60145_vii1 ]; then
  echo "endf_60145_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6034_60-Nd-145.zip 
  unzip n_6034_60-Nd-145.zip 
  mv n_6034_60-Nd-145.dat downloaded_endf_files/endf_60145_vii1
  rm n_6034_60-Nd-145.zip 
fi 

if [ ! -f downloaded_endf_files/endf_60146_vii1 ]; then
  echo "endf_60146_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6037_60-Nd-146.zip 
  unzip n_6037_60-Nd-146.zip 
  mv n_6037_60-Nd-146.dat downloaded_endf_files/endf_60146_vii1
  rm n_6037_60-Nd-146.zip 
fi 

if [ ! -f downloaded_endf_files/endf_60147_vii1 ]; then
  echo "endf_60147_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6040_60-Nd-147.zip 
  unzip n_6040_60-Nd-147.zip 
  mv n_6040_60-Nd-147.dat downloaded_endf_files/endf_60147_vii1
  rm n_6040_60-Nd-147.zip 
fi 

if [ ! -f downloaded_endf_files/endf_60148_vii1 ]; then
  echo "endf_60148_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6043_60-Nd-148.zip 
  unzip n_6043_60-Nd-148.zip 
  mv n_6043_60-Nd-148.dat downloaded_endf_files/endf_60148_vii1
  rm n_6043_60-Nd-148.zip 
fi 

if [ ! -f downloaded_endf_files/endf_60150_vii1 ]; then
  echo "endf_60150_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6049_60-Nd-150.zip 
  unzip n_6049_60-Nd-150.zip 
  mv n_6049_60-Nd-150.dat downloaded_endf_files/endf_60150_vii1
  rm n_6049_60-Nd-150.zip 
fi 

if [ ! -f downloaded_endf_files/endf_61147_vii1 ]; then
  echo "endf_61147_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6149_61-Pm-147.zip 
  unzip n_6149_61-Pm-147.zip 
  mv n_6149_61-Pm-147.dat downloaded_endf_files/endf_61147_vii1
  rm n_6149_61-Pm-147.zip 
fi 

if [ ! -f downloaded_endf_files/endf_61148_vii1 ]; then
  echo "endf_61148_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6152_61-Pm-148.zip 
  unzip n_6152_61-Pm-148.zip 
  mv n_6152_61-Pm-148.dat downloaded_endf_files/endf_61148_vii1
  rm n_6152_61-Pm-148.zip 
fi 

if [ ! -f downloaded_endf_files/endf_61148m_vii1 ]; then
  echo "endf_61148m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6153_61-Pm-148M.zip 
  unzip n_6153_61-Pm-148M.zip 
  mv n_6153_61-Pm-148M.dat downloaded_endf_files/endf_61148m_vii1
  rm n_6153_61-Pm-148M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_61149_vii1 ]; then
  echo "endf_61149_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6155_61-Pm-149.zip 
  unzip n_6155_61-Pm-149.zip 
  mv n_6155_61-Pm-149.dat downloaded_endf_files/endf_61149_vii1
  rm n_6155_61-Pm-149.zip 
fi 

if [ ! -f downloaded_endf_files/endf_61151_vii1 ]; then
  echo "endf_61151_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6161_61-Pm-151.zip 
  unzip n_6161_61-Pm-151.zip 
  mv n_6161_61-Pm-151.dat downloaded_endf_files/endf_61151_vii1
  rm n_6161_61-Pm-151.zip 
fi 

if [ ! -f downloaded_endf_files/endf_62144_vii1 ]; then
  echo "endf_62144_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6225_62-Sm-144.zip 
  unzip n_6225_62-Sm-144.zip 
  mv n_6225_62-Sm-144.dat downloaded_endf_files/endf_62144_vii1
  rm n_6225_62-Sm-144.zip 
fi 

if [ ! -f downloaded_endf_files/endf_62147_vii1 ]; then
  echo "endf_62147_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6234_62-Sm-147.zip 
  unzip n_6234_62-Sm-147.zip 
  mv n_6234_62-Sm-147.dat downloaded_endf_files/endf_62147_vii1
  rm n_6234_62-Sm-147.zip 
fi 

if [ ! -f downloaded_endf_files/endf_62148_vii1 ]; then
  echo "endf_62148_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6237_62-Sm-148.zip 
  unzip n_6237_62-Sm-148.zip 
  mv n_6237_62-Sm-148.dat downloaded_endf_files/endf_62148_vii1
  rm n_6237_62-Sm-148.zip 
fi 

if [ ! -f downloaded_endf_files/endf_62149_vii1 ]; then
  echo "endf_62149_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6240_62-Sm-149.zip 
  unzip n_6240_62-Sm-149.zip 
  mv n_6240_62-Sm-149.dat downloaded_endf_files/endf_62149_vii1
  rm n_6240_62-Sm-149.zip 
fi 

if [ ! -f downloaded_endf_files/endf_62150_vii1 ]; then
  echo "endf_62150_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6243_62-Sm-150.zip 
  unzip n_6243_62-Sm-150.zip 
  mv n_6243_62-Sm-150.dat downloaded_endf_files/endf_62150_vii1
  rm n_6243_62-Sm-150.zip 
fi 

if [ ! -f downloaded_endf_files/endf_62151_vii1 ]; then
  echo "endf_62151_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6246_62-Sm-151.zip 
  unzip n_6246_62-Sm-151.zip 
  mv n_6246_62-Sm-151.dat downloaded_endf_files/endf_62151_vii1
  rm n_6246_62-Sm-151.zip 
fi 

if [ ! -f downloaded_endf_files/endf_62152_vii1 ]; then
  echo "endf_62152_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6249_62-Sm-152.zip 
  unzip n_6249_62-Sm-152.zip 
  mv n_6249_62-Sm-152.dat downloaded_endf_files/endf_62152_vii1
  rm n_6249_62-Sm-152.zip 
fi 

if [ ! -f downloaded_endf_files/endf_62153_vii1 ]; then
  echo "endf_62153_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6252_62-Sm-153.zip 
  unzip n_6252_62-Sm-153.zip 
  mv n_6252_62-Sm-153.dat downloaded_endf_files/endf_62153_vii1
  rm n_6252_62-Sm-153.zip 
fi 

if [ ! -f downloaded_endf_files/endf_62154_vii1 ]; then
  echo "endf_62154_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6255_62-Sm-154.zip 
  unzip n_6255_62-Sm-154.zip 
  mv n_6255_62-Sm-154.dat downloaded_endf_files/endf_62154_vii1
  rm n_6255_62-Sm-154.zip 
fi 

if [ ! -f downloaded_endf_files/endf_63151_vii1 ]; then
  echo "endf_63151_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6325_63-Eu-151.zip 
  unzip n_6325_63-Eu-151.zip 
  mv n_6325_63-Eu-151.dat downloaded_endf_files/endf_63151_vii1
  rm n_6325_63-Eu-151.zip 
fi 

if [ ! -f downloaded_endf_files/endf_63152_vii1 ]; then
  echo "endf_63152_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6328_63-Eu-152.zip 
  unzip n_6328_63-Eu-152.zip 
  mv n_6328_63-Eu-152.dat downloaded_endf_files/endf_63152_vii1
  rm n_6328_63-Eu-152.zip 
fi 

if [ ! -f downloaded_endf_files/endf_63153_vii1 ]; then
  echo "endf_63153_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6331_63-Eu-153.zip 
  unzip n_6331_63-Eu-153.zip 
  mv n_6331_63-Eu-153.dat downloaded_endf_files/endf_63153_vii1
  rm n_6331_63-Eu-153.zip 
fi 

if [ ! -f downloaded_endf_files/endf_63154_vii1 ]; then
  echo "endf_63154_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6334_63-Eu-154.zip 
  unzip n_6334_63-Eu-154.zip 
  mv n_6334_63-Eu-154.dat downloaded_endf_files/endf_63154_vii1
  rm n_6334_63-Eu-154.zip 
fi 

if [ ! -f downloaded_endf_files/endf_63155_vii1 ]; then
  echo "endf_63155_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6337_63-Eu-155.zip 
  unzip n_6337_63-Eu-155.zip 
  mv n_6337_63-Eu-155.dat downloaded_endf_files/endf_63155_vii1
  rm n_6337_63-Eu-155.zip 
fi 

if [ ! -f downloaded_endf_files/endf_63156_vii1 ]; then
  echo "endf_63156_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6340_63-Eu-156.zip 
  unzip n_6340_63-Eu-156.zip 
  mv n_6340_63-Eu-156.dat downloaded_endf_files/endf_63156_vii1
  rm n_6340_63-Eu-156.zip 
fi 

if [ ! -f downloaded_endf_files/endf_63157_vii1 ]; then
  echo "endf_63157_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6343_63-Eu-157.zip 
  unzip n_6343_63-Eu-157.zip 
  mv n_6343_63-Eu-157.dat downloaded_endf_files/endf_63157_vii1
  rm n_6343_63-Eu-157.zip 
fi 

if [ ! -f downloaded_endf_files/endf_64152_vii1 ]; then
  echo "endf_64152_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6425_64-Gd-152.zip 
  unzip n_6425_64-Gd-152.zip 
  mv n_6425_64-Gd-152.dat downloaded_endf_files/endf_64152_vii1
  rm n_6425_64-Gd-152.zip 
fi 

if [ ! -f downloaded_endf_files/endf_64153_vii1 ]; then
  echo "endf_64153_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6428_64-Gd-153.zip 
  unzip n_6428_64-Gd-153.zip 
  mv n_6428_64-Gd-153.dat downloaded_endf_files/endf_64153_vii1
  rm n_6428_64-Gd-153.zip 
fi 

if [ ! -f downloaded_endf_files/endf_64154_vii1 ]; then
  echo "endf_64154_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6431_64-Gd-154.zip 
  unzip n_6431_64-Gd-154.zip 
  mv n_6431_64-Gd-154.dat downloaded_endf_files/endf_64154_vii1
  rm n_6431_64-Gd-154.zip 
fi 

if [ ! -f downloaded_endf_files/endf_64155_vii1 ]; then
  echo "endf_64155_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6434_64-Gd-155.zip 
  unzip n_6434_64-Gd-155.zip 
  mv n_6434_64-Gd-155.dat downloaded_endf_files/endf_64155_vii1
  rm n_6434_64-Gd-155.zip 
fi 

if [ ! -f downloaded_endf_files/endf_64156_vii1 ]; then
  echo "endf_64156_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6437_64-Gd-156.zip 
  unzip n_6437_64-Gd-156.zip 
  mv n_6437_64-Gd-156.dat downloaded_endf_files/endf_64156_vii1
  rm n_6437_64-Gd-156.zip 
fi 

if [ ! -f downloaded_endf_files/endf_64157_vii1 ]; then
  echo "endf_64157_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6440_64-Gd-157.zip 
  unzip n_6440_64-Gd-157.zip 
  mv n_6440_64-Gd-157.dat downloaded_endf_files/endf_64157_vii1
  rm n_6440_64-Gd-157.zip 
fi 

if [ ! -f downloaded_endf_files/endf_64158_vii1 ]; then
  echo "endf_64158_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6443_64-Gd-158.zip 
  unzip n_6443_64-Gd-158.zip 
  mv n_6443_64-Gd-158.dat downloaded_endf_files/endf_64158_vii1
  rm n_6443_64-Gd-158.zip 
fi 

if [ ! -f downloaded_endf_files/endf_64160_vii1 ]; then
  echo "endf_64160_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6449_64-Gd-160.zip 
  unzip n_6449_64-Gd-160.zip 
  mv n_6449_64-Gd-160.dat downloaded_endf_files/endf_64160_vii1
  rm n_6449_64-Gd-160.zip 
fi 

if [ ! -f downloaded_endf_files/endf_65159_vii1 ]; then
  echo "endf_65159_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6525_65-Tb-159.zip 
  unzip n_6525_65-Tb-159.zip 
  mv n_6525_65-Tb-159.dat downloaded_endf_files/endf_65159_vii1
  rm n_6525_65-Tb-159.zip 
fi 

if [ ! -f downloaded_endf_files/endf_65160_vii1 ]; then
  echo "endf_65160_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6528_65-Tb-160.zip 
  unzip n_6528_65-Tb-160.zip 
  mv n_6528_65-Tb-160.dat downloaded_endf_files/endf_65160_vii1
  rm n_6528_65-Tb-160.zip 
fi 

if [ ! -f downloaded_endf_files/endf_66156_vii1 ]; then
  echo "endf_66156_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6625_66-Dy-156.zip 
  unzip n_6625_66-Dy-156.zip 
  mv n_6625_66-Dy-156.dat downloaded_endf_files/endf_66156_vii1
  rm n_6625_66-Dy-156.zip 
fi 

if [ ! -f downloaded_endf_files/endf_66158_vii1 ]; then
  echo "endf_66158_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6631_66-Dy-158.zip 
  unzip n_6631_66-Dy-158.zip 
  mv n_6631_66-Dy-158.dat downloaded_endf_files/endf_66158_vii1
  rm n_6631_66-Dy-158.zip 
fi 

if [ ! -f downloaded_endf_files/endf_66160_vii1 ]; then
  echo "endf_66160_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6637_66-Dy-160.zip 
  unzip n_6637_66-Dy-160.zip 
  mv n_6637_66-Dy-160.dat downloaded_endf_files/endf_66160_vii1
  rm n_6637_66-Dy-160.zip 
fi 

if [ ! -f downloaded_endf_files/endf_66161_vii1 ]; then
  echo "endf_66161_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6640_66-Dy-161.zip 
  unzip n_6640_66-Dy-161.zip 
  mv n_6640_66-Dy-161.dat downloaded_endf_files/endf_66161_vii1
  rm n_6640_66-Dy-161.zip 
fi 

if [ ! -f downloaded_endf_files/endf_66162_vii1 ]; then
  echo "endf_66162_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6643_66-Dy-162.zip 
  unzip n_6643_66-Dy-162.zip 
  mv n_6643_66-Dy-162.dat downloaded_endf_files/endf_66162_vii1
  rm n_6643_66-Dy-162.zip 
fi 

if [ ! -f downloaded_endf_files/endf_66163_vii1 ]; then
  echo "endf_66163_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6646_66-Dy-163.zip 
  unzip n_6646_66-Dy-163.zip 
  mv n_6646_66-Dy-163.dat downloaded_endf_files/endf_66163_vii1
  rm n_6646_66-Dy-163.zip 
fi 

if [ ! -f downloaded_endf_files/endf_66164_vii1 ]; then
  echo "endf_66164_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6649_66-Dy-164.zip 
  unzip n_6649_66-Dy-164.zip 
  mv n_6649_66-Dy-164.dat downloaded_endf_files/endf_66164_vii1
  rm n_6649_66-Dy-164.zip 
fi 

if [ ! -f downloaded_endf_files/endf_67165_vii1 ]; then
  echo "endf_67165_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6725_67-Ho-165.zip 
  unzip n_6725_67-Ho-165.zip 
  mv n_6725_67-Ho-165.dat downloaded_endf_files/endf_67165_vii1
  rm n_6725_67-Ho-165.zip 
fi 

if [ ! -f downloaded_endf_files/endf_67166m_vii1 ]; then
  echo "endf_67166m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6729_67-Ho-166M.zip 
  unzip n_6729_67-Ho-166M.zip 
  mv n_6729_67-Ho-166M.dat downloaded_endf_files/endf_67166m_vii1
  rm n_6729_67-Ho-166M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_68162_vii1 ]; then
  echo "endf_68162_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6825_68-Er-162.zip 
  unzip n_6825_68-Er-162.zip 
  mv n_6825_68-Er-162.dat downloaded_endf_files/endf_68162_vii1
  rm n_6825_68-Er-162.zip 
fi 

if [ ! -f downloaded_endf_files/endf_68164_vii1 ]; then
  echo "endf_68164_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6831_68-Er-164.zip 
  unzip n_6831_68-Er-164.zip 
  mv n_6831_68-Er-164.dat downloaded_endf_files/endf_68164_vii1
  rm n_6831_68-Er-164.zip 
fi 

if [ ! -f downloaded_endf_files/endf_68166_vii1 ]; then
  echo "endf_68166_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6837_68-Er-166.zip 
  unzip n_6837_68-Er-166.zip 
  mv n_6837_68-Er-166.dat downloaded_endf_files/endf_68166_vii1
  rm n_6837_68-Er-166.zip 
fi 

if [ ! -f downloaded_endf_files/endf_68167_vii1 ]; then
  echo "endf_68167_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6840_68-Er-167.zip 
  unzip n_6840_68-Er-167.zip 
  mv n_6840_68-Er-167.dat downloaded_endf_files/endf_68167_vii1
  rm n_6840_68-Er-167.zip 
fi 

if [ ! -f downloaded_endf_files/endf_68168_vii1 ]; then
  echo "endf_68168_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6843_68-Er-168.zip 
  unzip n_6843_68-Er-168.zip 
  mv n_6843_68-Er-168.dat downloaded_endf_files/endf_68168_vii1
  rm n_6843_68-Er-168.zip 
fi 

if [ ! -f downloaded_endf_files/endf_68170_vii1 ]; then
  echo "endf_68170_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6849_68-Er-170.zip 
  unzip n_6849_68-Er-170.zip 
  mv n_6849_68-Er-170.dat downloaded_endf_files/endf_68170_vii1
  rm n_6849_68-Er-170.zip 
fi 

if [ ! -f downloaded_endf_files/endf_69168_vii1 ]; then
  echo "endf_69168_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6922_69-Tm-168.zip 
  unzip n_6922_69-Tm-168.zip 
  mv n_6922_69-Tm-168.dat downloaded_endf_files/endf_69168_vii1
  rm n_6922_69-Tm-168.zip 
fi 

if [ ! -f downloaded_endf_files/endf_69169_vii1 ]; then
  echo "endf_69169_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6925_69-Tm-169.zip 
  unzip n_6925_69-Tm-169.zip 
  mv n_6925_69-Tm-169.dat downloaded_endf_files/endf_69169_vii1
  rm n_6925_69-Tm-169.zip 
fi 

if [ ! -f downloaded_endf_files/endf_69170_vii1 ]; then
  echo "endf_69170_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_6928_69-Tm-170.zip 
  unzip n_6928_69-Tm-170.zip 
  mv n_6928_69-Tm-170.dat downloaded_endf_files/endf_69170_vii1
  rm n_6928_69-Tm-170.zip 
fi 

if [ ! -f downloaded_endf_files/endf_71175_vii1 ]; then
  echo "endf_71175_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7125_71-Lu-175.zip 
  unzip n_7125_71-Lu-175.zip 
  mv n_7125_71-Lu-175.dat downloaded_endf_files/endf_71175_vii1
  rm n_7125_71-Lu-175.zip 
fi 

if [ ! -f downloaded_endf_files/endf_71176_vii1 ]; then
  echo "endf_71176_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7128_71-Lu-176.zip 
  unzip n_7128_71-Lu-176.zip 
  mv n_7128_71-Lu-176.dat downloaded_endf_files/endf_71176_vii1
  rm n_7128_71-Lu-176.zip 
fi 

if [ ! -f downloaded_endf_files/endf_72174_vii1 ]; then
  echo "endf_72174_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7225_72-Hf-174.zip 
  unzip n_7225_72-Hf-174.zip 
  mv n_7225_72-Hf-174.dat downloaded_endf_files/endf_72174_vii1
  rm n_7225_72-Hf-174.zip 
fi 

if [ ! -f downloaded_endf_files/endf_72176_vii1 ]; then
  echo "endf_72176_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7231_72-Hf-176.zip 
  unzip n_7231_72-Hf-176.zip 
  mv n_7231_72-Hf-176.dat downloaded_endf_files/endf_72176_vii1
  rm n_7231_72-Hf-176.zip 
fi 

if [ ! -f downloaded_endf_files/endf_72177_vii1 ]; then
  echo "endf_72177_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7234_72-Hf-177.zip 
  unzip n_7234_72-Hf-177.zip 
  mv n_7234_72-Hf-177.dat downloaded_endf_files/endf_72177_vii1
  rm n_7234_72-Hf-177.zip 
fi 

if [ ! -f downloaded_endf_files/endf_72178_vii1 ]; then
  echo "endf_72178_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7237_72-Hf-178.zip 
  unzip n_7237_72-Hf-178.zip 
  mv n_7237_72-Hf-178.dat downloaded_endf_files/endf_72178_vii1
  rm n_7237_72-Hf-178.zip 
fi 

if [ ! -f downloaded_endf_files/endf_72179_vii1 ]; then
  echo "endf_72179_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7240_72-Hf-179.zip 
  unzip n_7240_72-Hf-179.zip 
  mv n_7240_72-Hf-179.dat downloaded_endf_files/endf_72179_vii1
  rm n_7240_72-Hf-179.zip 
fi 

if [ ! -f downloaded_endf_files/endf_72180_vii1 ]; then
  echo "endf_72180_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7243_72-Hf-180.zip 
  unzip n_7243_72-Hf-180.zip 
  mv n_7243_72-Hf-180.dat downloaded_endf_files/endf_72180_vii1
  rm n_7243_72-Hf-180.zip 
fi 

if [ ! -f downloaded_endf_files/endf_73180_vii1 ]; then
  echo "endf_73180_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7325_73-Ta-180.zip 
  unzip n_7325_73-Ta-180.zip 
  mv n_7325_73-Ta-180.dat downloaded_endf_files/endf_73180_vii1
  rm n_7325_73-Ta-180.zip 
fi 

if [ ! -f downloaded_endf_files/endf_73181_vii1 ]; then
  echo "endf_73181_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7328_73-Ta-181.zip 
  unzip n_7328_73-Ta-181.zip 
  mv n_7328_73-Ta-181.dat downloaded_endf_files/endf_73181_vii1
  rm n_7328_73-Ta-181.zip 
fi 

if [ ! -f downloaded_endf_files/endf_73182_vii1 ]; then
  echo "endf_73182_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7331_73-Ta-182.zip 
  unzip n_7331_73-Ta-182.zip 
  mv n_7331_73-Ta-182.dat downloaded_endf_files/endf_73182_vii1
  rm n_7331_73-Ta-182.zip 
fi 

if [ ! -f downloaded_endf_files/endf_74180_vii1 ]; then
  echo "endf_74180_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7425_74-W-180.zip 
  unzip n_7425_74-W-180.zip 
  mv n_7425_74-W-180.dat downloaded_endf_files/endf_74180_vii1
  rm n_7425_74-W-180.zip 
fi 

if [ ! -f downloaded_endf_files/endf_74182_vii1 ]; then
  echo "endf_74182_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7431_74-W-182.zip 
  unzip n_7431_74-W-182.zip 
  mv n_7431_74-W-182.dat downloaded_endf_files/endf_74182_vii1
  rm n_7431_74-W-182.zip 
fi 

if [ ! -f downloaded_endf_files/endf_74183_vii1 ]; then
  echo "endf_74183_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7434_74-W-183.zip 
  unzip n_7434_74-W-183.zip 
  mv n_7434_74-W-183.dat downloaded_endf_files/endf_74183_vii1
  rm n_7434_74-W-183.zip 
fi 

if [ ! -f downloaded_endf_files/endf_74184_vii1 ]; then
  echo "endf_74184_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7437_74-W-184.zip 
  unzip n_7437_74-W-184.zip 
  mv n_7437_74-W-184.dat downloaded_endf_files/endf_74184_vii1
  rm n_7437_74-W-184.zip 
fi 

if [ ! -f downloaded_endf_files/endf_74186_vii1 ]; then
  echo "endf_74186_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7443_74-W-186.zip 
  unzip n_7443_74-W-186.zip 
  mv n_7443_74-W-186.dat downloaded_endf_files/endf_74186_vii1
  rm n_7443_74-W-186.zip 
fi 

if [ ! -f downloaded_endf_files/endf_75185_vii1 ]; then
  echo "endf_75185_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7525_75-Re-185.zip 
  unzip n_7525_75-Re-185.zip 
  mv n_7525_75-Re-185.dat downloaded_endf_files/endf_75185_vii1
  rm n_7525_75-Re-185.zip 
fi 

if [ ! -f downloaded_endf_files/endf_75187_vii1 ]; then
  echo "endf_75187_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7531_75-Re-187.zip 
  unzip n_7531_75-Re-187.zip 
  mv n_7531_75-Re-187.dat downloaded_endf_files/endf_75187_vii1
  rm n_7531_75-Re-187.zip 
fi 

if [ ! -f downloaded_endf_files/endf_77191_vii1 ]; then
  echo "endf_77191_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7725_77-Ir-191.zip 
  unzip n_7725_77-Ir-191.zip 
  mv n_7725_77-Ir-191.dat downloaded_endf_files/endf_77191_vii1
  rm n_7725_77-Ir-191.zip 
fi 

if [ ! -f downloaded_endf_files/endf_77193_vii1 ]; then
  echo "endf_77193_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7731_77-Ir-193.zip 
  unzip n_7731_77-Ir-193.zip 
  mv n_7731_77-Ir-193.dat downloaded_endf_files/endf_77193_vii1
  rm n_7731_77-Ir-193.zip 
fi 

if [ ! -f downloaded_endf_files/endf_79197_vii1 ]; then
  echo "endf_79197_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_7925_79-Au-197.zip 
  unzip n_7925_79-Au-197.zip 
  mv n_7925_79-Au-197.dat downloaded_endf_files/endf_79197_vii1
  rm n_7925_79-Au-197.zip 
fi 

if [ ! -f downloaded_endf_files/endf_80196_vii1 ]; then
  echo "endf_80196_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8025_80-Hg-196.zip 
  unzip n_8025_80-Hg-196.zip 
  mv n_8025_80-Hg-196.dat downloaded_endf_files/endf_80196_vii1
  rm n_8025_80-Hg-196.zip 
fi 

if [ ! -f downloaded_endf_files/endf_80198_vii1 ]; then
  echo "endf_80198_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8031_80-Hg-198.zip 
  unzip n_8031_80-Hg-198.zip 
  mv n_8031_80-Hg-198.dat downloaded_endf_files/endf_80198_vii1
  rm n_8031_80-Hg-198.zip 
fi 

if [ ! -f downloaded_endf_files/endf_80199_vii1 ]; then
  echo "endf_80199_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8034_80-Hg-199.zip 
  unzip n_8034_80-Hg-199.zip 
  mv n_8034_80-Hg-199.dat downloaded_endf_files/endf_80199_vii1
  rm n_8034_80-Hg-199.zip 
fi 

if [ ! -f downloaded_endf_files/endf_80200_vii1 ]; then
  echo "endf_80200_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8037_80-Hg-200.zip 
  unzip n_8037_80-Hg-200.zip 
  mv n_8037_80-Hg-200.dat downloaded_endf_files/endf_80200_vii1
  rm n_8037_80-Hg-200.zip 
fi 

if [ ! -f downloaded_endf_files/endf_80201_vii1 ]; then
  echo "endf_80201_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8040_80-Hg-201.zip 
  unzip n_8040_80-Hg-201.zip 
  mv n_8040_80-Hg-201.dat downloaded_endf_files/endf_80201_vii1
  rm n_8040_80-Hg-201.zip 
fi 

if [ ! -f downloaded_endf_files/endf_80202_vii1 ]; then
  echo "endf_80202_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8043_80-Hg-202.zip 
  unzip n_8043_80-Hg-202.zip 
  mv n_8043_80-Hg-202.dat downloaded_endf_files/endf_80202_vii1
  rm n_8043_80-Hg-202.zip 
fi 

if [ ! -f downloaded_endf_files/endf_80204_vii1 ]; then
  echo "endf_80204_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8049_80-Hg-204.zip 
  unzip n_8049_80-Hg-204.zip 
  mv n_8049_80-Hg-204.dat downloaded_endf_files/endf_80204_vii1
  rm n_8049_80-Hg-204.zip 
fi 

if [ ! -f downloaded_endf_files/endf_81203_vii1 ]; then
  echo "endf_81203_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8125_81-Tl-203.zip 
  unzip n_8125_81-Tl-203.zip 
  mv n_8125_81-Tl-203.dat downloaded_endf_files/endf_81203_vii1
  rm n_8125_81-Tl-203.zip 
fi 

if [ ! -f downloaded_endf_files/endf_81205_vii1 ]; then
  echo "endf_81205_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8131_81-Tl-205.zip 
  unzip n_8131_81-Tl-205.zip 
  mv n_8131_81-Tl-205.dat downloaded_endf_files/endf_81205_vii1
  rm n_8131_81-Tl-205.zip 
fi 

if [ ! -f downloaded_endf_files/endf_82204_vii1 ]; then
  echo "endf_82204_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8225_82-Pb-204.zip 
  unzip n_8225_82-Pb-204.zip 
  mv n_8225_82-Pb-204.dat downloaded_endf_files/endf_82204_vii1
  rm n_8225_82-Pb-204.zip 
fi 

if [ ! -f downloaded_endf_files/endf_82206_vii1 ]; then
  echo "endf_82206_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8231_82-Pb-206.zip 
  unzip n_8231_82-Pb-206.zip 
  mv n_8231_82-Pb-206.dat downloaded_endf_files/endf_82206_vii1
  rm n_8231_82-Pb-206.zip 
fi 

if [ ! -f downloaded_endf_files/endf_82207_vii1 ]; then
  echo "endf_82207_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8234_82-Pb-207.zip 
  unzip n_8234_82-Pb-207.zip 
  mv n_8234_82-Pb-207.dat downloaded_endf_files/endf_82207_vii1
  rm n_8234_82-Pb-207.zip 
fi 

if [ ! -f downloaded_endf_files/endf_82208_vii1 ]; then
  echo "endf_82208_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8237_82-Pb-208.zip 
  unzip n_8237_82-Pb-208.zip 
  mv n_8237_82-Pb-208.dat downloaded_endf_files/endf_82208_vii1
  rm n_8237_82-Pb-208.zip 
fi 

if [ ! -f downloaded_endf_files/endf_83209_vii1 ]; then
  echo "endf_83209_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8325_83-Bi-209.zip 
  unzip n_8325_83-Bi-209.zip 
  mv n_8325_83-Bi-209.dat downloaded_endf_files/endf_83209_vii1
  rm n_8325_83-Bi-209.zip 
fi 

if [ ! -f downloaded_endf_files/endf_88223_vii1 ]; then
  echo "endf_88223_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8825_88-Ra-223.zip 
  unzip n_8825_88-Ra-223.zip 
  mv n_8825_88-Ra-223.dat downloaded_endf_files/endf_88223_vii1
  rm n_8825_88-Ra-223.zip 
fi 

if [ ! -f downloaded_endf_files/endf_88224_vii1 ]; then
  echo "endf_88224_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8828_88-Ra-224.zip 
  unzip n_8828_88-Ra-224.zip 
  mv n_8828_88-Ra-224.dat downloaded_endf_files/endf_88224_vii1
  rm n_8828_88-Ra-224.zip 
fi 

if [ ! -f downloaded_endf_files/endf_88225_vii1 ]; then
  echo "endf_88225_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8831_88-Ra-225.zip 
  unzip n_8831_88-Ra-225.zip 
  mv n_8831_88-Ra-225.dat downloaded_endf_files/endf_88225_vii1
  rm n_8831_88-Ra-225.zip 
fi 

if [ ! -f downloaded_endf_files/endf_88226_vii1 ]; then
  echo "endf_88226_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8834_88-Ra-226.zip 
  unzip n_8834_88-Ra-226.zip 
  mv n_8834_88-Ra-226.dat downloaded_endf_files/endf_88226_vii1
  rm n_8834_88-Ra-226.zip 
fi 

if [ ! -f downloaded_endf_files/endf_89225_vii1 ]; then
  echo "endf_89225_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8925_89-Ac-225.zip 
  unzip n_8925_89-Ac-225.zip 
  mv n_8925_89-Ac-225.dat downloaded_endf_files/endf_89225_vii1
  rm n_8925_89-Ac-225.zip 
fi 

if [ ! -f downloaded_endf_files/endf_89226_vii1 ]; then
  echo "endf_89226_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8928_89-Ac-226.zip 
  unzip n_8928_89-Ac-226.zip 
  mv n_8928_89-Ac-226.dat downloaded_endf_files/endf_89226_vii1
  rm n_8928_89-Ac-226.zip 
fi 

if [ ! -f downloaded_endf_files/endf_89227_vii1 ]; then
  echo "endf_89227_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_8931_89-Ac-227.zip 
  unzip n_8931_89-Ac-227.zip 
  mv n_8931_89-Ac-227.dat downloaded_endf_files/endf_89227_vii1
  rm n_8931_89-Ac-227.zip 
fi 

if [ ! -f downloaded_endf_files/endf_90227_vii1 ]; then
  echo "endf_90227_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9025_90-Th-227.zip 
  unzip n_9025_90-Th-227.zip 
  mv n_9025_90-Th-227.dat downloaded_endf_files/endf_90227_vii1
  rm n_9025_90-Th-227.zip 
fi 

if [ ! -f downloaded_endf_files/endf_90228_vii1 ]; then
  echo "endf_90228_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9028_90-Th-228.zip 
  unzip n_9028_90-Th-228.zip 
  mv n_9028_90-Th-228.dat downloaded_endf_files/endf_90228_vii1
  rm n_9028_90-Th-228.zip 
fi 

if [ ! -f downloaded_endf_files/endf_90229_vii1 ]; then
  echo "endf_90229_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9031_90-Th-229.zip 
  unzip n_9031_90-Th-229.zip 
  mv n_9031_90-Th-229.dat downloaded_endf_files/endf_90229_vii1
  rm n_9031_90-Th-229.zip 
fi 

if [ ! -f downloaded_endf_files/endf_90230_vii1 ]; then
  echo "endf_90230_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9034_90-Th-230.zip 
  unzip n_9034_90-Th-230.zip 
  mv n_9034_90-Th-230.dat downloaded_endf_files/endf_90230_vii1
  rm n_9034_90-Th-230.zip 
fi 

if [ ! -f downloaded_endf_files/endf_90231_vii1 ]; then
  echo "endf_90231_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9037_90-Th-231.zip 
  unzip n_9037_90-Th-231.zip 
  mv n_9037_90-Th-231.dat downloaded_endf_files/endf_90231_vii1
  rm n_9037_90-Th-231.zip 
fi 

if [ ! -f downloaded_endf_files/endf_90232_vii1 ]; then
  echo "endf_90232_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9040_90-Th-232.zip 
  unzip n_9040_90-Th-232.zip 
  mv n_9040_90-Th-232.dat downloaded_endf_files/endf_90232_vii1
  rm n_9040_90-Th-232.zip 
fi 

if [ ! -f downloaded_endf_files/endf_90233_vii1 ]; then
  echo "endf_90233_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9043_90-Th-233.zip 
  unzip n_9043_90-Th-233.zip 
  mv n_9043_90-Th-233.dat downloaded_endf_files/endf_90233_vii1
  rm n_9043_90-Th-233.zip 
fi 

if [ ! -f downloaded_endf_files/endf_90234_vii1 ]; then
  echo "endf_90234_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9046_90-Th-234.zip 
  unzip n_9046_90-Th-234.zip 
  mv n_9046_90-Th-234.dat downloaded_endf_files/endf_90234_vii1
  rm n_9046_90-Th-234.zip 
fi 

if [ ! -f downloaded_endf_files/endf_91229_vii1 ]; then
  echo "endf_91229_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9125_91-Pa-229.zip 
  unzip n_9125_91-Pa-229.zip 
  mv n_9125_91-Pa-229.dat downloaded_endf_files/endf_91229_vii1
  rm n_9125_91-Pa-229.zip 
fi 

if [ ! -f downloaded_endf_files/endf_91230_vii1 ]; then
  echo "endf_91230_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9128_91-Pa-230.zip 
  unzip n_9128_91-Pa-230.zip 
  mv n_9128_91-Pa-230.dat downloaded_endf_files/endf_91230_vii1
  rm n_9128_91-Pa-230.zip 
fi 

if [ ! -f downloaded_endf_files/endf_91231_vii1 ]; then
  echo "endf_91231_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9131_91-Pa-231.zip 
  unzip n_9131_91-Pa-231.zip 
  mv n_9131_91-Pa-231.dat downloaded_endf_files/endf_91231_vii1
  rm n_9131_91-Pa-231.zip 
fi 

if [ ! -f downloaded_endf_files/endf_91232_vii1 ]; then
  echo "endf_91232_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9134_91-Pa-232.zip 
  unzip n_9134_91-Pa-232.zip 
  mv n_9134_91-Pa-232.dat downloaded_endf_files/endf_91232_vii1
  rm n_9134_91-Pa-232.zip 
fi 

if [ ! -f downloaded_endf_files/endf_91233_vii1 ]; then
  echo "endf_91233_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9137_91-Pa-233.zip 
  unzip n_9137_91-Pa-233.zip 
  mv n_9137_91-Pa-233.dat downloaded_endf_files/endf_91233_vii1
  rm n_9137_91-Pa-233.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92230_vii1 ]; then
  echo "endf_92230_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9213_92-U-230.zip 
  unzip n_9213_92-U-230.zip 
  mv n_9213_92-U-230.dat downloaded_endf_files/endf_92230_vii1
  rm n_9213_92-U-230.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92231_vii1 ]; then
  echo "endf_92231_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9216_92-U-231.zip 
  unzip n_9216_92-U-231.zip 
  mv n_9216_92-U-231.dat downloaded_endf_files/endf_92231_vii1
  rm n_9216_92-U-231.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92232_vii1 ]; then
  echo "endf_92232_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9219_92-U-232.zip 
  unzip n_9219_92-U-232.zip 
  mv n_9219_92-U-232.dat downloaded_endf_files/endf_92232_vii1
  rm n_9219_92-U-232.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92233_vii1 ]; then
  echo "endf_92233_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9222_92-U-233.zip 
  unzip n_9222_92-U-233.zip 
  mv n_9222_92-U-233.dat downloaded_endf_files/endf_92233_vii1
  rm n_9222_92-U-233.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92234_vii1 ]; then
  echo "endf_92234_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9225_92-U-234.zip 
  unzip n_9225_92-U-234.zip 
  mv n_9225_92-U-234.dat downloaded_endf_files/endf_92234_vii1
  rm n_9225_92-U-234.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92235_vii1 ]; then
  echo "endf_92235_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9228_92-U-235.zip 
  unzip n_9228_92-U-235.zip 
  mv n_9228_92-U-235.dat downloaded_endf_files/endf_92235_vii1
  rm n_9228_92-U-235.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92236_vii1 ]; then
  echo "endf_92236_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9231_92-U-236.zip 
  unzip n_9231_92-U-236.zip 
  mv n_9231_92-U-236.dat downloaded_endf_files/endf_92236_vii1
  rm n_9231_92-U-236.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92237_vii1 ]; then
  echo "endf_92237_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9234_92-U-237.zip 
  unzip n_9234_92-U-237.zip 
  mv n_9234_92-U-237.dat downloaded_endf_files/endf_92237_vii1
  rm n_9234_92-U-237.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92238_vii1 ]; then
  echo "endf_92238_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9237_92-U-238.zip 
  unzip n_9237_92-U-238.zip 
  mv n_9237_92-U-238.dat downloaded_endf_files/endf_92238_vii1
  rm n_9237_92-U-238.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92239_vii1 ]; then
  echo "endf_92239_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9240_92-U-239.zip 
  unzip n_9240_92-U-239.zip 
  mv n_9240_92-U-239.dat downloaded_endf_files/endf_92239_vii1
  rm n_9240_92-U-239.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92240_vii1 ]; then
  echo "endf_92240_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9243_92-U-240.zip 
  unzip n_9243_92-U-240.zip 
  mv n_9243_92-U-240.dat downloaded_endf_files/endf_92240_vii1
  rm n_9243_92-U-240.zip 
fi 

if [ ! -f downloaded_endf_files/endf_92241_vii1 ]; then
  echo "endf_92241_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9246_92-U-241.zip 
  unzip n_9246_92-U-241.zip 
  mv n_9246_92-U-241.dat downloaded_endf_files/endf_92241_vii1
  rm n_9246_92-U-241.zip 
fi 

if [ ! -f downloaded_endf_files/endf_93234_vii1 ]; then
  echo "endf_93234_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9337_93-Np-234.zip 
  unzip n_9337_93-Np-234.zip 
  mv n_9337_93-Np-234.dat downloaded_endf_files/endf_93234_vii1
  rm n_9337_93-Np-234.zip 
fi 

if [ ! -f downloaded_endf_files/endf_93235_vii1 ]; then
  echo "endf_93235_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9340_93-Np-235.zip 
  unzip n_9340_93-Np-235.zip 
  mv n_9340_93-Np-235.dat downloaded_endf_files/endf_93235_vii1
  rm n_9340_93-Np-235.zip 
fi 

if [ ! -f downloaded_endf_files/endf_93236_vii1 ]; then
  echo "endf_93236_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9343_93-Np-236.zip 
  unzip n_9343_93-Np-236.zip 
  mv n_9343_93-Np-236.dat downloaded_endf_files/endf_93236_vii1
  rm n_9343_93-Np-236.zip 
fi 

if [ ! -f downloaded_endf_files/endf_93237_vii1 ]; then
  echo "endf_93237_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9346_93-Np-237.zip 
  unzip n_9346_93-Np-237.zip 
  mv n_9346_93-Np-237.dat downloaded_endf_files/endf_93237_vii1
  rm n_9346_93-Np-237.zip 
fi 

if [ ! -f downloaded_endf_files/endf_93238_vii1 ]; then
  echo "endf_93238_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9349_93-Np-238.zip 
  unzip n_9349_93-Np-238.zip 
  mv n_9349_93-Np-238.dat downloaded_endf_files/endf_93238_vii1
  rm n_9349_93-Np-238.zip 
fi 

if [ ! -f downloaded_endf_files/endf_93239_vii1 ]; then
  echo "endf_93239_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9352_93-Np-239.zip 
  unzip n_9352_93-Np-239.zip 
  mv n_9352_93-Np-239.dat downloaded_endf_files/endf_93239_vii1
  rm n_9352_93-Np-239.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94236_vii1 ]; then
  echo "endf_94236_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9428_94-Pu-236.zip 
  unzip n_9428_94-Pu-236.zip 
  mv n_9428_94-Pu-236.dat downloaded_endf_files/endf_94236_vii1
  rm n_9428_94-Pu-236.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94237_vii1 ]; then
  echo "endf_94237_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9431_94-Pu-237.zip 
  unzip n_9431_94-Pu-237.zip 
  mv n_9431_94-Pu-237.dat downloaded_endf_files/endf_94237_vii1
  rm n_9431_94-Pu-237.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94238_vii1 ]; then
  echo "endf_94238_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9434_94-Pu-238.zip 
  unzip n_9434_94-Pu-238.zip 
  mv n_9434_94-Pu-238.dat downloaded_endf_files/endf_94238_vii1
  rm n_9434_94-Pu-238.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94239_vii1 ]; then
  echo "endf_94239_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9437_94-Pu-239.zip 
  unzip n_9437_94-Pu-239.zip 
  mv n_9437_94-Pu-239.dat downloaded_endf_files/endf_94239_vii1
  rm n_9437_94-Pu-239.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94240_vii1 ]; then
  echo "endf_94240_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9440_94-Pu-240.zip 
  unzip n_9440_94-Pu-240.zip 
  mv n_9440_94-Pu-240.dat downloaded_endf_files/endf_94240_vii1
  rm n_9440_94-Pu-240.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94241_vii1 ]; then
  echo "endf_94241_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9443_94-Pu-241.zip 
  unzip n_9443_94-Pu-241.zip 
  mv n_9443_94-Pu-241.dat downloaded_endf_files/endf_94241_vii1
  rm n_9443_94-Pu-241.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94242_vii1 ]; then
  echo "endf_94242_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9446_94-Pu-242.zip 
  unzip n_9446_94-Pu-242.zip 
  mv n_9446_94-Pu-242.dat downloaded_endf_files/endf_94242_vii1
  rm n_9446_94-Pu-242.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94243_vii1 ]; then
  echo "endf_94243_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9449_94-Pu-243.zip 
  unzip n_9449_94-Pu-243.zip 
  mv n_9449_94-Pu-243.dat downloaded_endf_files/endf_94243_vii1
  rm n_9449_94-Pu-243.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94244_vii1 ]; then
  echo "endf_94244_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9452_94-Pu-244.zip 
  unzip n_9452_94-Pu-244.zip 
  mv n_9452_94-Pu-244.dat downloaded_endf_files/endf_94244_vii1
  rm n_9452_94-Pu-244.zip 
fi 

if [ ! -f downloaded_endf_files/endf_94246_vii1 ]; then
  echo "endf_94246_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9458_94-Pu-246.zip 
  unzip n_9458_94-Pu-246.zip 
  mv n_9458_94-Pu-246.dat downloaded_endf_files/endf_94246_vii1
  rm n_9458_94-Pu-246.zip 
fi 

if [ ! -f downloaded_endf_files/endf_95240_vii1 ]; then
  echo "endf_95240_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9540_95-Am-240.zip 
  unzip n_9540_95-Am-240.zip 
  mv n_9540_95-Am-240.dat downloaded_endf_files/endf_95240_vii1
  rm n_9540_95-Am-240.zip 
fi 

if [ ! -f downloaded_endf_files/endf_95241_vii1 ]; then
  echo "endf_95241_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9543_95-Am-241.zip 
  unzip n_9543_95-Am-241.zip 
  mv n_9543_95-Am-241.dat downloaded_endf_files/endf_95241_vii1
  rm n_9543_95-Am-241.zip 
fi 

if [ ! -f downloaded_endf_files/endf_95242_vii1 ]; then
  echo "endf_95242_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9546_95-Am-242.zip 
  unzip n_9546_95-Am-242.zip 
  mv n_9546_95-Am-242.dat downloaded_endf_files/endf_95242_vii1
  rm n_9546_95-Am-242.zip 
fi 

if [ ! -f downloaded_endf_files/endf_95242m_vii1 ]; then
  echo "endf_95242m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9547_95-Am-242M.zip 
  unzip n_9547_95-Am-242M.zip 
  mv n_9547_95-Am-242M.dat downloaded_endf_files/endf_95242m_vii1
  rm n_9547_95-Am-242M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_95243_vii1 ]; then
  echo "endf_95243_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9549_95-Am-243.zip 
  unzip n_9549_95-Am-243.zip 
  mv n_9549_95-Am-243.dat downloaded_endf_files/endf_95243_vii1
  rm n_9549_95-Am-243.zip 
fi 

if [ ! -f downloaded_endf_files/endf_95244_vii1 ]; then
  echo "endf_95244_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9552_95-Am-244.zip 
  unzip n_9552_95-Am-244.zip 
  mv n_9552_95-Am-244.dat downloaded_endf_files/endf_95244_vii1
  rm n_9552_95-Am-244.zip 
fi 

if [ ! -f downloaded_endf_files/endf_95244m_vii1 ]; then
  echo "endf_95244m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9553_95-Am-244M.zip 
  unzip n_9553_95-Am-244M.zip 
  mv n_9553_95-Am-244M.dat downloaded_endf_files/endf_95244m_vii1
  rm n_9553_95-Am-244M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96240_vii1 ]; then
  echo "endf_96240_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9625_96-Cm-240.zip 
  unzip n_9625_96-Cm-240.zip 
  mv n_9625_96-Cm-240.dat downloaded_endf_files/endf_96240_vii1
  rm n_9625_96-Cm-240.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96241_vii1 ]; then
  echo "endf_96241_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9628_96-Cm-241.zip 
  unzip n_9628_96-Cm-241.zip 
  mv n_9628_96-Cm-241.dat downloaded_endf_files/endf_96241_vii1
  rm n_9628_96-Cm-241.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96242_vii1 ]; then
  echo "endf_96242_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9631_96-Cm-242.zip 
  unzip n_9631_96-Cm-242.zip 
  mv n_9631_96-Cm-242.dat downloaded_endf_files/endf_96242_vii1
  rm n_9631_96-Cm-242.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96243_vii1 ]; then
  echo "endf_96243_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9634_96-Cm-243.zip 
  unzip n_9634_96-Cm-243.zip 
  mv n_9634_96-Cm-243.dat downloaded_endf_files/endf_96243_vii1
  rm n_9634_96-Cm-243.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96244_vii1 ]; then
  echo "endf_96244_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9637_96-Cm-244.zip 
  unzip n_9637_96-Cm-244.zip 
  mv n_9637_96-Cm-244.dat downloaded_endf_files/endf_96244_vii1
  rm n_9637_96-Cm-244.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96245_vii1 ]; then
  echo "endf_96245_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9640_96-Cm-245.zip 
  unzip n_9640_96-Cm-245.zip 
  mv n_9640_96-Cm-245.dat downloaded_endf_files/endf_96245_vii1
  rm n_9640_96-Cm-245.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96246_vii1 ]; then
  echo "endf_96246_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9643_96-Cm-246.zip 
  unzip n_9643_96-Cm-246.zip 
  mv n_9643_96-Cm-246.dat downloaded_endf_files/endf_96246_vii1
  rm n_9643_96-Cm-246.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96247_vii1 ]; then
  echo "endf_96247_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9646_96-Cm-247.zip 
  unzip n_9646_96-Cm-247.zip 
  mv n_9646_96-Cm-247.dat downloaded_endf_files/endf_96247_vii1
  rm n_9646_96-Cm-247.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96248_vii1 ]; then
  echo "endf_96248_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9649_96-Cm-248.zip 
  unzip n_9649_96-Cm-248.zip 
  mv n_9649_96-Cm-248.dat downloaded_endf_files/endf_96248_vii1
  rm n_9649_96-Cm-248.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96249_vii1 ]; then
  echo "endf_96249_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9652_96-Cm-249.zip 
  unzip n_9652_96-Cm-249.zip 
  mv n_9652_96-Cm-249.dat downloaded_endf_files/endf_96249_vii1
  rm n_9652_96-Cm-249.zip 
fi 

if [ ! -f downloaded_endf_files/endf_96250_vii1 ]; then
  echo "endf_96250_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9655_96-Cm-250.zip 
  unzip n_9655_96-Cm-250.zip 
  mv n_9655_96-Cm-250.dat downloaded_endf_files/endf_96250_vii1
  rm n_9655_96-Cm-250.zip 
fi 

if [ ! -f downloaded_endf_files/endf_97245_vii1 ]; then
  echo "endf_97245_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9740_97-Bk-245.zip 
  unzip n_9740_97-Bk-245.zip 
  mv n_9740_97-Bk-245.dat downloaded_endf_files/endf_97245_vii1
  rm n_9740_97-Bk-245.zip 
fi 

if [ ! -f downloaded_endf_files/endf_97246_vii1 ]; then
  echo "endf_97246_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9743_97-Bk-246.zip 
  unzip n_9743_97-Bk-246.zip 
  mv n_9743_97-Bk-246.dat downloaded_endf_files/endf_97246_vii1
  rm n_9743_97-Bk-246.zip 
fi 

if [ ! -f downloaded_endf_files/endf_97247_vii1 ]; then
  echo "endf_97247_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9746_97-Bk-247.zip 
  unzip n_9746_97-Bk-247.zip 
  mv n_9746_97-Bk-247.dat downloaded_endf_files/endf_97247_vii1
  rm n_9746_97-Bk-247.zip 
fi 

if [ ! -f downloaded_endf_files/endf_97248_vii1 ]; then
  echo "endf_97248_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9749_97-Bk-248.zip 
  unzip n_9749_97-Bk-248.zip 
  mv n_9749_97-Bk-248.dat downloaded_endf_files/endf_97248_vii1
  rm n_9749_97-Bk-248.zip 
fi 

if [ ! -f downloaded_endf_files/endf_97249_vii1 ]; then
  echo "endf_97249_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9752_97-Bk-249.zip 
  unzip n_9752_97-Bk-249.zip 
  mv n_9752_97-Bk-249.dat downloaded_endf_files/endf_97249_vii1
  rm n_9752_97-Bk-249.zip 
fi 

if [ ! -f downloaded_endf_files/endf_97250_vii1 ]; then
  echo "endf_97250_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9755_97-Bk-250.zip 
  unzip n_9755_97-Bk-250.zip 
  mv n_9755_97-Bk-250.dat downloaded_endf_files/endf_97250_vii1
  rm n_9755_97-Bk-250.zip 
fi 

if [ ! -f downloaded_endf_files/endf_98246_vii1 ]; then
  echo "endf_98246_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9843_98-Cf-246.zip 
  unzip n_9843_98-Cf-246.zip 
  mv n_9843_98-Cf-246.dat downloaded_endf_files/endf_98246_vii1
  rm n_9843_98-Cf-246.zip 
fi 

if [ ! -f downloaded_endf_files/endf_98248_vii1 ]; then
  echo "endf_98248_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9849_98-Cf-248.zip 
  unzip n_9849_98-Cf-248.zip 
  mv n_9849_98-Cf-248.dat downloaded_endf_files/endf_98248_vii1
  rm n_9849_98-Cf-248.zip 
fi 

if [ ! -f downloaded_endf_files/endf_98249_vii1 ]; then
  echo "endf_98249_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9852_98-Cf-249.zip 
  unzip n_9852_98-Cf-249.zip 
  mv n_9852_98-Cf-249.dat downloaded_endf_files/endf_98249_vii1
  rm n_9852_98-Cf-249.zip 
fi 

if [ ! -f downloaded_endf_files/endf_98250_vii1 ]; then
  echo "endf_98250_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9855_98-Cf-250.zip 
  unzip n_9855_98-Cf-250.zip 
  mv n_9855_98-Cf-250.dat downloaded_endf_files/endf_98250_vii1
  rm n_9855_98-Cf-250.zip 
fi 

if [ ! -f downloaded_endf_files/endf_98251_vii1 ]; then
  echo "endf_98251_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9858_98-Cf-251.zip 
  unzip n_9858_98-Cf-251.zip 
  mv n_9858_98-Cf-251.dat downloaded_endf_files/endf_98251_vii1
  rm n_9858_98-Cf-251.zip 
fi 

if [ ! -f downloaded_endf_files/endf_98252_vii1 ]; then
  echo "endf_98252_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9861_98-Cf-252.zip 
  unzip n_9861_98-Cf-252.zip 
  mv n_9861_98-Cf-252.dat downloaded_endf_files/endf_98252_vii1
  rm n_9861_98-Cf-252.zip 
fi 

if [ ! -f downloaded_endf_files/endf_98253_vii1 ]; then
  echo "endf_98253_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9864_98-Cf-253.zip 
  unzip n_9864_98-Cf-253.zip 
  mv n_9864_98-Cf-253.dat downloaded_endf_files/endf_98253_vii1
  rm n_9864_98-Cf-253.zip 
fi 

if [ ! -f downloaded_endf_files/endf_98254_vii1 ]; then
  echo "endf_98254_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9867_98-Cf-254.zip 
  unzip n_9867_98-Cf-254.zip 
  mv n_9867_98-Cf-254.dat downloaded_endf_files/endf_98254_vii1
  rm n_9867_98-Cf-254.zip 
fi 

if [ ! -f downloaded_endf_files/endf_99251_vii1 ]; then
  echo "endf_99251_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9911_99-Es-251.zip 
  unzip n_9911_99-Es-251.zip 
  mv n_9911_99-Es-251.dat downloaded_endf_files/endf_99251_vii1
  rm n_9911_99-Es-251.zip 
fi 

if [ ! -f downloaded_endf_files/endf_99252_vii1 ]; then
  echo "endf_99252_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9912_99-Es-252.zip 
  unzip n_9912_99-Es-252.zip 
  mv n_9912_99-Es-252.dat downloaded_endf_files/endf_99252_vii1
  rm n_9912_99-Es-252.zip 
fi 

if [ ! -f downloaded_endf_files/endf_99253_vii1 ]; then
  echo "endf_99253_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9913_99-Es-253.zip 
  unzip n_9913_99-Es-253.zip 
  mv n_9913_99-Es-253.dat downloaded_endf_files/endf_99253_vii1
  rm n_9913_99-Es-253.zip 
fi 

if [ ! -f downloaded_endf_files/endf_99254_vii1 ]; then
  echo "endf_99254_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9914_99-Es-254.zip 
  unzip n_9914_99-Es-254.zip 
  mv n_9914_99-Es-254.dat downloaded_endf_files/endf_99254_vii1
  rm n_9914_99-Es-254.zip 
fi 

if [ ! -f downloaded_endf_files/endf_99254m_vii1 ]; then
  echo "endf_99254m_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9915_99-Es-254M.zip 
  unzip n_9915_99-Es-254M.zip 
  mv n_9915_99-Es-254M.dat downloaded_endf_files/endf_99254m_vii1
  rm n_9915_99-Es-254M.zip 
fi 

if [ ! -f downloaded_endf_files/endf_99255_vii1 ]; then
  echo "endf_99255_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9916_99-Es-255.zip 
  unzip n_9916_99-Es-255.zip 
  mv n_9916_99-Es-255.dat downloaded_endf_files/endf_99255_vii1
  rm n_9916_99-Es-255.zip 
fi 

if [ ! -f downloaded_endf_files/endf_100255_vii1 ]; then
  echo "endf_100255_vii1"
  wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/n_9936_100-Fm-255.zip 
  unzip n_9936_100-Fm-255.zip 
  mv n_9936_100-Fm-255.dat downloaded_endf_files/endf_100255_vii1
  rm n_9936_100-Fm-255.zip 
fi 

