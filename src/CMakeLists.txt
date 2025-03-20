# Add each component subdirectory
add_subdirectory(add_one)
add_subdirectory(add_two)
add_subdirectory(add_three)

# Create the main executable
add_executable(fortran_c_demo main.f90)

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