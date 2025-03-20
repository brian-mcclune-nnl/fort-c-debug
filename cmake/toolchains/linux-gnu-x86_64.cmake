# Target system
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# GNU Compilers
set(CMAKE_C_COMPILER gcc)
set(CMAKE_Fortran_COMPILER gfortran)

# Base flags - these will be the default if no other flags are specified
set(CMAKE_C_FLAGS_INIT "-march=x86-64")
set(CMAKE_Fortran_FLAGS_INIT "-march=x86-64")

# You can also set flags directly, but this might override user preferences
# set(CMAKE_C_FLAGS "-march=x86-64")
# set(CMAKE_Fortran_FLAGS "-march=x86-64")

# Build-type specific flags
set(CMAKE_C_FLAGS_RELEASE_INIT "-O3")
set(CMAKE_Fortran_FLAGS_RELEASE_INIT "-O3")

set(CMAKE_C_FLAGS_DEBUG_INIT "-g -O0")
set(CMAKE_Fortran_FLAGS_DEBUG_INIT "-g -O0 -fcheck=all -fbacktrace")

# Example of how flags combine:
# Final Debug flags will be:
#   ${CMAKE_C_FLAGS_INIT} + user's CMAKE_C_FLAGS + ${CMAKE_C_FLAGS_DEBUG_INIT} + user's CMAKE_C_FLAGS_DEBUG
# Final Release flags will be:
#   ${CMAKE_C_FLAGS_INIT} + user's CMAKE_C_FLAGS + ${CMAKE_C_FLAGS_RELEASE_INIT} + user's CMAKE_C_FLAGS_RELEASE