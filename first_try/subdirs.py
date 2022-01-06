from dataclasses import dataclass
@dataclass
class subdir:
  _name: str
  _paths: list


duneana = subdir('duneana',
                 ['dune/AnaTree',
                  'dune/CAFMaker',
                  'dune/DAQSimAna',
                  'dune/EnergyStudies',
                  'dune/EventFilters',
                  'dune/HitAnalysis',
                  'dune/PandoraAnalysis',
                  'dune/ProductFilters',
                  'dune/ShowerAna',
                  'dune/SupernovaAna',
                  'dune/TrackingAna'])

dunecalib = subdir('dunecalib',
                   ['dune/Calib',
                    'dune/CalibServices'])

dunecore = subdir('dunecore',
                  ['dune/ArtSupport/',
                   'dune/DuneInterface/',
                   'dune/HDF5Utils/',
                   'dune/Utilities/',
                   'dune/DAQTriggerSim/',
                   'dune/DuneServiceAccess/',
                   'dune/Geometry/',
                   'dune/DuneCommon/',
                   'dune/DuneObj/',
                   'dune/DuneObjDumpers/'])

dunedataprep = subdir('dunedataprep',
                      ['dune/DataPrep',
                       'dune/CalData'])

duneexamples = subdir('duneexamples',
                      ['dune/DuneExample',
                       'dune/GalleryScripts'])

duneopdet = subdir('duneopdet', ['dune/OpticalDetector'])

duneprototypes = subdir('duneprototypes',
                        ['dune/Protodune',
                         'dune/Iceberg',
                         'dune/3x1x1dp',
                         'dune/PhotonPropagation',
                         'dune/BeamData',
                         'dune/Coldbox'])


dunereco = subdir('dunereco',
                  ['dune/AnaUtils',
                   'dune/ClusterFinderDUNE',
                   'dune/CVN',
                   'dune/DUNEPandora',
                   'dune/DUNEWireCell',
                   'dune/FDSensOpt',
                   'dune/HitFinderDUNE',
                   'dune/InfillChannels',
                   'dune/RecoAlgDUNE',
                   'dune/RegCNN',
                   'dune/SNSlicer',
                   'dune/SNUtils',
                   'dune/TrackFinderDUNE',
                   'dune/TrackPID',
                   'dune/VLNets'])

dunesim = subdir('dunesim',
                 ['dune/DetSim',
                  'dune/Simulation',
                  'dune/EventGenerator',
                  'dune/SpaceCharge',
                  'dune/SpaceChargeServices',
                  'dune/SimFilter',
                  'dune/DetectorVariations',
                  'dune/LArG4'])


dunesw = subdir('dunesw', ['test', 'fcl'])


all_subdirs = {
  'duneana':duneana,
  'dunecalib':dunecalib,
  'dunecore':dunecore,
  'dunedataprep':dunedataprep,
  'duneexamples': duneexamples,
  'duneopdet': duneopdet,
  'duneprototypes': duneprototypes,
  'dunereco': dunereco,
  'dunesim': dunesim,
  'dunesw': dunesw
}
