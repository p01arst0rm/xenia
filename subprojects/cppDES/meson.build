# cppdes meson build
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
    'cppDES',
    ['c', 'cpp'],
    meson_version : '>= 0.57.0',
    license : 'MIT')



# build
#============================================================================

# include current dir
#---------------------------------------------------
cppdes_inc = [include_directories('.')]

# include subdirectories
#---------------------------------------------------
dirs = [
    'include',
    'src'
]
 
foreach dir : dirs
    subdir(dir)
endforeach

# declare dependency
#---------------------------------------------------
cppdes_dep = declare_dependency(
    link_with : cppdes_lib,
    include_directories : cppdes_inc)
