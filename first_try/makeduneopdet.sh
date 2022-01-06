#!/bin/sh

source ./defvars.sh

cd $SPLITTARGET
rm -rf *

cp ${SCRIPTDIR}/duneopdet/topCMakeLists.txt ./CMakeLists.txt

mkdir duneopdet
cd duneopdet
mkdir ups
cd ups
cp $UNSPLIT_SOURCE/dunetpc/ups/* .
rm ./product_deps
cp ${SCRIPTDIR}/duneopdet/product_deps ./product_deps
cd ..
cp ${SCRIPTDIR}/duneopdet/CMakeLists.txt ./CMakeLists.txt
cp -r $UNSPLIT_SOURCE/dunetpc/.gitignore .
mkdir duneopdet
cd duneopdet
cp ${SCRIPTDIR}/duneopdet/duneopdet_CMakeLists.txt ./CMakeLists.txt

cp -r $UNSPLIT_SOURCE/dunetpc/dune/OpticalDetector .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/PhotonPropagation .

${SCRIPTDIR}/fixinclude.sh


