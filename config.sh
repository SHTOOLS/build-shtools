# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

source gfortran-install/gfortran_utils.sh

function build_fftw {
    build_simple fftw 3.3.6-pl2 http://www.fftw.org
}

function pre_build {
    if [ -n "$IS_OSX" ]; then
        install_gfortran
    fi

    build_openblas
    build_fftw    
}

function run_tests {
    :
}
