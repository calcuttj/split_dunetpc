from dataclasses import dataclass
@dataclass
class subdir:
  _name: str
  _paths: list


dunecore = subdir('dunecore',
                  ['dune/ArtSupport/',
                   'dune/DuneInterface/',
                   'dune/Utilities/',
                   'dune/DAQTriggerSim/',
                   'dune/DuneServiceAccess/',
                   'dune/Geometry/',
                   'dune/DuneCommon/',
                   'dune/DuneObj/',
                   'dune/DuneObjDumpers/'])


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
