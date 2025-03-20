# Target system
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# GNU Compilers
set(CMAKE_C_COMPILER gcc)
set(CMAKE_Fortran_COMPILER gfortran)

# Flags
set(CMAKE_C_FLAGS_INIT "-march=x86-64")
set(CMAKE_Fortran_FLAGS_INIT "-march=x86-64")

# Release flags
set(CMAKE_C_FLAGS_RELEASE_INIT "-O3")
set(CMAKE_Fortran_FLAGS_RELEASE_INIT "-O3")

# Debug flags
set(CMAKE_C_FLAGS_DEBUG_INIT "-g -O0")
set(CMAKE_Fortran_FLAGS_DEBUG_INIT "-g -O0 -fcheck=all -fbacktrace")