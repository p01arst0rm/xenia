# Xenia project build file
#============================================================================

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# init
#============================================================================


# init project
#-------------------------------------------------
project(
    'xenia',
    [
        'c',
        'cpp'
    ],
    meson_version : '>= 0.57.0',
    default_options : [
        'cpp_std=c++17',
        'warning_level=3',
        'debug=true'
    ],
    version : files('.version'),
    license : 'MIT')


# env
#============================================================================

# fetch compiler objects
#-------------------------------------------------
cpp = meson.get_compiler('cpp')


# set install directories
#-------------------------------------------------
prefix = get_option('prefix')
libdir = join_paths(prefix, get_option('libdir'))
bindir = join_paths(prefix, get_option('bindir'))
datadir = join_paths(prefix, get_option('datadir'))
sysconfdir = join_paths(prefix, get_option('sysconfdir'))
libexecdir = join_paths(prefix, get_option('libexecdir'))
mandir = join_paths(prefix, get_option('mandir'))
includedir = join_paths(prefix, get_option('includedir'))


# set toolchain prefix
#-------------------------------------------------
toolchainprefix = get_option('toolchainprefix')
if toolchainprefix == ''
    toolchainprefix = join_paths(meson.project_source_root(), 'local')
endif 


# set toolchain directories
#-------------------------------------------------
toolchainlibdir = join_paths (toolchainprefix, 'lib')
toolchainincludedir = join_paths (toolchainprefix, 'include')


# import cmake
#-------------------------------------------------
cmake = import('cmake')
find_program('pkg-config')


# Check if executing on Android
#-------------------------------------------------
if host_machine.system().contains('android')
    message('compiling on android.')
    host_linux_platform_is_android = true
endif

# build
#============================================================================


# include current dir
#---------------------------------------------------
xenia_inc = [include_directories('.')]


# include subdirectories
#---------------------------------------------------
dirs = [
    'dependencies',
    'include',
    # 'src',
    # 'scripts',
    # 'docs',
    #'assets',
    #'tools',
]

foreach dir : dirs
    subdir(dir)
endforeach