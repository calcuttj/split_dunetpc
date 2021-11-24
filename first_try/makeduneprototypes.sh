#!/bin/sh

source ./defvars.sh

cd $SPLITTARGET
rm -rf *

cp ${SCRIPTDIR}/duneprototypes/topCMakeLists.txt ./CMakeLists.txt

mkdir duneprototypes
cd duneprototypes
mkdir ups
cd ups
cp $UNSPLIT_SOURCE/dunetpc/ups/* .
rm ./product_deps
cp ${SCRIPTDIR}/duneprototypes/product_deps ./product_deps
cd ..
cp ${SCRIPTDIR}/duneprototypes/CMakeLists.txt ./CMakeLists.txt
cp -r $UNSPLIT_SOURCE/dunetpc/.gitignore .
mkdir duneprototypes
cd duneprototypes
cp ${SCRIPTDIR}/duneprototypes/duneprototypes_CMakeLists.txt ./CMakeLists.txt

cp -r $UNSPLIT_SOURCE/dunetpc/dune/Protodune .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/Iceberg .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/3x1x1dp .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/BeamData .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/Coldbox .

${SCRIPTDIR}/fixinclude.sh

