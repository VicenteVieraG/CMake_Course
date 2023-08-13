# Steps to compile a CMake Project
# 1) Create source and CMakeFile
# 2) mkdir build
# 3) cmake ..        Generating the build files | Configure the project
# 4) cmake --build .       Building the project


cmake_minimum_required(VERSION 3.24.1)

# Define the name, version and languajes that our project will have
# project(<NameOfTheProject> VERSION <VersionOfTheProject> LANGUAJES <LanguajesTheProjectWillHave>)
project(CppProjectTemplate VERSION 1.0.0 LANGUAGES C CXX)

# This is some basic setting all cmake projects should have.
# It defines the minimun standard cpp version, if the compiler should have fully implemented the standard
# and if the compiler accepts extensions.
set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS        OFF)

# This is used to define variables that can be used across all the CMakeLists.txt files.
# set(<VariableName> <Value>)
set(LIBRARY_NAME Library)
set(EXECUTABLE_NAME Executable)

# This is a boolena variable. It can be acceced through the commandline at the moment of 
# preparing the project (step 3) by typing as an argument -D<VariableName>=<Value>
option(COMPILE_EXECUTABLE "Whether to compile the executable" ON)

# We tell CMake where to find the files needed to compile.
# src folder needs to be declared first because is a dependency of app.
add_subdirectory(config)
add_subdirectory(src)
add_subdirectory(include)
if(COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("Without .exe compiling")
endif()

# Add a library to the executable file. It needs the name of the library, how the libary should be
# treated and the source code.
# add_library(<LibraryName> <LibaryMode> <SourceFilesOfTheLibrary>)
# add_library(Library STATIC my_lib.cpp)

# Creates an executable file by selecting the name of the exe and the files from wich the exe will be made of.
# add_executable(<NameOfTheExecutable <FilesFromWichTheExecutableWillBeMadeOf>)
# add_executable(Executable main.cpp)

# This links our libraries with the executable file. It makes the laibrary a dependency of our main file.
# target_link_libraries(<ExecutableName> <LibraryMode> <LibraryName>)
# target_link_libraries(Executable PUBLIC Library)