#----------------------------------------------------------------------------
#
# Copyright (c) 2019 polar@ever3st.com
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 
#----------------------------------------------------------------------------

param (
    [Parameter(Mandatory=$false)]
    [string]$tmp = ".",
    [Parameter (Mandatory = $False)]
    [string]$python_version = "3.10.7",
    [Parameter (Mandatory = $False)]
    [string]$cmake_version = "3.25.0-rc2",
    [Parameter (Mandatory = $False)]
    [string]$meson_version = "0.63.3"
)

$root = Get-Location
[string]$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
[string]$sys_label = $([System.Environment]::SystemDirectory.split(":"))[0] + ":\"


[string]$python_url = "https://www.python.org/ftp/python/" + `
    $python_version + "/python-" + $python_version + "-amd64.exe"
[string]$python_major = $($python_version.Split(".")[0])
[string]$python_minor = $($python_version.Split(".")[1])
[string]$python_install_dir = $sys_label + "Program Files\Python" + $python_major + $python_minor


[string]$cmake_uri = "https://github.com/Kitware/CMake/releases/download/v" + `
    $cmake_version + "/cmake-" + $cmake_version + "-windows-x86_64.msi"
[string]$cmake_install_dir = $sys_label + "Program Files\CMake"


[string]$meson_uri = "https://github.com/mesonbuild/meson/releases/download/" + `
    $meson_version + "/meson-" + $meson_version + "-64.msi"
[string]$meson_install_dir = $sys_label + "Program Files\Meson"


[string]$vstoosl_url = "https://aka.ms/vs/17/release/vs_BuildTools.exe"
[string]$vstoosl_install_dir = $sys_label + "Program Files\Python" + $python_major + $python_minor



function check_bin([string]$program) {
    return (Get-Command $program -ErrorAction SilentlyContinue).Length
}


function add_to_path($path) {
    [string]$path_update = $env:Path + ";" + $path
    [string]$env:path = $path_update
    [string]$ps_args = "[System.Environment]::SetEnvironmentVariable('Path', '" `
        + $path_update + "', [System.EnvironmentVariableTarget]::Machine)"
    Start-Process powershell -Verb runAs `
    -ArgumentList $ps_args
}


function config_python() {
    if ((check_bin("python.exe")) -eq 0) {
        Write-Output "[|] Downloading Python..."
        Invoke-WebRequest -Uri $python_url -OutFile "$env:temp\python.exe"
        
        Write-Output "[|] Installing Python..."
        Start-Process $env:temp\python.exe  -Verb runas `
        -ArgumentList "/quiet InstallAllUsers=1 Include_test=0 Include_launcher=0 TargetDir=`"$python_install_dir`""

        Write-Output "[+] Updating Path..."        
        add_to_path($python_install_dir)
        add_to_path($python_install_dir + "\Scripts")
    }

    Write-Output $("[L] " + $(python.exe "--version"))
}


function config_cmake() {
    if ((check_bin("cmake.exe")) -eq 0) {
        Write-Output "[|] Downloading CMake..."
        Invoke-WebRequest -Uri $cmake_uri -OutFile "$env:temp\CMake.msi"

        Write-Output "[|] Installing CMake..."
        Start-Process msiexec -Verb runas `
        -ArgumentList "/package $env:temp\CMake.msi /qn PrependPath=1  TARGETDIR=`"$cmake_install_dir`""
        
        Write-Output "[+] Updating Path..."        
        add_to_path($cmake_install_dir + "\bin")
    }

    Write-Output "[|] verifying Path..." 
    [string]$cmake_path = $(Get-ItemProperty -Path "HKLM:\SOFTWARE\Kitware\CMake" -name "InstallDir").InstallDir 
    if ((check_bin("cmake.exe")) -eq $null) {add_to_path($cmake_path + "bin")}
    Write-Output $("[L] " + $(cmake.exe "--version"))
}


function config_meson() {
    if ((check_bin("meson.exe")) -eq 0) {
        Write-Output "[+] Downloading meson..."
        Invoke-WebRequest -Uri $meson_uri -OutFile "$env:temp\meson.msi"

        Write-Output "[+] Installing meson..."
        Start-Process msiexec -Verb runas `
        -ArgumentList "/package $env:temp\meson.msi /qn PrependPath=1 TargetDir=`"$python_install_dir`""

        Write-Output "[+] Updating Path..."        
        add_to_path($meson_install_dir)

    } else {
        Write-Output "[+] verifying Path..." 
        [string]$cmake_path = $(Get-ItemProperty -Path "HKLM:\SOFTWARE\Kitware\CMake" -name "InstallDir").InstallDir 
        if ((check_bin("meson.exe")) -eq $null) {add_to_path($cmake_path + "bin")}
        Write-Output $("[L] Installed meson: " + $(meson.exe "--version"))
    }
}


function config_renderdoc() {
    if ((check_bin("meson")) -eq 0) {
        Write-Output "[+] Downloading meson..."
        # Invoke-WebRequest -Uri $url -OutFile "$env:temp\python.exe"

        Write-Output "[+] Installing meson..."
        # Start-Process $env:temp\meson.exe  -Verb runas `
        # -ArgumentList "/quiet InstallAllUsers=1 Include_test=0 Include_launcher=0 TargetDir=`"$python_install_dir`""

        Write-Output "[+] Updating Path..."        
        add_to_path($meson_install_dir)

    } else {
        Write-Output "[+] verifying Path..." 
        [string]$cmake_path = $(Get-ItemProperty -Path "HKLM:\SOFTWARE\Kitware\CMake" -name "InstallDir").InstallDir 
        if ((check_bin("meson.exe")) -eq $null) {add_to_path($cmake_path + "bin")}
        Write-Output $("Installed CMake: " + $(cmake.exe "--version"))
    }
}




function main() {

    Write-Output "[+] Checking for Python installation..."
    config_python

    Write-Output "[+] Checking for CMake installation..."
    config_cmake
    
    Write-Output "[+] Checking for Meson installation..."
    config_meson

    # Write-Output "[+] Checking for RenderDoc installation..."
    # config_renderdoc
}


main