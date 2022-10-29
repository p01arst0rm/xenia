# dxbc meson build
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
    'dxbc',
    ['c', 'cpp'],
    meson_version : '>= 0.57.0',
    license : 'MIT')

dxbc_inc = [include_directories('.')]

# build
#============================================================================

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
dxbc_dep = declare_dependency(
    include_directories : dxbc_inc)
