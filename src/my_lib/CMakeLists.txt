set(LIBRARY_SOURCES my_lib.cpp)

add_library(${LIBRARY_NAME} STATIC ${LIBRARY_SOURCES})

target_include_directories(${LIBRARY_NAME} PUBLIC 
    ${CMAKE_BINARY_DIR}/configured_files/include
)