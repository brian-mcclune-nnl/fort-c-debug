# Create the add_three library as an object library
add_library(add_three_lib OBJECT
    add_three.f90
)

# Specify module directory for this target
set_target_properties(add_three_lib
    PROPERTIES
    Fortran_MODULE_DIRECTORY ${CMAKE_Fortran_MODULE_DIRECTORY}
)

# Add warnings-as-errors flags for specific compilers
target_compile_options(add_three_lib
    PRIVATE
        $<$<Fortran_COMPILER_ID:GNU>:-Werror>
        $<$<Fortran_COMPILER_ID:Intel>:-warn error>
)