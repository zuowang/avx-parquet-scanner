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
include src/exprs/CMakeFiles/Exprs.dir/depend.make

# Include the progress variables for this target.
include src/exprs/CMakeFiles/Exprs.dir/progress.make

# Include the compile flags for this target's objects.
include src/exprs/CMakeFiles/Exprs.dir/flags.make

src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o: src/exprs/CMakeFiles/Exprs.dir/flags.make
src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o: src/exprs/compound-predicates.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/impala/avx-parquet-scanner/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Exprs.dir/compound-predicates.cc.o -c /home/impala/avx-parquet-scanner/src/exprs/compound-predicates.cc

src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Exprs.dir/compound-predicates.cc.i"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/impala/avx-parquet-scanner/src/exprs/compound-predicates.cc > CMakeFiles/Exprs.dir/compound-predicates.cc.i

src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Exprs.dir/compound-predicates.cc.s"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/impala/avx-parquet-scanner/src/exprs/compound-predicates.cc -o CMakeFiles/Exprs.dir/compound-predicates.cc.s

src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o.requires:
.PHONY : src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o.requires

src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o.provides: src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o.requires
	$(MAKE) -f src/exprs/CMakeFiles/Exprs.dir/build.make src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o.provides.build
.PHONY : src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o.provides

src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o.provides.build: src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o

src/exprs/CMakeFiles/Exprs.dir/expr.cc.o: src/exprs/CMakeFiles/Exprs.dir/flags.make
src/exprs/CMakeFiles/Exprs.dir/expr.cc.o: src/exprs/expr.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/impala/avx-parquet-scanner/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/exprs/CMakeFiles/Exprs.dir/expr.cc.o"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Exprs.dir/expr.cc.o -c /home/impala/avx-parquet-scanner/src/exprs/expr.cc

src/exprs/CMakeFiles/Exprs.dir/expr.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Exprs.dir/expr.cc.i"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/impala/avx-parquet-scanner/src/exprs/expr.cc > CMakeFiles/Exprs.dir/expr.cc.i

src/exprs/CMakeFiles/Exprs.dir/expr.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Exprs.dir/expr.cc.s"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/impala/avx-parquet-scanner/src/exprs/expr.cc -o CMakeFiles/Exprs.dir/expr.cc.s

src/exprs/CMakeFiles/Exprs.dir/expr.cc.o.requires:
.PHONY : src/exprs/CMakeFiles/Exprs.dir/expr.cc.o.requires

src/exprs/CMakeFiles/Exprs.dir/expr.cc.o.provides: src/exprs/CMakeFiles/Exprs.dir/expr.cc.o.requires
	$(MAKE) -f src/exprs/CMakeFiles/Exprs.dir/build.make src/exprs/CMakeFiles/Exprs.dir/expr.cc.o.provides.build
.PHONY : src/exprs/CMakeFiles/Exprs.dir/expr.cc.o.provides

src/exprs/CMakeFiles/Exprs.dir/expr.cc.o.provides.build: src/exprs/CMakeFiles/Exprs.dir/expr.cc.o

src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o: src/exprs/CMakeFiles/Exprs.dir/flags.make
src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o: src/exprs/in-predicate.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/impala/avx-parquet-scanner/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Exprs.dir/in-predicate.cc.o -c /home/impala/avx-parquet-scanner/src/exprs/in-predicate.cc

src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Exprs.dir/in-predicate.cc.i"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/impala/avx-parquet-scanner/src/exprs/in-predicate.cc > CMakeFiles/Exprs.dir/in-predicate.cc.i

src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Exprs.dir/in-predicate.cc.s"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/impala/avx-parquet-scanner/src/exprs/in-predicate.cc -o CMakeFiles/Exprs.dir/in-predicate.cc.s

src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o.requires:
.PHONY : src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o.requires

src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o.provides: src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o.requires
	$(MAKE) -f src/exprs/CMakeFiles/Exprs.dir/build.make src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o.provides.build
.PHONY : src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o.provides

src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o.provides.build: src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o

