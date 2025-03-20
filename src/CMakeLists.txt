# Add each component subdirectory
add_subdirectory(add_one)
add_subdirectory(add_two)
add_subdirectory(add_three)

# Create combined static library
add_library(adders_static STATIC)
target_sources(adders_static
    PRIVATE
        $<TARGET_OBJECTS:add_one_lib>
        $<TARGET_OBJECTS:add_two_lib>
        $<TARGET_OBJECTS:add_three_lib>
)
set_target_properties(adders_static
    PROPERTIES
    OUTPUT_NAME adders
    PREFIX ""  # Removes "lib" prefix
)

# Create combined shared library
add_library(adders_shared SHARED)
target_sources(adders_shared
    PRIVATE
        $<TARGET_OBJECTS:add_one_lib>
        $<TARGET_OBJECTS:add_two_lib>
        $<TARGET_OBJECTS:add_three_lib>
)
set_target_properties(adders_shared
    PROPERTIES
    OUTPUT_NAME adders
    PREFIX ""  # Removes "lib" prefix
    VERSION 1.0.0
    SOVERSION 1
)

# Make component libraries build with object files
set_target_properties(add_one_lib add_two_lib add_three_lib
    PROPERTIES
    POSITION_INDEPENDENT_CODE ON  # Needed for shared library
    ENABLE_EXPORTS ON            # Needed for shared library
)

# Convert component libraries to object libraries
set_property(TARGET add_one_lib PROPERTY LIBRARY_TYPE OBJECT)
set_property(TARGET add_two_lib PROPERTY LIBRARY_TYPE OBJECT)
set_property(TARGET add_three_lib PROPERTY LIBRARY_TYPE OBJECT)

# Link any dependencies and set include directories
foreach(target adders_static adders_shared)
    target_include_directories(${target}
        PUBLIC
            ${CMAKE_Fortran_MODULE_DIRECTORY}
    )
endforeach()

# Create the main executable
add_executable(fortran_c_demo main.f90)

# Link the static library to the executable
target_link_libraries(fortran_c_demo
    PRIVATE
        adders_static
)