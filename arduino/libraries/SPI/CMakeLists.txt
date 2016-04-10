set(BASE_DIR_SPI ${ARDUINO_AVR_DIR}/libraries/SPI/src)

file(GLOB SPI_LIB_SRC
    ${BASE_DIR_SPI}/*.cpp
)

add_library(arduino_spi STATIC
    ${SPI_LIB_SRC}
)

target_include_directories(arduino_spi PUBLIC
    ${BASE_DIR_SPI}
)

target_link_libraries(arduino_spi PUBLIC
    arduino
)

install(TARGETS arduino_spi
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

install_absolute(${BASE_DIR_SPI} h/SPI *.h)

