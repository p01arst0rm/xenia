param (
    [Parameter(Mandatory=$true)]
    [string]$prefix = "local",
    [Parameter(Mandatory=$true)]
    [string]$root = $(Get-Location)
)


function build_llvm() {
    Write-Output "[|] Configuring LLVM..."
    cmake -S "$root\subprojects\llvm" -B "$root\build\llvm\" -Thost=x64 `
        -DCMAKE_INSTALL_PREFIX:PATH="$prefix\" `
        -DCMAKE_CONFIGURATION_TYPES=Release `
        -DLLVM_TARGETS_TO_BUILD=X86 `
        -DLLVM_BUILD_RUNTIME=false `
        -DLLVM_BUILD_RUNTIMES=false `
        -DLLVM_BUILD_TOOLS=false `
        -DLLVM_INCLUDE_BENCHMARKS=false `
        -DLLVM_INCLUDE_DOCS=false `
        -DLLVM_INCLUDE_EXAMPLES=false `
        -DLLVM_INCLUDE_TESTS=false `
        -DLLVM_INCLUDE_TOOLS=false `
        -DLLVM_INCLUDE_UTILS=false `
        -DLLVM_USE_INTEL_JITEVENTS=true
    
    Write-Output "[|] Building LLVM..."
    cmake --build "$root\build\llvm\" --target ALL_BUILD --config Release

    Write-Output "[|] Installing LLVM to subproject directory..."
    cmake --build "$root\build\llvm\" --target INSTALL --config Release

}


function build_curl() {
    Write-Output "[|] Configuring curl..."
    cmake -S "$root\subprojects\curl" -B "$root\build\curl\" -Thost=x64 `
        -DCMAKE_INSTALL_PREFIX:PATH="$prefix\" `
        -DCMAKE_CONFIGURATION_TYPES=Release `
    
    Write-Output "[|] Building curl..."
    cmake --build "$root\build\curl\" --target ALL_BUILD --config Release

    Write-Output "[|] Installing curl to subproject directory..."
    cmake --build "$root\build\curl\" --target INSTALL --config Release
}


function build_glslang() {
    Write-Output "[|] Configuring glslang..."
    cmake -S "$root\subprojects\glslang" -B "$root\build\glslang\" -Thost=x64 `
        -DCMAKE_INSTALL_PREFIX:PATH="$prefix\" `
        -DENABLE_PCH:BOOL=OFF `
        -DBUILD_EXTERNAL:BOOL=OFF `
        -DSKIP_GLSLANG_INSTALL:BOOL=OFF `
        -DENABLE_SPVREMAPPER:BOOL=OFF `
        -DENABLE_GLSLANG_BINARIES:BOOL=OFF `
        -DENABLE_HLSL:BOOL=OFF `
        -DENABLE_OPT:BOOL=OFF `
        -DENABLE_CTEST:BOOL=OFF
    
    Write-Output "[|] Building glslang..."
    cmake --build "$root\build\glslang\" --target ALL_BUILD --config Release

    Write-Output "[|] Installing glslang to subproject directory..."
    cmake --build "$root\build\glslang" --target INSTALL --config Release
}


function build_spirv_headers() {
    Write-Output "[|] Configuring SPIRV-Headers..."
    cmake -S "$root\subprojects\SPIRV-Headers" -B "$root\build\SPIRV-Headers\" -Thost=x64 `
        -DCMAKE_INSTALL_PREFIX:PATH="$prefix\" `
        -DCMAKE_CONFIGURATION_TYPES=Release
    
    Write-Output "[|] Building SPIRV-Headers..."
    cmake --build "$root\build\SPIRV-Headers\" --target ALL_BUILD --config Release

    Write-Output "[|] Installing SPIRV-Headers to subproject directory..."
    cmake --build "$root\build\SPIRV-Headers" --target INSTALL --config Release
}


