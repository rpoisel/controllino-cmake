file(GLOB ETHERNET_LIB_SRC
    ${ARDUINO_INSTALL_DIR}/libraries/Ethernet/src/*.cpp
    ${ARDUINO_INSTALL_DIR}/libraries/Ethernet/src/utility/*.cpp
)

add_library(arduino_ethernet STATIC
    ${ETHERNET_LIB_SRC}
)

target_include_directories(arduino_ethernet PUBLIC
    ${ARDUINO_INSTALL_DIR}/libraries/Ethernet/src
    ${ARDUINO_INSTALL_DIR}/libraries/Ethernet/src/utility
)

target_link_libraries(arduino_ethernet PUBLIC
    arduino
    arduino_spi
)




