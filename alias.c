#include "fftw3.h"

void dfftw_execute_(const fftw_plan* plan) {
    fftw_execute(*plan);
    return;
}

void dfftw_destroy_plan_(fftw_plan* plan) {
    fftw_destroy_plan(*plan);
    return;
}
