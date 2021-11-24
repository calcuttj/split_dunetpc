import os
import git_filter_repo as gfr
import subprocess
import sys
from shutil import copyfile

_name = 'dunecore'

_paths = [
    'dune/ArtSupport/',
    'dune/DuneInterface/',
    'dune/Utilities/',
    'dune/DAQTriggerSim/',
    'dune/DuneServiceAccess/',
    'dune/Geometry/',
    'dune/DuneCommon/',
    'dune/DuneObj/',
    'dune/DuneObjDumpers/'
]


if __name__ == '__main__':
  split_dunetpc_dir = os.getcwd()
  os.chdir(sys.argv[1])
  if not os.path.isdir('%s/suite'%sys.argv[1]):
    os.mkdir('suite')
  os.chdir('suite')
  
  
  subprocess.run(['git', 'clone', 'ssh://p-dunetpc@cdcvs.fnal.gov/cvs/projects/dunetpc', 'dunecore'])
  os.chdir('dunecore')
  
  
  filter_options = [
      '--path', '.gitignore',
      '--path', 'CMakeLists.txt',
      '--path', 'ups/',
      '--path', 'Modules/',
      '--path', 'dune/ArtSupport/',
      '--path', 'dune/DuneInterface/',
      '--path', 'dune/Utilities/',
      '--path', 'dune/DAQTriggerSim/',
      '--path', 'dune/DuneServiceAccess/',
      '--path', 'dune/Geometry/',
      '--path', 'dune/DuneCommon/',
      '--path', 'dune/DuneObj/',
      '--path', 'dune/DuneObjDumpers/',
      '--path', 'dune/CMakeLists.txt',
      '--path-rename', 'dune/:dunecore/'
  ]
  
  gfr.setup_gettext()
  args = gfr.FilteringOptions.parse_args(filter_options)
  filter_cmd = gfr.RepoFilter(args)
  filter_cmd.run()
  
  copyfile('%s/dunecore/product_deps'%split_dunetpc_dir, 'ups/product_deps')
  copyfile('%s/dunecore/CMakeLists.txt'%split_dunetpc_dir, 'CMakeLists.txt')
  copyfile('%s/dunecore/dunecore_CMakeLists.txt'%split_dunetpc_dir, 'dunecore/CMakeLists.txt')
