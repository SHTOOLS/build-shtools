# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

# OpenBLAS version for systems that use it.
OPENBLAS_VERSION=0.2.18

source gfortran-install/gfortran_utils.sh

function build_fftw {
    build_simple fftw 3.3.6-pl2 http://www.fftw.org
}

function build_openblas_gfortran {
    local plat=${1:-$PLAT}
    local tar_path=$(abspath $(get_gf_lib "openblas-${OPENBLAS_VERSION}" "$plat"))
    (cd / && tar zxf $tar_path)
}

function pre_build {
    rm -f SHTOOLS/setup.py
    cp ./posix_setup.py SHTOOLS/setup.py
    if [ -n "$IS_OSX" ]; then
        brew update
        brew install gcc
        brew install fftw --with-fortran
    else
        export CC="gcc -fPIC"
        build_openblas_gfortran
        build_fftw
    fi
}

function run_tests {
    :
}
