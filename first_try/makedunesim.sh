#!/bin/sh

source ./defvars.sh

cd $SPLITTARGET
rm -rf *

cp ${SCRIPTDIR}/dunesim/topCMakeLists.txt ./CMakeLists.txt

mkdir dunesim
cd dunesim
mkdir ups
cd ups
cp $UNSPLIT_SOURCE/dunetpc/ups/* .
rm ./product_deps
cp ${SCRIPTDIR}/dunesim/product_deps ./product_deps
cd ..
cp ${SCRIPTDIR}/dunesim/CMakeLists.txt ./CMakeLists.txt
cp -r $UNSPLIT_SOURCE/dunetpc/.gitignore .
mkdir dunesim
cd dunesim
cp ${SCRIPTDIR}/dunesim/dunesim_CMakeLists.txt ./CMakeLists.txt

cp -r $UNSPLIT_SOURCE/dunetpc/dune/DetSim .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/Simulation .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/EventGenerator .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/SpaceCharge .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/SpaceChargeServices .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/SimFilter .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/DetectorVariations .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/LArG4 .

${SCRIPTDIR}/fixinclude.sh

