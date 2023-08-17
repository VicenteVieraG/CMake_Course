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

# This variable is from CMake. We populated with paths to cmake modules files.
# CMake now know where to search for our CMake modules. With the include function we tell
# CMake wich file to call and include into this main file.
# After the cmake file is inclded we can call the functions there declared like add_git_submodule.
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)
include(AddGitSubModule)

# This includes a function to get the files from the repos directly.
# It clones the selected repo at build/_deps. It only works with CMake projects.
include(FetchContent)

# This function gets the library cloned and configured into the project.
# It needs:
# -The name of the library, wich can be found at the source CMakeLists file of the project
# as the project name.
# -The link to the repo.
# -The release tag version of the project.
# -GIT_SHALLOW sirve para que no se clonen los submodulos de los repos seleccionados.

# FetchContent_MakeAvailable includes the selected library from the FetchContent_Declare().
FetchContent_Declare(
    nlohmann_json
    GIT_REPOSITORY https://github.com/nlohmann/json
    GIT_TAG v3.11.2
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(nlohmann_json)

FetchContent_Declare(
    fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt
    GIT_TAG 10.1.0
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(fmt)

FetchContent_Declare(
    spdlog
    GIT_REPOSITORY https://github.com/gabime/spdlog
    GIT_TAG  v1.12.0
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(spdlog)

FetchContent_Declare(
    cxxopts
    GIT_REPOSITORY https://github.com/jarro2783/cxxopts
    GIT_TAG v3.1.1
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(cxxopts)

FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2
    GIT_TAG v3.4.0
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(Catch2)

# This is a boolena variable. It can be acceced through the commandline at the moment of 
# preparing the project (step 3) by typing as an argument -D<VariableName>=<Value>
option(COMPILE_EXECUTABLE "Whether to compile the executable" ON)

# We tell CMake where to find the files needed to compile.
# src folder needs to be declared first because is a dependency of app.
add_subdirectory(config)
add_subdirectory(dependencies)
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