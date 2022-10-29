# capstone meson build
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

project(
    'capstone',
    'c',
    meson_version : '>= 0.57.0',
    license : 'MIT')


# src files
#============================================================================

capstone_src = files(
    'cs.c',
    'MCInst.c',
    'MCInstrDesc.c',
    'MCRegisterInfo.c',
    'SStream.c',
    'utils.c')



# include directories
#========================================================================

# include current dir
#---------------------------------------------------
capstone_inc = [include_directories('.')]

# add subdirectories
#---------------------------------------------------
dirs = [
    'include',
    'arch']

foreach dir : dirs
    subdir(dir)
endforeach


# build library
#---------------------------------------------------
capstone_lib = library(
    'capstone',
    sources : capstone_src,
    include_directories : capstone_inc,
    gnu_symbol_visibility: 'hidden')

# declare dependency
#---------------------------------------------------
capstone_dep = declare_dependency(
    link_with : capstone_lib,
    include_directories : capstone_inc)
    