function build_spirv_tools() {
    Write-Output "[|] Configuring SPIRV-Tools..."
    cmake -S "$root\subprojects\SPIRV-Tools" -B "$root\build\SPIRV-Tools\" -Thost=x64 `
        -DCMAKE_INSTALL_PREFIX:PATH="$prefix\" `
        -DCMAKE_CONFIGURATION_TYPES=Release `
        -DSPIRV-Headers_SOURCE_DIR:PATH="$root\subprojects\SPIRV-Headers"
    
    Write-Output "[|] Building SPIRV-Tools..."
    cmake --build "$root\build\SPIRV-Tools\" --target ALL_BUILD --config Release

    Write-Output "[|] Installing SPIRV-Tools to subproject directory..."
    cmake --build "$root\build\SPIRV-Tools\" --target INSTALL --config Release
}


function build_VulkanMemoryAllocator() {
    Write-Output "[|] Configuring VulkanMemoryAllocator..."
    cmake -S "$root\subprojects\VulkanMemoryAllocator" -B "$root\build\VulkanMemoryAllocator\" -Thost=x64 `
        -DCMAKE_INSTALL_PREFIX:PATH="$prefix\" `
        -DCMAKE_CONFIGURATION_TYPES=Release
    
    Write-Output "[|] Building VulkanMemoryAllocator..."
    cmake --build "$root\build\VulkanMemoryAllocator\" --target ALL_BUILD --config Release

    Write-Output "[|] Installing VulkanMemoryAllocator to subproject directory..."
    cmake --build "$root\build\VulkanMemoryAllocator\" --target INSTALL --config Release
}


function build_DirectXShaderCompiler() {
    Write-Output "[|] Configuring DirectXShaderCompiler..."
    cmake -S "$root\subprojects\DirectXShaderCompiler" -B "$root\build\DirectXShaderCompiler\" -Thost=x64 `
        -DCMAKE_INSTALL_PREFIX:PATH="$prefix\" `
        -DCMAKE_CONFIGURATION_TYPES=Release
    
    Write-Output "[|] Building DirectXShaderCompiler..."
    cmake --build "$root\build\DirectXShaderCompiler\" --target ALL_BUILD --config Release

    Write-Output "[|] Installing DirectXShaderCompiler to subproject directory..."
    cmake --build "$root\build\DirectXShaderCompiler\" --target INSTALL --config Release
}


function build_SDL2() {
    Write-Output "[|] Configuring SDL2..."
    cmake -S "$root\subprojects\SDL2" -B "$root\build\SDL2\" -Thost=x64 `
        -DCMAKE_INSTALL_PREFIX:PATH="$prefix\" `
        -DCMAKE_CONFIGURATION_TYPES=Release
    
    Write-Output "[|] Building SDL2..."
    cmake --build "$root\build\SDL2\" --target ALL_BUILD --config Release

    Write-Output "[|] Installing SDL2 to subproject directory..."
    cmake --build "$root\build\SDL2\" --target INSTALL --config Release
}

function build_date() {
    Write-Output "[|] Configuring date..."
    cmake -S "$root\subprojects\date" -B "$root\build\date\" -Thost=x64 `
        -DCMAKE_INSTALL_PREFIX:PATH="$prefix\" `
        -DCMAKE_CONFIGURATION_TYPES=Release
    
    Write-Output "[|] Building date..."
    cmake --build "$root\build\date\" --target ALL_BUILD --config Release

    Write-Output "[|] Installing date to subproject directory..."
    cmake --build "$root\build\date\" --target INSTALL --config Release
}


function main() {

    Write-Output "[+] installing llvm..."
    build_llvm

    Write-Output "[+] installing curl..."
    build_curl

    Write-Output "[+] installing glslang..."
    build_glslang

    Write-Output "[+] installing SPIRV-Headers..."
    build_spirv_headers

    Write-Output "[+] installing SPIRV-Tools..."
    build_spirv_tools

    Write-Output "[+] installing VulkanMemoryAllocator..."
    build_VulkanMemoryAllocator

    Write-Output "[+] installing DirectXShaderCompiler..."
    build_DirectXShaderCompiler

    Write-Output "[+] installing SDL2..."
    build_SDL2

    Write-Output "[+] installing date..."
    build_date

}

main
