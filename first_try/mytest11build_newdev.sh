#!/bin/sh

source ./defvars.sh

DUNETPC_TAG=v09_41_00_02
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
mrb newDev -q ${COMPILER}:prof
source ${TARGETDIR}/${DIRECTORY}/localProducts*/setup
mkdir work
cd srcs
mrb g -t ${DUNETPC_TAG}${TAGSUFFIX} dunetpc

cd $MRB_BUILDDIR
mrbsetenv
#mrb i -j16

