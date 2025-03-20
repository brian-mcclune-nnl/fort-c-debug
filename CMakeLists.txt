cmake_minimum_required(VERSION 3.26)

# Enable PIE check policy if available
cmake_policy(SET CMP0083 NEW)

# Enable MSVC PIE support if available
if(POLICY CMP0123)
    cmake_policy(SET CMP0123 NEW)
endif()

project(fortran_c_example LANGUAGES Fortran C)

# Check if PIE is supported and enable it
include(CheckPIESupported)
check_pie_supported()

# Enable PIC and PIE (if supported) for all targets
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
if(CMAKE_PIE_SUPPORTED)
    set(CMAKE_POSITION_INDEPENDENT_EXECUTABLE ON)
endif()

# Global settings that apply to all subdirectories
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)

# Enable exporting compile commands for IDE tooling
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Add the src directory, which has its own CMakeLists.txt
add_subdirectory(src)