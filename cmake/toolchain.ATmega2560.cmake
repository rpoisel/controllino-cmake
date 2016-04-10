set(ARDUINO_ARCH ARDUINO_AVR_MEGA2560)
set(ARDUINO_MMCU atmega2560)
set(ARDUINO_GC_SECTIONS ",--relax")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.ATmegaCommon.cmake)
