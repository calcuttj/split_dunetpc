#!/bin/sh

source ./defvars.sh

LARSOFT_VERSION=v09_37_01
COMPILER=e20
DIRECTORY=split_target
USERNAME=`whoami`

source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh

cd ${TARGETDIR}
touch ${DIRECTORY}
rm -rf ${DIRECTORY}
mkdir ${DIRECTORY}
cd ${DIRECTORY}
setup larsoft ${LARSOFT_VERSION} -q ${COMPILER}:prof
mrb newDev -q ${COMPILER}:prof
source ${TARGETDIR}/${DIRECTORY}/localProducts*/setup
mkdir work
cd srcs
#mrb g dunetpc

#cd $MRB_BUILDDIR
#mrbsetenv
#mrb i -j16

