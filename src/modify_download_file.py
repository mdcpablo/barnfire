def ReadFile(filename):
    # Reads a file as a 1D and 2D list 
    # The 1D list contains lines the file, the 2D list delimits each line by space
    f = open(filename)
    list_1D = []
    list_2D = []
    for line in f:
        list_1D.append(line)
        list_2D.append(line.split())
    f.close()
    return list_1D, list_2D

script_1D, script_2D = ReadFile('download_endf.sh')

fout = open('new_download_endf.sh','w')
fout.write('mkdir downloaded_endf_files \n\n')
for i in range(len(script_1D)):
    if 'wget' in script_1D[i]:
        isofile = script_2D[i+2][2]
        fout.write('if [ ! -f downloaded_endf_files/'+isofile+' ]; then\n')
        fout.write('  echo "'+isofile+'"\n')
        fout.write('  '+script_1D[i])
        fout.write('  '+script_1D[i+1])
        fout.write('  '+script_2D[i+2][0]+' '+script_2D[i+2][1]+' downloaded_endf_files/'+isofile+'\n')
        fout.write('  '+script_1D[i+3])
        fout.write('fi \n\n')
