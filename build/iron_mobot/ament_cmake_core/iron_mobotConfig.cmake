# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_iron_mobot_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED iron_mobot_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(iron_mobot_FOUND FALSE)
  elseif(NOT iron_mobot_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(iron_mobot_FOUND FALSE)
  endif()
  return()
endif()
set(_iron_mobot_CONFIG_INCLUDED TRUE)

# output package information
if(NOT iron_mobot_FIND_QUIETLY)
  message(STATUS "Found iron_mobot: 0.0.0 (${iron_mobot_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'iron_mobot' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${iron_mobot_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(iron_mobot_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${iron_mobot_DIR}/${_extra}")
endforeach()
