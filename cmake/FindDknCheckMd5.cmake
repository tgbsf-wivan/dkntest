

function(check_md5 file ret)
   file(READ ${file}.md5 MD5_GOLDEN)
   file(MD5 ${file} MD5_VALUE)
   string(STRIP ${MD5_VALUE} MD5_STRIPPED_VALUE)
   if (NOT ${MD5_GOLDEN} EQUAL ${MD5_STRIPPED_VALUE})
    message(FATAL_ERROR "The MD5 checksums do not match \"${DKNTEST_ARM_NONE_GCC_PACKAGE_MD5_GOLDEN}\" != \"${DKNTEST_ARM_NONE_GCC_PACKAGE_MD5}\"")
   endif()
   set(${ret} ${MD5_STRIPPED_VALUE} PARENT_SCOPE)
endfunction()

