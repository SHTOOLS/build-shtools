# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

source spinner.sh

function build_fftw {
    build_simple fftw 3.3.6-pl2 http://www.fftw.org
}

function pre_build {
    if [ -n "$IS_OSX" ]; then
        brew update
        brew install gcc fftw
    else
        start_spinner "Installing OpenBLAS"
        build_openblas >/dev/null 2>&1
        stop_spinner
        start_spinner "Installing FFTW"
        build_fftw >/dev/null 2>&1
        stop_spinner
    fi
}

function run_tests {
    :
}
