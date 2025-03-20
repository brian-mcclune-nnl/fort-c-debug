# Add each component subdirectory
add_subdirectory(add_one)
add_subdirectory(add_two)
add_subdirectory(add_three)

# Create combined static library
add_library(adders_static STATIC)
set_target_properties(adders_static
    PROPERTIES
    OUTPUT_NAME adders
    PREFIX ""  # Removes "lib" prefix
)

# Create combined shared library
add_library(adders_shared SHARED)
set_target_properties(adders_shared
    PROPERTIES
    OUTPUT_NAME adders
    PREFIX ""  # Removes "lib" prefix
    VERSION 1.0.0
    SOVERSION 1
)

# Link component libraries to both static and shared libraries
foreach(target adders_static adders_shared)
    target_link_libraries(${target}
        PUBLIC
            add_one_lib
            add_two_lib
            add_three_lib
    )
    
    # Make Fortran modules available to users of these libraries
    target_include_directories(${target}
        PUBLIC
            ${CMAKE_Fortran_MODULE_DIRECTORY}
    )
endforeach()

# Create the main executable
add_executable(fortran_c_demo main.f90)

# Link the static library to the executable
# (Could use adders_shared instead if preferred)
target_link_libraries(fortran_c_demo
    PRIVATE
        adders_static
)