cmake_minimum_required(VERSION 2.6)

PROJECT(AVX-parquet-scanner)

# compiler flags that are common across debug/release builds
#  - mavx2: Enable avx2 compiler intrinsics.
#  - Wall: Enable all warnings.
#  - Wno-sign-compare: suppress warnings for comparison between signed and unsigned
#    integers
#   -fno-strict-aliasing: disable optimizations that assume strict aliasing. This
#       is unsafe to do if the code uses casts (which we obviously do).
#  - Wno-unknown-pragmas: suppress warnings for unknown (compiler specific) pragmas
#  - Wno-deprecated: gutil contains deprecated headers
#  - pthread: enable multithreaded malloc
SET(CXX_COMMON_FLAGS "-std=c++0x -march=core-avx2 -Wall -Wno-sign-compare -Wno-unknown-pragmas -pthread")
SET(CXX_COMMON_FLAGS "${CXX_COMMON_FLAGS} -fno-strict-aliasing")
SET(CXX_COMMON_FLAGS "${CXX_COMMON_FLAGS} -Wno-deprecated -Wno-unused-local-typedefs")
SET(CXX_COVERAGE_FLAGS "-fprofile-arcs -ftest-coverage")

# compiler flags for different build types (run 'cmake -DCMAKE_BUILD_TYPE=<type> .')
# For all builds:
# For CMAKE_BUILD_TYPE=Debug
#   -ggdb: Enable gdb debugging
# For CMAKE_BUILD_TYPE=Release
#   -O3: Enable all compiler optimizations
#   -g: Enable symbols for profiler tools
#   -DNDEBUG: Turn off dchecks/asserts/debug only code.
SET(CXX_FLAGS_DEBUG "-g -ggdb")
SET(CXX_FLAGS_RELEASE "-O3 -g -DNDEBUG -march=core-avx2")

# if no build build type is specified, default to debug builds
if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif(NOT CMAKE_BUILD_TYPE)

STRING (TOUPPER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE)

# Set compile flags based on the build type.
if ("${CMAKE_BUILD_TYPE}" STREQUAL "DEBUG")
  SET(CMAKE_CXX_FLAGS ${CXX_FLAGS_DEBUG})
elseif ("${CMAKE_BUILD_TYPE}" STREQUAL "RELEASE")
  SET(CMAKE_CXX_FLAGS ${CXX_FLAGS_RELEASE})
elseif ("${CMAKE_BUILD_TYPE}" STREQUAL "CODE_COVERAGE_DEBUG")
  SET(CMAKE_CXX_FLAGS "${CXX_FLAGS_DEBUG} ${CXX_COVERAGE_FLAGS}")
elseif ("${CMAKE_BUILD_TYPE}" STREQUAL "CODE_COVERAGE_RELEASE")
  SET(CMAKE_CXX_FLAGS "${CXX_FLAGS_RELEASE} ${CXX_COVERAGE_FLAGS}")
else()
  message(FATAL_ERROR "Unknown build type: ${CMAKE_BUILD_TYPE}")
endif ()

# Add flags that are common across build types
#  - fverboase-asm creates better annotated assembly.  This doesn't seem to affect
#    when building the binary.
SET(CMAKE_CXX_FLAGS "${CXX_COMMON_FLAGS} ${CMAKE_CXX_FLAGS}")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fverbose-asm")

# resolve "#include "<subdir>/<name>.h"
include_directories(BEFORE ${CMAKE_CURRENT_SOURCE_DIR}/src)

# set compile output directory
if ("${CMAKE_BUILD_TYPE}" STREQUAL "DEBUG" OR
    "${CMAKE_BUILD_TYPE}" STREQUAL "CODE_COVERAGE_DEBUG" OR
    "${CMAKE_BUILD_TYPE}" STREQUAL "ADDRESS_SANITIZER")
  set(BUILD_OUTPUT_ROOT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/debug/")
else()
  set(BUILD_OUTPUT_ROOT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/release/")
endif()

# This is a list of impala library dependencies. Individual libraries
# must not specify library dependencies in their own CMakeLists.txt file.
# Enclose the impala libraries in -Wl,--start-group and -Wl,--end-group
# to resolve cyclic dependencies. As long as those flags are given,
# the order in which impala libraries are listed below does not matter.
# Note: The ld documentation discourages auto-resolving cyclic dependencies
# for performance reasons.
set (IMPALA_LINK_LIBS
  -Wl,--start-group
  Exprs
  -Wl,--end-group
)

# compile these subdirs using their own CMakeLists.txt
add_subdirectory(src/exprs)
add_subdirectory(src/encoding)

link_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}/build/exprs
  ${CMAKE_CURRENT_SOURCE_DIR}/build/encoding
)

# where to put generated binaries
set(EXECUTABLE_OUTPUT_PATH "${BUILD_OUTPUT_ROOT_DIRECTORY}")
