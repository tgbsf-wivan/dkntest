
find_package(DknCheckMd5 REQUIRED MODULE)
find_package(DknUnPack REQUIRED MODULE)

if (CMAKE_HOST_WIN32)
  set(DKNTEST_ARM_NONE_GCC_PACKAGE_NAME gcc-arm-none-eabi-8-2018-q4-major-win32.zip)
else()
  set(DKNTEST_ARM_NONE_GCC_PACKAGE_NAME gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2)
endif()

set(DKNTEST_ARM_NONE_GCC_PACKAGE_FILE ${CMAKE_SOURCE_DIR}/3rdparty/arm/${DKNTEST_ARM_NONE_GCC_PACKAGE_NAME})

check_md5(${DKNTEST_ARM_NONE_GCC_PACKAGE_FILE} DKNTEST_ARM_NONE_GCC_PACKAGE_MD5)
unpack(${DKNTEST_ARM_NONE_GCC_PACKAGE_FILE} ${CMAKE_BINARY_DIR}/devtools/arm_toolchain ${DKNTEST_ARM_NONE_GCC_PACKAGE_MD5})

set(CMAKE_SYSTEM_NAME none)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_COMPILER ${CMAKE_BINARY_DIR}/devtools/arm_toolchain/bin/arm-none-eabi-gcc.exe)
set(CMAKE_C_COMPILER_TARGET arm-none-eabi)

set(CMAKE_CXX_COMPILER ${CMAKE_BINARY_DIR}/devtools/arm_toolchain/bin/arm-none-eabi-g++.exe)
set(CMAKE_CXX_COMPILER_TARGET arm-none-eabi)

