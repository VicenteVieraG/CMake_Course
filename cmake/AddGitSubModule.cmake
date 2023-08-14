function(add_git_submodule dir)
    # This looks out into enviroment variables to see if there is any git instalation.
    find_package(Git REQUIRED)

    # The GIT_EXECUTABLE variable is setted when the find_package function is finished. It
    # populates the variable with the absolute path to the git executable file.
    if(NOT EXISTS ${dir}/CMakeLists.txt)
        execute_process(COMMAND ${GIT_EXECUTABLE}
        submodule update --init --recursive --${dir}
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
    )
    endif()

    add_subdirectory(${dir})
endfunction(add_git_submodule)