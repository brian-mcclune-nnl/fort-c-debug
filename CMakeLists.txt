cmake_minimum_required(VERSION 3.26)
project(fortran_c_example LANGUAGES Fortran C)

# Global settings that apply to all subdirectories
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)

# Enable exporting compile commands for IDE tooling
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Add the src directory, which has its own CMakeLists.txt
add_subdirectory(src)