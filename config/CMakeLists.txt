# This catches the selected files ending with .in and pastes them into the specified folder,
# in this case the variable CMAKE_BINARY_DIR is a shortcut to the build directory, there
# we specify that configured_files\include folders should be created and move the config.hpp
# file inside the include folder. The ESCAPE_QUOTES paremeter is used for that CMake can 
# read the varibles there defined and set them values.
configure_file(
    config.hpp.in
    ${CMAKE_BINARY_DIR}/configured_files/include/config.hpp
    ESCAPE_QUOTES
)