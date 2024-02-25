include(FindPackageHandleStandardArgs)

if(POLICY CMP0135)
  # Set timestamps on extracted files to time of extraction.
  cmake_policy(SET CMP0135 NEW)
endif()

if(NOT DEPS AND FETCHCONTENT_FULLY_DISCONNECTED)
  message(STATUS "Setting DEPS=LOCAL as FETCHCONTENT_FULLY_DISCONNECTED is set")
endif()

# Hint about usage of the previously supported OFFLINE variable.
if(OFFLINE)
  message(FATAL_ERROR "Please use -D DEPS=LOCAL instead of -D OFFLINE=ON")
endif()

# How to locate/retrieve dependencies. See the Dependencies section in
# doc/INSTALL.md.
set(DEPS AUTO CACHE STRING "How to retrieve third party dependencies")
set_property(CACHE DEPS PROPERTY STRINGS AUTO DOWNLOAD LOCAL)

find_package(Zstd 1.3.4 MODULE REQUIRED)

if(REDIS_STORAGE_BACKEND)
  find_package(Hiredis 0.13.3 MODULE REQUIRED)
endif()
