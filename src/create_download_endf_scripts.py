def ReadFile(filename):
    f = open(filename)
    list_1D = []
    list_2D = []
    for line in f:
        list_1D.append(line)
        list_2D.append(line.split())
    f.close()
    return list_1D, list_2D

[endf_xs_list_1D, endf_xs_list_2D] = ReadFile('raw_endf_list.txt')

class Nuclide:
    def __init__(self, zipfile, name, Z, A):
        self.zipfile = zipfile
        self.name = name
        self.Z = Z
        self.A = A

nuclideList = []
for line in endf_xs_list_2D:
    if len(line) > 3:
        zipfile = line[2] 
        zipsplit = zipfile.replace('_',' ').replace('-',' ').replace('.',' ').split()
        name = zipsplit[3]
        Z = zipsplit[2]
        A = zipsplit[4]
        nuclideList.append(Nuclide(zipfile,name,Z,A))

with open('endf_download_list.sh', 'w') as fid:
  for nuclide in nuclideList:
      if 'M' in nuclide.A:
          outname = 'endf_'+str(int(nuclide.Z)*1000 + int(nuclide.A.replace('M', '')))+'m_vii1'
      else:
          outname = 'endf_'+str(int(nuclide.Z)*1000 + int(nuclide.A))+'_vii1'
      fid.write('wget https://www-nds.iaea.org/public/download-endf/ENDF-B-VII.1/n/{0} -O {1}\n'.format(nuclide.zipfile, outname))

with open('download_endf_in_parallel.sh', 'w') as fid:
  fid.write('#! /usr/bin/env bash\n')
  fid.write('#wget endf files in parallel!\n')
  fid.write('\n')
  fid.write('cat endf_download_list.sh | parallel\n')
  fid.write('mkdir downloaded_endf_files\n')
  fid.write('mv endf_*_vii1 downloaded_endf_files/.\n')