src/exprs/CMakeFiles/Exprs.dir/literal.cc.o: src/exprs/CMakeFiles/Exprs.dir/flags.make
src/exprs/CMakeFiles/Exprs.dir/literal.cc.o: src/exprs/literal.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/impala/avx-parquet-scanner/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/exprs/CMakeFiles/Exprs.dir/literal.cc.o"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Exprs.dir/literal.cc.o -c /home/impala/avx-parquet-scanner/src/exprs/literal.cc

src/exprs/CMakeFiles/Exprs.dir/literal.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Exprs.dir/literal.cc.i"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/impala/avx-parquet-scanner/src/exprs/literal.cc > CMakeFiles/Exprs.dir/literal.cc.i

src/exprs/CMakeFiles/Exprs.dir/literal.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Exprs.dir/literal.cc.s"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/impala/avx-parquet-scanner/src/exprs/literal.cc -o CMakeFiles/Exprs.dir/literal.cc.s

src/exprs/CMakeFiles/Exprs.dir/literal.cc.o.requires:
.PHONY : src/exprs/CMakeFiles/Exprs.dir/literal.cc.o.requires

src/exprs/CMakeFiles/Exprs.dir/literal.cc.o.provides: src/exprs/CMakeFiles/Exprs.dir/literal.cc.o.requires
	$(MAKE) -f src/exprs/CMakeFiles/Exprs.dir/build.make src/exprs/CMakeFiles/Exprs.dir/literal.cc.o.provides.build
.PHONY : src/exprs/CMakeFiles/Exprs.dir/literal.cc.o.provides

src/exprs/CMakeFiles/Exprs.dir/literal.cc.o.provides.build: src/exprs/CMakeFiles/Exprs.dir/literal.cc.o

src/exprs/CMakeFiles/Exprs.dir/operators.cc.o: src/exprs/CMakeFiles/Exprs.dir/flags.make
src/exprs/CMakeFiles/Exprs.dir/operators.cc.o: src/exprs/operators.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/impala/avx-parquet-scanner/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/exprs/CMakeFiles/Exprs.dir/operators.cc.o"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Exprs.dir/operators.cc.o -c /home/impala/avx-parquet-scanner/src/exprs/operators.cc

src/exprs/CMakeFiles/Exprs.dir/operators.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Exprs.dir/operators.cc.i"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/impala/avx-parquet-scanner/src/exprs/operators.cc > CMakeFiles/Exprs.dir/operators.cc.i

src/exprs/CMakeFiles/Exprs.dir/operators.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Exprs.dir/operators.cc.s"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/impala/avx-parquet-scanner/src/exprs/operators.cc -o CMakeFiles/Exprs.dir/operators.cc.s

src/exprs/CMakeFiles/Exprs.dir/operators.cc.o.requires:
.PHONY : src/exprs/CMakeFiles/Exprs.dir/operators.cc.o.requires

src/exprs/CMakeFiles/Exprs.dir/operators.cc.o.provides: src/exprs/CMakeFiles/Exprs.dir/operators.cc.o.requires
	$(MAKE) -f src/exprs/CMakeFiles/Exprs.dir/build.make src/exprs/CMakeFiles/Exprs.dir/operators.cc.o.provides.build
.PHONY : src/exprs/CMakeFiles/Exprs.dir/operators.cc.o.provides

src/exprs/CMakeFiles/Exprs.dir/operators.cc.o.provides.build: src/exprs/CMakeFiles/Exprs.dir/operators.cc.o

src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o: src/exprs/CMakeFiles/Exprs.dir/flags.make
src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o: src/exprs/slot-ref.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/impala/avx-parquet-scanner/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Exprs.dir/slot-ref.cc.o -c /home/impala/avx-parquet-scanner/src/exprs/slot-ref.cc

src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Exprs.dir/slot-ref.cc.i"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/impala/avx-parquet-scanner/src/exprs/slot-ref.cc > CMakeFiles/Exprs.dir/slot-ref.cc.i

