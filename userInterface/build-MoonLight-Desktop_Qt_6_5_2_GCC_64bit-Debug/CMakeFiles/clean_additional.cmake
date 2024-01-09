# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appMoonLight_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appMoonLight_autogen.dir/ParseCache.txt"
  "appMoonLight_autogen"
  )
endif()
