# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/impala/avx-parquet-scanner

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/impala/avx-parquet-scanner

# Include any dependencies generated for this target.
include src/exprs/CMakeFiles/predicate-test.dir/depend.make

# Include the progress variables for this target.
include src/exprs/CMakeFiles/predicate-test.dir/progress.make

# Include the compile flags for this target's objects.
include src/exprs/CMakeFiles/predicate-test.dir/flags.make

src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o: src/exprs/CMakeFiles/predicate-test.dir/flags.make
src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o: src/exprs/predicate-test.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/impala/avx-parquet-scanner/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/predicate-test.dir/predicate-test.cc.o -c /home/impala/avx-parquet-scanner/src/exprs/predicate-test.cc

src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/predicate-test.dir/predicate-test.cc.i"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/impala/avx-parquet-scanner/src/exprs/predicate-test.cc > CMakeFiles/predicate-test.dir/predicate-test.cc.i

src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/predicate-test.dir/predicate-test.cc.s"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/impala/avx-parquet-scanner/src/exprs/predicate-test.cc -o CMakeFiles/predicate-test.dir/predicate-test.cc.s

src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o.requires:
.PHONY : src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o.requires

src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o.provides: src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o.requires
	$(MAKE) -f src/exprs/CMakeFiles/predicate-test.dir/build.make src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o.provides.build
.PHONY : src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o.provides

src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o.provides.build: src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o

# Object files for target predicate-test
predicate__test_OBJECTS = \
"CMakeFiles/predicate-test.dir/predicate-test.cc.o"

# External object files for target predicate-test
predicate__test_EXTERNAL_OBJECTS =

build/debug/exprs/predicate-test: src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o
build/debug/exprs/predicate-test: build/debug/exprs/libExprs.a
build/debug/exprs/predicate-test: src/exprs/CMakeFiles/predicate-test.dir/build.make
build/debug/exprs/predicate-test: src/exprs/CMakeFiles/predicate-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../build/debug/exprs/predicate-test"
	cd /home/impala/avx-parquet-scanner/src/exprs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/predicate-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/exprs/CMakeFiles/predicate-test.dir/build: build/debug/exprs/predicate-test
.PHONY : src/exprs/CMakeFiles/predicate-test.dir/build

src/exprs/CMakeFiles/predicate-test.dir/requires: src/exprs/CMakeFiles/predicate-test.dir/predicate-test.cc.o.requires
.PHONY : src/exprs/CMakeFiles/predicate-test.dir/requires

src/exprs/CMakeFiles/predicate-test.dir/clean:
	cd /home/impala/avx-parquet-scanner/src/exprs && $(CMAKE_COMMAND) -P CMakeFiles/predicate-test.dir/cmake_clean.cmake
.PHONY : src/exprs/CMakeFiles/predicate-test.dir/clean

src/exprs/CMakeFiles/predicate-test.dir/depend:
	cd /home/impala/avx-parquet-scanner && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/impala/avx-parquet-scanner /home/impala/avx-parquet-scanner/src/exprs /home/impala/avx-parquet-scanner /home/impala/avx-parquet-scanner/src/exprs /home/impala/avx-parquet-scanner/src/exprs/CMakeFiles/predicate-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/exprs/CMakeFiles/predicate-test.dir/depend
