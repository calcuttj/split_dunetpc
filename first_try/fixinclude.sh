#!/bin/sh

#-------------------
#  dunecore fixes
#-------------------

echo "dunecore"
for dname in ArtSupport DuneInterface Utilities DAQTriggerSim DuneServiceAccess Geometry DuneCommon DuneObj HDF5Utils; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@dunecore/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@dunecore_${dname}@" {} +
done

find . -type f -name "CMakeLists.txt" -exec sed -i s"@dunetpc_inc_dir@dunecore_inc_dir@" {} +

# might have to restrict the following -- so far, all the dune:: instances go in dunecore but this
# may not always be true

find . -type f -name "CMakeLists.txt" -exec sed -i s"@dune::@dunecore::@" {} +
find . -type f -name "*.cmake" -exec sed -i s"@dune::@dunecore::@" {} +

for libname in SignalShapingServiceDUNE_service \
               SignalShapingServiceDUNEDPhase_service \
               SignalShapingServiceDUNE10kt_service \
               SignalShapingServiceDUNE35t_service \
               CrpGainService_service ; do
  find . -type f -name "CMakeLists.txt" -exec sed -i s"@${libname}@dunecore::${libname}@" {} +
done

find . -type f -wholename "*Coldbox/vd/CMakeLists.txt" -exec sed -i s"@HDF5Utils@dunecore::HDF5Utils@" {} +

find . -type f -wholename "*Coldbox/hd/CMakeLists.txt" -exec sed -i s"@HDF5Utils@dunecore::HDF5Utils@" {} +

#-------------------
#  duneprototypes fixes
#-------------------

echo "duneprototypes"
for dname in Protodune Iceberg Coldbox; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@duneprototypes/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@duneprototypes_${dname}@" {} +
done

#-------------------
#  duneopdet fixes.  This one's different as there's only one directory in it
#-------------------

for dname in OpticalDetector PhotonPropagation; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@duneopdet/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@duneopdet_${dname}@" {} +
done

#-------------------
#  dunesim fixes
#-------------------

echo "dunesim"
for dname in DetSim Simulation EventGenerator SpaceCharge SpaceChargeServices SimFilter DAQTriggerSim DetectorVariations LArG4; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@dunesim/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@dunesim_${dname}@" {} +
done

#-------------------
#  dunecalib fixes
#-------------------

echo "dunecalib"
for dname in Calib CalibServices; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@dunecalib/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@dunecalib_${dname}@" {} +
done

#-------------------
#  duneprototypes fixes
#-------------------

echo "duneprototypes"
for dname in Protodune Iceberg 3x1x1dp BeamData; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@duneprototypes/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@duneprototypes_${dname}@" {} +
done

#-------------------
#  dunedataprep fixes
#-------------------

echo "duneprototypes"
for dname in DataPrep CalData; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@dunedataprep/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@dunedataprep_${dname}@" {} +
done


#-------------------
#  dunereco fixes
#-------------------

echo "dunereco"
for dname in AnaUtils ClusterFinderDUNE CVN DUNEPandora DUNEWireCell FDSensOpt HitFinderDUNE InfillChannels RecoAlgDUNE RegCNN SNSlicer SNUtils TrackFinderDUNE TrackPID VLNets; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@dunereco/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@dunereco_${dname}@" {} +
done

find . -type f -wholename "*DUNEPandora/scripts/CMakeLists.txt" -exec sed -i s"@dunetpc_SCRIPTS_DIR@dunereco_SCRIPTS_DIR@" {} +

#-------------------
#  duneana fixes
#-------------------

echo "duneana"
for dname in AnaTree CAFMaker DAQSimAna EnergyStudies EventFilters HitAnalysis PandoraAnalysis ProductFilters ShowerAna SupernovaAna TrackingAna; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@duneana/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@duneana_${dname}@" {} +
done
find . -type f -wholename "*HitAnalysis/CMakeLists.txt" -exec sed -i s"@HitFinderDUNE@dunereco::HitFinderDUNE@" {} +

#-------------------
#  duneexamples fixes
#-------------------

echo "duneexamples"
for dname in DuneExample GalleryScripts; do
  for exname in cc cxx h hh cpp; do
    find . -type f -name "*.${exname}" -exec sed -i s"@dune/${dname}@duneexamples/${dname}@" {} +
  done
  find . -type f -name "*.txt" -exec sed -i s"@dune_${dname}@duneexamples_${dname}@" {} +
done

#-------------------
#  duneconfig fixes
#-------------------

find . -type f -name "*.txt" -exec sed -i s"@dunetpc_fcl_dir@dunesw_fcl_dir@" {} +
find . -type f -name "*.txt" -exec sed -i s"@dunetpc_FHICL_DIR@dunesw_FHICL_DIR@" {} +
