project("Controllino Arduino" C CXX ASM)
cmake_minimum_required(VERSION 3.0)

add_subdirectory(arduino)
add_subdirectory(main)

set(CPACK_PACKAGE_FILE_NAME controllino_${ARDUINO_MMCU}_${ARDUINO_VERSION})
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
set(CPACK_GENERATOR "ZIP")
include(CPack)

