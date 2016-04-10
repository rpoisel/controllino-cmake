set(BASE_DIR_ETHERNET ${ARDUINO_INSTALL_DIR}/libraries/Ethernet/src)
file(GLOB ETHERNET_LIB_SRC
    ${BASE_DIR_ETHERNET}/*.cpp
    ${BASE_DIR_ETHERNET}/utility/*.cpp
)

add_library(arduino_ethernet STATIC
    ${ETHERNET_LIB_SRC}
)

target_include_directories(arduino_ethernet PUBLIC
    ${BASE_DIR_ETHERNET}
    ${BASE_DIR_ETHERNET}/utility
)

target_link_libraries(arduino_ethernet PUBLIC
    arduino
    arduino_spi
)

install(TARGETS arduino_ethernet
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

install_absolute(${BASE_DIR_ETHERNET} h/Ethernet *.h)
