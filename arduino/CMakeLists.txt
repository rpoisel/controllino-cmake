set(ARDUINO_DIR "${USER_HOME}/.arduino15" CACHE PATH "Path to the directory containing the Arduino package files")
IF(NOT (EXISTS "${ARDUINO_DIR}" AND IS_DIRECTORY "${ARDUINO_DIR}"))
    message(FATAL_ERROR "${ARDUINO_DIR} does not exist or is not a directory.")
endif ()

set(ARDUINO_AVR_DIR ${ARDUINO_DIR}/packages/arduino/hardware/avr/1.6.10 CACHE PATH "Path to the directory containing AVR specific arduino files")
IF(NOT (EXISTS "${ARDUINO_AVR_DIR}" AND IS_DIRECTORY "${ARDUINO_AVR_DIR}"))
    message(FATAL_ERROR "ARDUINO_AVR_DIR has not been set.")
endif ()

file(GLOB_RECURSE ARDUINO_SRC
    ${ARDUINO_AVR_DIR}/cores/arduino/*.c
    ${ARDUINO_AVR_DIR}/cores/arduino/*.cpp
)

file(GLOB ARDUINO_SRC_ASM
    ${ARDUINO_AVR_DIR}/cores/arduino/*.S
)

set_source_files_properties(${ARDUINO_SRC_ASM} PROPERTIES
    LANGUAGE ASM
    COMPILE_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS_DEBUG}"
)

add_library(arduino STATIC
    ${ARDUINO_SRC}
    ${ARDUINO_SRC_ASM}
)

target_link_libraries(arduino PUBLIC
    m
)

target_include_directories(arduino PUBLIC
    ${ARDUINO_AVR_DIR}/cores/arduino
    ${ARDUINO_AVR_DIR}/variants/standard
)

target_compile_definitions(arduino PUBLIC
    -DF_CPU=16000000L
    -DARDUINO=10608
    -D${ARDUINO_ARCH}
    -DARDUINO_ARCH_AVR
)

add_subdirectory(libraries)

add_custom_target(firmware_binary ALL
    COMMAND ${AVR_OBJCOPY} -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 $<TARGET_FILE:firmware> firmware.eep
    COMMAND ${AVR_OBJCOPY} -O ihex -R .eeprom $<TARGET_FILE:firmware> firware.hex
)
set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES firmware.hex)

add_dependencies(firmware_binary firmware)
