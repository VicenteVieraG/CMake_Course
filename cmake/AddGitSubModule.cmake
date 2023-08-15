function(add_git_submodule dir)
    # This looks out into enviroment variables to see if there is any git instalation.
    find_package(Git REQUIRED)

    # The GIT_EXECUTABLE variable is setted when the find_package function is finished. It
    # populates the variable with the absolute path to the git executable file.
    if(NOT EXISTS ${CMAKE_SOURCE_DIR}/${dir}/CMakeLists.txt)
        execute_process(COMMAND ${GIT_EXECUTABLE}
        submodule update --init --recursive --${CMAKE_SOURCE_DIR}/${dir}
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
    )
    endif()
    if(EXISTS ${CMAKE_SOURCE_DIR}/${dir}/CMakeLists.txt)
        message(Adding: ${dir}/CMakeLists.txt)
        add_subdirectory(${CMAKE_SOURCE_DIR}/${dir})
    else()
        message("Could not add ${dir}/CMakeLists.txt")
    endif()
endfunction(add_git_submodule)