# Xenia MSVC Bootstrap
#============================================================================

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

write-output "[+] Setting path variables..."
[string]$root = Get-Location
[string]$prefix = "$root\local"
$Env:PATH += ";$prefix;$prefix\include"
$Env:PKG_CONFIG_PATH += ";C:\Program Files;C:\Program Files (x86);"
$Env:PKG_CONFIG_PATH += ";$prefix;$prefix\share;"
$Env:PKG_CONFIG_PATH += ";$prefix\lib\pkgconfig;"
$Env:PKG_CONFIG_PATH += ";$prefix\share\pkgconfig;"

$Env:CMAKE_PREFIX_PATH += ";C:\Program Files;C:\Program Files (x86);$prefix;$prefix\cmake;"
$Env:CMAKE_PREFIX_PATH += ";$prefix\lib\;$prefix\lib\cmake;"
$Env:CMAKE_PREFIX_PATH += ";$prefix\share;$prefix\share\cmake;"

$CMAKE_PREFIX_PATH += "$prefix\lib\cmake\CURL;"
$Env:CMAKE_PREFIX_PATH += ";$prefix\SPIRV-Tools;"
$Env:CMAKE_PREFIX_PATH += ";$prefix\SPIRV-Tools-diff;"
$Env:CMAKE_PREFIX_PATH += ";$prefix\SPIRV-Tools-link;"
$Env:CMAKE_PREFIX_PATH += ";$prefix\SPIRV-Tools-lint"
$Env:CMAKE_PREFIX_PATH += ";$prefix\SPIRV-Tools-opt"
$Env:CMAKE_PREFIX_PATH += ";$prefix\SPIRV-Tools-reduce"

function download_subprojects() {
    write-output "[+] downloading xenia subprojects..."
    meson subprojects download
    meson subprojects packagefiles --apply
}

function build_toolchain() {
    Start-Process powershell -NoNewWindow -wait -ArgumentList `
        "$root\tools\env\toolchain.ps1 -root $root -prefix $prefix"
}

function build_xenia() {
    write-output "[|] Configuring With Meson..."
    meson setup build/xenia `
        --native-file ".\buildfiles\meson\x86_64-clang-msvc.ini" `
        -Dcmake_prefix_path="$Env:CMAKE_PREFIX_PATH" `
        -Dprefix="$prefix" `

    write-output "[|] Building xenia..."
    MSBuild.exe "$root\build\xenia\xenia.sln" 
}

function main() {

    write-output "[+] Deleting existing buildfiles"
    Remove-Item -Recurse -force "build/xenia"

    write-output "[+] downloading xenia subprojects..."
    download_subprojects

    write-output "[+] Building xenia toolchain..."
    build_toolchain

    write-output "[+] Building Xenia..."
    build_xenia
}

main