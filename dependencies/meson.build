# nix dependencies build file
#============================================================================


# declare dependency types
#---------------------------------------------------
required_deps = [
    
    'catch',
    #'curl',
    'crypto',
    # 'date',
    # 'pe',
    # 'half',
    
    # 'cpptoml',
    # 'aes_128',
    # 'disruptorplus',
    # 'dlmalloc',
    # 'dxbc',
    # 'fmt',
       
    # # 'FFmpeg',
    'llvm',
    # 'glslang',
    # 'SPIRV-Headers',
    'SPIRV-Tools',
    # 'vulkan-headers',
    # 'VulkanMemoryAllocator',
    # 'DirectXShaderCompiler',
    # 'SDL2',
    # 'FidelityFX',
    # 'fxaa',
    
    # 'capstone',
    # 'imgui',
    # 'rapidjson',
    # 'snappy',
    # 'stb',
    # 'utfcpp',
    # 'xbyak',
    # 'xxhash',
    # 'cxxopts',
    
    # 'discord-rpc',
    # 'microprofile',
]


# Build dependencies
#---------------------------------------------------
foreach dir : required_deps
    subdir(dir)
endforeach
