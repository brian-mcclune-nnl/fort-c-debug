# Create the add_two library
add_library(add_two_lib
    add_two.f90
)

# Specify module directory for this target
set_target_properties(add_two_lib
    PROPERTIES
    Fortran_MODULE_DIRECTORY ${CMAKE_Fortran_MODULE_DIRECTORY}
)