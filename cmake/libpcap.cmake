
if (WIN32)
# Download automatically, you can also just copy the conan.cmake file
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
   message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
   file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
                 "${CMAKE_BINARY_DIR}/conan.cmake" 
                 TLS_VERIFY ON)
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_run(REQUIRES winpcap/4.1.3@bincrafters/stable
                BASIC_SETUP CMAKE_TARGETS
                BUILD missing)

set(PCAP_LIBRARY CONAN_PKG::winpcap)

else()

    find_package(PCAP)

endif()