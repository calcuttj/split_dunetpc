import os
import git_filter_repo as gfr
import subprocess
import sys
from shutil import copyfile

import dunecore

_top_path = os.path.dirname(os.path.realpath(__file__))
_work_path = os.getcwd()

def make_dir(subdir):
  print('Copying dunetpc to %s'%subdir._name)
  subprocess.run(['cp', '-r', 'dunetpc', 'suite/%s'%subdir._name])

def build_options(subdir):
  paths = ['.gitignore', 'CMakeLists.txt', 'ups/', 'Modules/',
           'dune/CMakeLists.txt']
  paths += subdir._paths

  filter_options = []
  for p in paths:
    filter_options += ['--path', p]
  
  filter_options += ['--path-rename', 'dune/:%s/'%subdir._name]
  return filter_options


def filter_repo(subdir):
  os.chdir('suite/%s'%subdir._name)

  filter_options = build_options(subdir)
  args = gfr.FilteringOptions.parse_args(filter_options)
  filter_cmd = gfr.RepoFilter(args)
  filter_cmd.run()

  copyfile('%s/%s/product_deps'%(_top_path, subdir._name), 'ups/product_deps')
  copyfile('%s/%s/CMakeLists.txt'%(_top_path, subdir._name), 'CMakeLists.txt')
  subdir_cmake = '%s/%s/%s_CMakeLists.txt'%(_top_path, subdir._name, subdir._name)
  copyfile(subdir_cmake,
           '%s/CMakeLists.txt'%subdir._name)

if __name__ == '__main__':

  do_clone = True
  if any(os.scandir('.')):
    print('Current directory is not empty. Checking for suite/')
    if os.path.isdir('suite'):
      print('Found suite. Exiting now')
      exit()
    print('Checking for dunetpc')
    do_clone = not os.path.isdir('dunetpc')
    
  os.mkdir('suite')
  if do_clone:
    print('Will clone dunetpc')
    subprocess.run(['git', 'clone',
                    'ssh://p-dunetpc@cdcvs.fnal.gov/cvs/projects/dunetpc'])
  else: print('Will not clone dunetpc')


  gfr.setup_gettext()
  make_dir(dunecore)
  filter_repo(dunecore)

