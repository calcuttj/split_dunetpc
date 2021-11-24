#!/bin/sh

source ./defvars.sh

cd ${SPLITTARGET}
rm -rf *

cp ${SCRIPTDIR}/dunecore/topCMakeLists.txt ./CMakeLists.txt

mkdir dunecore
cd dunecore
mkdir ups
cd ups
cp ${UNSPLIT_SOURCE}/dunetpc/ups/* .
rm ./product_deps
cp ${SCRIPTDIR}/dunecore/product_deps ./product_deps
cd ..
cp ${SCRIPTDIR}/dunecore/CMakeLists.txt ./CMakeLists.txt
cp -r $UNSPLIT_SOURCE/dunetpc/.gitignore .
mkdir dunecore
cd dunecore
cp ${SCRIPTDIR}/dunecore/dunecore_CMakeLists.txt ./CMakeLists.txt

cp -r $UNSPLIT_SOURCE/dunetpc/dune/ArtSupport .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/DuneInterface .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/Utilities .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/DAQTriggerSim .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/DuneServiceAccess .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/Geometry .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/DuneCommon .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/DuneObj .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/DuneObjDumpers .
cp -r $UNSPLIT_SOURCE/dunetpc/dune/HDF5Utils .
cp -r $UNSPLIT_SOURCE/dunetpc/Modules ..
cd ..

${SCRIPTDIR}/fixinclude.sh