src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Exprs.dir/slot-ref.cc.s"
	cd /home/impala/avx-parquet-scanner/src/exprs && /opt/intel/composer_xe_2015.2.164/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/impala/avx-parquet-scanner/src/exprs/slot-ref.cc -o CMakeFiles/Exprs.dir/slot-ref.cc.s

src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o.requires:
.PHONY : src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o.requires

src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o.provides: src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o.requires
	$(MAKE) -f src/exprs/CMakeFiles/Exprs.dir/build.make src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o.provides.build
.PHONY : src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o.provides

src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o.provides.build: src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o

# Object files for target Exprs
Exprs_OBJECTS = \
"CMakeFiles/Exprs.dir/compound-predicates.cc.o" \
"CMakeFiles/Exprs.dir/expr.cc.o" \
"CMakeFiles/Exprs.dir/in-predicate.cc.o" \
"CMakeFiles/Exprs.dir/literal.cc.o" \
"CMakeFiles/Exprs.dir/operators.cc.o" \
"CMakeFiles/Exprs.dir/slot-ref.cc.o"

# External object files for target Exprs
Exprs_EXTERNAL_OBJECTS =

build/debug/exprs/libExprs.a: src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o
build/debug/exprs/libExprs.a: src/exprs/CMakeFiles/Exprs.dir/expr.cc.o
build/debug/exprs/libExprs.a: src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o
build/debug/exprs/libExprs.a: src/exprs/CMakeFiles/Exprs.dir/literal.cc.o
build/debug/exprs/libExprs.a: src/exprs/CMakeFiles/Exprs.dir/operators.cc.o
build/debug/exprs/libExprs.a: src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o
build/debug/exprs/libExprs.a: src/exprs/CMakeFiles/Exprs.dir/build.make
build/debug/exprs/libExprs.a: src/exprs/CMakeFiles/Exprs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library ../../build/debug/exprs/libExprs.a"
	cd /home/impala/avx-parquet-scanner/src/exprs && $(CMAKE_COMMAND) -P CMakeFiles/Exprs.dir/cmake_clean_target.cmake
	cd /home/impala/avx-parquet-scanner/src/exprs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Exprs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/exprs/CMakeFiles/Exprs.dir/build: build/debug/exprs/libExprs.a
.PHONY : src/exprs/CMakeFiles/Exprs.dir/build

src/exprs/CMakeFiles/Exprs.dir/requires: src/exprs/CMakeFiles/Exprs.dir/compound-predicates.cc.o.requires
src/exprs/CMakeFiles/Exprs.dir/requires: src/exprs/CMakeFiles/Exprs.dir/expr.cc.o.requires
src/exprs/CMakeFiles/Exprs.dir/requires: src/exprs/CMakeFiles/Exprs.dir/in-predicate.cc.o.requires
src/exprs/CMakeFiles/Exprs.dir/requires: src/exprs/CMakeFiles/Exprs.dir/literal.cc.o.requires
src/exprs/CMakeFiles/Exprs.dir/requires: src/exprs/CMakeFiles/Exprs.dir/operators.cc.o.requires
src/exprs/CMakeFiles/Exprs.dir/requires: src/exprs/CMakeFiles/Exprs.dir/slot-ref.cc.o.requires
.PHONY : src/exprs/CMakeFiles/Exprs.dir/requires

src/exprs/CMakeFiles/Exprs.dir/clean:
	cd /home/impala/avx-parquet-scanner/src/exprs && $(CMAKE_COMMAND) -P CMakeFiles/Exprs.dir/cmake_clean.cmake
.PHONY : src/exprs/CMakeFiles/Exprs.dir/clean

src/exprs/CMakeFiles/Exprs.dir/depend:
	cd /home/impala/avx-parquet-scanner && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/impala/avx-parquet-scanner /home/impala/avx-parquet-scanner/src/exprs /home/impala/avx-parquet-scanner /home/impala/avx-parquet-scanner/src/exprs /home/impala/avx-parquet-scanner/src/exprs/CMakeFiles/Exprs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/exprs/CMakeFiles/Exprs.dir/depend
