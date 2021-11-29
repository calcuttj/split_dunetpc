import os
import git_filter_repo as gfr
import subprocess
import sys
from shutil import copyfile
import argparse

from subdirs import *

_top_path = os.path.dirname(os.path.realpath(__file__))
_work_path = os.getcwd()

def make_dir(subdir, dunetpc_path):
  print('Copying dunetpc to %s'%subdir._name)
  subprocess.run(['cp', '-r', dunetpc_path, 'srcs/%s'%subdir._name])

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
  os.chdir('srcs/%s'%subdir._name)

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

  parser = argparse.ArgumentParser()
  parser.add_argument('-d', '--dirs', help='Which dirs to check', type=str,
                      nargs='+')
  parser.add_argument('--all', help='Do all dirs', action='store_true')
  parser.add_argument('--dunetpc', help='Which dunetpc to copy. Note, if --clone is provided. dunetpc will be cloned to this directory', type=str,
                      default='./dunetpc')
  parser.add_argument('--clone', help='Use to tell this to clone a copy of dunetpc', action='store_true')
  args = parser.parse_args()

  if args.all:
    modules = list(all_subdirs.values())
  elif not args.dirs:
    print('Error. no dirs provided. Please supply with -d or --dirs')
    exit()
  else:
    modules = [all_subdirs[d] for d in args.dirs]

  do_clone = True
  if any(os.scandir('.')):
    print('Current directory is not empty. Checking for srcs/')
    if os.path.isdir('srcs'):
      print('Found srcs.')
    else:
      print('Making srcs')
      os.mkdir('srcs')

  print('Checking for dunetpc')
  present = os.path.isdir(args.dunetpc)
  print('Found?', present)
    

  if (not present) and args.clone:
    print('Will clone dunetpc')
    subprocess.run(['git', 'clone',
                    'ssh://p-dunetpc@cdcvs.fnal.gov/cvs/projects/dunetpc',
                    args.dunetpc])
  elif (not present) and (not args.clone):
    print('Error. --clone not provided and dunetpc location is not found. Exiting')
    exit()

  gfr.setup_gettext()


  for module in modules:
    print('###Working on', module._name)
    make_dir(module, args.dunetpc)
    filter_repo(module)
    os.chdir(_work_path)

  os.chdir('srcs')
  copyfile('%s/top_CMake_template.txt'%_top_path, './CMakeLists.txt')

  print ('Done filtering repositories. Copied over top-level CMakeLists.txt. Set up local products and run mrb uc')
