set(BASE_DIR_WIRE ${ARDUINO_AVR_DIR}/libraries/Wire/src)
file(GLOB WIRE_LIB_SRC
    ${BASE_DIR_WIRE}/*.cpp
)

add_library(arduino_wire STATIC
    ${WIRE_LIB_SRC}
)

target_include_directories(arduino_wire PUBLIC
    ${BASE_DIR_WIRE}
)

target_link_libraries(arduino_wire PUBLIC
    arduino
)

install(TARGETS arduino_wire
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

install_absolute(${BASE_DIR_WIRE} h/Wire *.h)

