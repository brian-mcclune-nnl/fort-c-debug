cmake_minimum_required(VERSION 3.10)
project(fortran_c_example LANGUAGES Fortran C)

# Create library from C source
add_library(add_one_lib add_one.c)

# Create executable from Fortran source
add_executable(fortran_c_demo main.f90)

# Link the C library to the Fortran executable
target_link_libraries(fortran_c_demo add_one_lib)
