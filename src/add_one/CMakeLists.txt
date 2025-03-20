# Create the add_one library
add_library(add_one_lib
    add_one.c
)

# If we had public headers, we would set target properties:
# target_include_directories(add_one_lib
#     PUBLIC
#         ${CMAKE_CURRENT_SOURCE_DIR}/include
# )