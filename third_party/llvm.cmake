if(WITH_LLVM)
	CHECK_CXX_COMPILER_FLAG("-msse -msse2 -mcx16" COMPILER_X86)
	CHECK_CXX_COMPILER_FLAG("-march=armv8-a+lse" COMPILER_ARM)

	if(BUILD_LLVM_SUBMODULE)
		message(STATUS "LLVM will be built from the submodule.")

        option(DLLVM_TARGETS_TO_BUILD "X86")
        option(DLLVM_BUILD_RUNTIME OFF)
        option(DLLVM_BUILD_RUNTIMES OFF)
        option(DLLVM_BUILD_TOOLS OFF)
        option(DLLVM_INCLUDE_BENCHMARKS OFF)
        option(DLLVM_INCLUDE_DOCS OFF)
        option(DLLVM_INCLUDE_EXAMPLES OFF)
        option(DLLVM_INCLUDE_TESTS OFF)
        option(DLLVM_INCLUDE_TOOLS OFF)
        option(DLLVM_INCLUDE_UTILS OFF)


		if(WIN32)
			set(LLVM_USE_INTEL_JITEVENTS ON)
		endif()

		if(CMAKE_SYSTEM MATCHES "Linux")
			set(LLVM_USE_INTEL_JITEVENTS ON)
			set(LLVM_USE_PERF ON)
		endif()

		set(CXX_FLAGS_OLD ${CMAKE_CXX_FLAGS})

		if (MSVC)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /D _SILENCE_ALL_CXX17_DEPRECATION_WARNINGS")
		endif()

		# LLVM needs to be built out-of-tree
		add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/llvm ${CMAKE_CURRENT_BINARY_DIR}/llvm_build EXCLUDE_FROM_ALL)
		set(LLVM_DIR "${CMAKE_CURRENT_BINARY_DIR}/llvm_build/lib/cmake/llvm/")

		set(CMAKE_CXX_FLAGS ${CXX_FLAGS_OLD})

		# now tries to find LLVM again
		find_package(LLVM 13.0 CONFIG)
		if(NOT LLVM_FOUND)
			message(FATAL_ERROR "Couldn't build LLVM from the submodule. You might need to run `git submodule update --init`")
		endif()

	else()
		message(STATUS "Using prebuilt LLVM")


		if (LLVM_DIR AND NOT IS_ABSOLUTE "${LLVM_DIR}")
			# change relative LLVM_DIR to be relative to the source dir
			set(LLVM_DIR ${CMAKE_SOURCE_DIR}/${LLVM_DIR})
		endif()

		find_package(LLVM 13.0 CONFIG)

		if (NOT LLVM_FOUND)
			if (LLVM_VERSION AND LLVM_VERSION_MAJOR LESS 11)
				message(FATAL_ERROR "Found LLVM version ${LLVM_VERSION}. Required version 11.0. \
														 Enable BUILD_LLVM_SUBMODULE option to build LLVM from included as a git submodule.")
			endif()

			message(FATAL_ERROR "Can't find LLVM libraries from the CMAKE_PREFIX_PATH path or LLVM_DIR. \
													 Enable BUILD_LLVM_SUBMODULE option to build LLVM from included as a git submodule.")
		endif()

		error()

	endif()

	set(LLVM_LIBS LLVMMCJIT)

	if(COMPILER_X86)
		set(LLVM_LIBS ${LLVM_LIBS} LLVMX86CodeGen LLVMX86AsmParser)
	endif()

	if(COMPILER_ARM)
		set(LLVM_LIBS ${LLVM_LIBS} LLVMX86CodeGen LLVMX86AsmParser LLVMAArch64CodeGen LLVMAArch64AsmParser)
	endif()

	if(WIN32 OR CMAKE_SYSTEM MATCHES "Linux")
		set(LLVM_LIBS ${LLVM_LIBS} LLVMIntelJITEvents)
	endif()

	if(CMAKE_SYSTEM MATCHES "Linux")
		set(LLVM_LIBS ${LLVM_LIBS} LLVMPerfJITEvents)
	endif()

	add_library(third_party_llvm INTERFACE)
	target_link_libraries(third_party_llvm INTERFACE ${LLVM_LIBS})
	target_include_directories(third_party_llvm INTERFACE ${LLVM_INCLUDE_DIRS})
	target_compile_definitions(third_party_llvm INTERFACE ${LLVM_DEFINITIONS} -DLLVM_AVAILABLE)

	add_library(third_party::llvm ALIAS third_party_llvm)
else()
	add_library(third_party::llvm ALIAS third_party_dummy_lib)
endif()