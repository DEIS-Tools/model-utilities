# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /home/anders/Documents/clion-2019.2.4/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/anders/Documents/clion-2019.2.4/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/anders/datalogi/7semester/project/P7-kode/tcp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/translator.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/translator.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/translator.dir/flags.make

CMakeFiles/translator.dir/port_discovery_service.cpp.o: CMakeFiles/translator.dir/flags.make
CMakeFiles/translator.dir/port_discovery_service.cpp.o: ../port_discovery_service.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/translator.dir/port_discovery_service.cpp.o"
	clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/translator.dir/port_discovery_service.cpp.o -c /home/anders/datalogi/7semester/project/P7-kode/tcp/port_discovery_service.cpp

CMakeFiles/translator.dir/port_discovery_service.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/translator.dir/port_discovery_service.cpp.i"
	clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anders/datalogi/7semester/project/P7-kode/tcp/port_discovery_service.cpp > CMakeFiles/translator.dir/port_discovery_service.cpp.i

CMakeFiles/translator.dir/port_discovery_service.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/translator.dir/port_discovery_service.cpp.s"
	clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anders/datalogi/7semester/project/P7-kode/tcp/port_discovery_service.cpp -o CMakeFiles/translator.dir/port_discovery_service.cpp.s

CMakeFiles/translator.dir/tcp_client.cpp.o: CMakeFiles/translator.dir/flags.make
CMakeFiles/translator.dir/tcp_client.cpp.o: ../tcp_client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/translator.dir/tcp_client.cpp.o"
	clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/translator.dir/tcp_client.cpp.o -c /home/anders/datalogi/7semester/project/P7-kode/tcp/tcp_client.cpp

CMakeFiles/translator.dir/tcp_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/translator.dir/tcp_client.cpp.i"
	clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anders/datalogi/7semester/project/P7-kode/tcp/tcp_client.cpp > CMakeFiles/translator.dir/tcp_client.cpp.i

CMakeFiles/translator.dir/tcp_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/translator.dir/tcp_client.cpp.s"
	clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anders/datalogi/7semester/project/P7-kode/tcp/tcp_client.cpp -o CMakeFiles/translator.dir/tcp_client.cpp.s

CMakeFiles/translator.dir/tcp_server.cpp.o: CMakeFiles/translator.dir/flags.make
CMakeFiles/translator.dir/tcp_server.cpp.o: ../tcp_server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/translator.dir/tcp_server.cpp.o"
	clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/translator.dir/tcp_server.cpp.o -c /home/anders/datalogi/7semester/project/P7-kode/tcp/tcp_server.cpp

CMakeFiles/translator.dir/tcp_server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/translator.dir/tcp_server.cpp.i"
	clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anders/datalogi/7semester/project/P7-kode/tcp/tcp_server.cpp > CMakeFiles/translator.dir/tcp_server.cpp.i

CMakeFiles/translator.dir/tcp_server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/translator.dir/tcp_server.cpp.s"
	clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anders/datalogi/7semester/project/P7-kode/tcp/tcp_server.cpp -o CMakeFiles/translator.dir/tcp_server.cpp.s

CMakeFiles/translator.dir/test.cpp.o: CMakeFiles/translator.dir/flags.make
CMakeFiles/translator.dir/test.cpp.o: ../test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/translator.dir/test.cpp.o"
	clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/translator.dir/test.cpp.o -c /home/anders/datalogi/7semester/project/P7-kode/tcp/test.cpp

CMakeFiles/translator.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/translator.dir/test.cpp.i"
	clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anders/datalogi/7semester/project/P7-kode/tcp/test.cpp > CMakeFiles/translator.dir/test.cpp.i

CMakeFiles/translator.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/translator.dir/test.cpp.s"
	clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anders/datalogi/7semester/project/P7-kode/tcp/test.cpp -o CMakeFiles/translator.dir/test.cpp.s

# Object files for target translator
translator_OBJECTS = \
"CMakeFiles/translator.dir/port_discovery_service.cpp.o" \
"CMakeFiles/translator.dir/tcp_client.cpp.o" \
"CMakeFiles/translator.dir/tcp_server.cpp.o" \
"CMakeFiles/translator.dir/test.cpp.o"

# External object files for target translator
translator_EXTERNAL_OBJECTS =

bin/translator: CMakeFiles/translator.dir/port_discovery_service.cpp.o
bin/translator: CMakeFiles/translator.dir/tcp_client.cpp.o
bin/translator: CMakeFiles/translator.dir/tcp_server.cpp.o
bin/translator: CMakeFiles/translator.dir/test.cpp.o
bin/translator: CMakeFiles/translator.dir/build.make
bin/translator: CMakeFiles/translator.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable bin/translator"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/translator.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/translator.dir/build: bin/translator

.PHONY : CMakeFiles/translator.dir/build

CMakeFiles/translator.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/translator.dir/cmake_clean.cmake
.PHONY : CMakeFiles/translator.dir/clean

CMakeFiles/translator.dir/depend:
	cd /home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/anders/datalogi/7semester/project/P7-kode/tcp /home/anders/datalogi/7semester/project/P7-kode/tcp /home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug /home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug /home/anders/datalogi/7semester/project/P7-kode/tcp/cmake-build-debug/CMakeFiles/translator.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/translator.dir/depend

