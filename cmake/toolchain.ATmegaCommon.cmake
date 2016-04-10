include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME AVR)
set(CMAKE_SYSTEM_VERSION 1)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/Modules")

if(CMAKE_HOST_SYSTEM_NAME MATCHES "Linux")
    set(USER_HOME $ENV{HOME} CACHE PATH "Path to user home directory")
    set(HOST_EXECUTABLE_SUFFIX "")
elseif(CMAKE_HOST_SYSTEM_NAME MATCHES "Windows")
    set(USER_HOME $ENV{USERPROFILE} CACHE PATH "Path to user home directory")
    set(HOST_EXECUTABLE_SUFFIX ".exe")
else()
    message(FATAL_ERROR Unsupported build platform.)
endif()

set(ARDUINO_INSTALL_DIR "${USER_HOME}/arduino" CACHE PATH "Installation directory of the Arduino IDE")

set(AVR_C_COMPILER "${ARDUINO_INSTALL_DIR}/hardware/tools/avr/bin/avr-gcc${HOST_EXECUTABLE_SUFFIX}" CACHE PATH "Path to the AVR C compiler" FORCE)
set(AVR_CXX_COMPILER "${ARDUINO_INSTALL_DIR}/hardware/tools/avr/bin/avr-g++${HOST_EXECUTABLE_SUFFIX}" CACHE PATH "Path to the AVR C compiler" FORCE)
set(AVR_OBJCOPY "${ARDUINO_INSTALL_DIR}/hardware/tools/avr/bin/avr-objcopy${HOST_EXECUTABLE_SUFFIX}" CACHE PATH "Path to the AVR C compiler" FORCE)

message("Using " ${AVR_C_COMPILER} " C compiler.")
message("Using " ${AVR_CXX_COMPILER} " C++ compiler.")
message("Using " ${AVR_OBJCOPY} " OBJ copy command.")

CMAKE_FORCE_C_COMPILER(${AVR_C_COMPILER} GNU_C)
CMAKE_FORCE_CXX_COMPILER(${AVR_CXX_COMPILER} GNU_CXX)

set(CMAKE_BUILD_TYPE Release CACHE STRING "")

set(CMAKE_C_FLAGS "-g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -mmcu=${ARDUINO_MMCU}" CACHE STRING "")

set(CMAKE_CXX_FLAGS "-g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -mmcu=${ARDUINO_MMCU}" CACHE STRING "")

set(CMAKE_EXE_LINKER_FLAGS "-w -Os -Wl,--gc-sections${ARDUINO_GC_SECTIONS} -mmcu=${ARDUINO_MMCU}")

