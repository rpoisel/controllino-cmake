file(GLOB SPI_LIB_SRC
    ${ARDUINO_AVR_DIR}/libraries/SPI/src/*.cpp
)

add_library(arduino_spi STATIC
    ${SPI_LIB_SRC}
)

target_include_directories(arduino_spi PUBLIC
    ${ARDUINO_AVR_DIR}/libraries/SPI/src
)

target_link_libraries(arduino_spi PUBLIC
    arduino
)



