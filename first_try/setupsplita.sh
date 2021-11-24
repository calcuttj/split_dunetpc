# source this to set up the split products before build

source ./defvars.sh

source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
source ${SPLITDIR}/localProducts*/setup
export PRODUCTS=${SPLITPRODUCTS}:${PRODUCTS}
cd ${MRB_BUILDDIR}
mrbsetenv
