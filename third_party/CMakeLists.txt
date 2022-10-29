# Dummy target to use when lib isn't available
add_library(third_party_dummy_lib INTERFACE)

add_subdirectory(catch)

add_subdirectory(curl)

add_subdirectory(crypto)

add_subdirectory(date)

add_subdirectory(pe)

add_subdirectory(half)

add_subdirectory(cpptoml)

include(aes_128.cmake)

# add_subdirectory(disruptorplus)

add_subdirectory(dlmalloc)

add_subdirectory(dxbc)

add_subdirectory(fmt)

add_subdirectory(FFmpeg)

include(llvm.cmake)

add_subdirectory(glslang)

add_subdirectory(SPIRV-Headers)

set(SPIRV-Headers_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/SPIRV-Headers)
add_subdirectory(SPIRV-Tools)
# set_property(TARGET def PROPERTY OUTPUT_NAME "def")


add_subdirectory(vulkan-headers)

add_subdirectory(VulkanMemoryAllocator)

# include(DirectXShaderCompiler.cmake)

add_subdirectory(SDL2)

include(FidelityFX-CAS.cmake)

include(FidelityFX-FSR.cmake)



add_subdirectory(fxaa)

add_subdirectory(capstone)

add_subdirectory(imgui)

add_subdirectory(rapidjson)

# add_subdirectory(snappy)

# add_subdirectory(stb)

set(UTF8_TESTS false)
add_subdirectory(utfcpp)

add_subdirectory(xbyak)

# add_subdirectory(xxhash)

add_subdirectory(cxxopts)

add_subdirectory(discord-rpc)

add_subdirectory(microprofile)
