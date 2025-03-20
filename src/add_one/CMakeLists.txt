# Create the add_one library
add_library(add_one_lib
    add_one.c
)

# Enable position independent code for shared library support
set_property(TARGET add_one_lib PROPERTY POSITION_INDEPENDENT_CODE ON)