file(GLOB WIRE_LIB_SRC
    ${ARDUINO_AVR_DIR}/libraries/Wire/src/*.cpp
)

add_library(arduino_wire STATIC
    ${WIRE_LIB_SRC}
)

target_include_directories(arduino_wire PUBLIC
    ${ARDUINO_AVR_DIR}/libraries/Wire
)

target_link_libraries(arduino_wire PUBLIC
    arduino
)




