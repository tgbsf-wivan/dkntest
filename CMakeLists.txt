
cmake_minimum_required(VERSION 3.10)
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_SOURCE_DIR}/cmake)
find_package(DknDevEnv REQUIRED MODULE)

get_cmake_property(_variableNames VARIABLES)
list (SORT _variableNames)
foreach (_variableName ${_variableNames})
    message(STATUS "${_variableName}=${${_variableName}}")
endforeach()


project(dkntest)



add_subdirectory(src/samples)






