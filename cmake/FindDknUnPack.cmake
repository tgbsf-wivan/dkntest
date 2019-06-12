
function(unpack file dst md5)
  set(DST_MD5 ${dst}/.md5)  
  if (EXISTS ${DST_MD5})
    file(READ ${DST_MD5} DST_MD5_VALUE)
    string(STRIP ${DST_MD5_VALUE} DST_MD5_VALUE_STRIPPED)
    if (${DST_MD5_VALUE_STRIPPED} EQUAL ${md5})
      message(STATUS "${dst} is up to date")
      return()
    endif()
  endif()
  file (MAKE_DIRECTORY ${dst})
  message(STATUS "Extracting ${file} to ${dst} ... [tar xvfz]")
  execute_process(COMMAND ${CMAKE_COMMAND} -E tar xvfz ${file} WORKING_DIRECTORY ${dst} RESULT_VARIABLE ret)
  if (${ret} EQUAL 0)
    file(WRITE ${DST_MD5} ${md5})
  else()
    file(REMOVE ${DST_MD5})
    message(FATAL_ERROR "${file} could not be unpacked.")
  endif()
endfunction()



