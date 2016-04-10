add_executable(firmware
    main.c
)

target_link_libraries(firmware
    arduino
    arduino_spi
    arduino_wire
    arduino_ethernet
)

