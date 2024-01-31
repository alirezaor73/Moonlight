# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/moonlight_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/moonlight_autogen.dir/ParseCache.txt"
  "moonlight_autogen"
  )
endif()
