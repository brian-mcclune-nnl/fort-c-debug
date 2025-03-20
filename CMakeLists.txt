cmake_minimum_required(VERSION 3.26)
project(fortran_c_example LANGUAGES Fortran C)

# Set module output directory to avoid conflicts
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)

# Create library from C source
add_library(add_one_lib
    src/add_one/add_one.c
)

# Create libraries from Fortran sources
add_library(add_two_lib
    src/add_two/add_two.f90
)

add_library(add_three_lib
    src/add_three/add_three.f90
)

# Create executable from Fortran source
add_executable(fortran_c_demo src/main.f90)

# Make module files available to main program
target_include_directories(fortran_c_demo
    PRIVATE
        ${CMAKE_Fortran_MODULE_DIRECTORY}
)

# Link all libraries to the executable
target_link_libraries(fortran_c_demo
    PRIVATE
        add_one_lib
        add_two_lib
        add_three_lib
)