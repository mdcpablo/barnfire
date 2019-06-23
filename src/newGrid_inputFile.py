###############################################################################
# Provide the full path of the "src" directory where "newGrid.py" exists
###############################################################################
newGridSrcDir = 

###############################################################################
# Define inputs below (these can be modified in the terminal command line)
###############################################################################
defaults = {}
defaults['hilbertSpace'] = ['flux','sigt']
defaults['discretization'] = ['feds']
defaults['numberOfGroups'] = [10,20]
defaults['xsFileNames'] = ['BarnfireXS_Godiva_502.xml']
defaults['clustFileName'] = 'clust-500-9.xml'
defaults['plots'] = ['all']

###############################################################################
import sys
sys.path.append(newGridSrcDir)
import newGrid
if __name__ == '__main__':
    parser = newGrid.define_input_parser()
    commandLineOpts = vars(parser.parse_args())
    print commandLineOpts
    if commandLineOpts['hilbertSpace']    == None: # if -H wasn't used in the command line, use inputs['hilbertSpaceList'] from input file
        commandLineOpts['hilbertSpace']   = defaults['hilbertSpace']
    if commandLineOpts['discretization']  == None: # if -x wasn't used in the command line, use inputs['discretization'] from input file
        commandLineOpts['discretization'] = defaults['discretization']
    if commandLineOpts['numberOfGroups']  == None: # if -n wasn't used in the command line, use inputs['numberOfGroups'] from input file
        commandLineOpts['numberOfGroups'] = defaults['numberOfGroups']
    if commandLineOpts['xsFileNames']     == None: # if -x wasn't used in the command line, use inputs['xsFileNames'] from input file
        commandLineOpts['xsFileNames']    = defaults['xsFileNames']
    if commandLineOpts['clustFileName']   == None: # if -x wasn't used in the command line, use inputs['clustFileName'] from input file
        commandLineOpts['clustFileName']  = defaults['clustFileName']
    if commandLineOpts['plots']           == None: # if -p wasn't used in the command line, use inputs['plots'] from input file
        commandLineOpts['plots']          = defaults['plots']
    if commandLineOpts['verbosity'] > 0:
        print 'Summary of inputs:'
        print commandLineOpts
    newGrid.newGrid(commandLineOpts)
###############################################################################







