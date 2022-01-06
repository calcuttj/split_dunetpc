#!/bin/sh

source ./defvars.sh

LARSOFT_VERSION=v09_39_01_01
#TAGSUFFIX=_trj23nov2021
COMPILER=e20
DIRECTORY=splitter11
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
mrb g -t ${LARSOFT_VERSION}${TAGSUFFIX} dunetpc

cd $MRB_BUILDDIR
mrbsetenv
#mrb i -j16

