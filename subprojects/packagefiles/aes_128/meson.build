# aes_128 meson build
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
    'aes_128',
    'c',
    meson_version : '>= 0.57.0',
    license : 'MIT')


# src files
#============================================================================

aes_128_src = files()



# include directories
#========================================================================

# include current dir
#---------------------------------------------------
aes_128_inc = [include_directories('.')]

# add subdirectories
#---------------------------------------------------
dirs = [
  # 'lut',
  'unroll']

foreach dir : dirs
    subdir(dir)
endforeach


# build library
#---------------------------------------------------
aes_128_lib = library(
    'aes_128',
    sources : aes_128_src,
    include_directories : aes_128_inc,
    gnu_symbol_visibility: 'hidden')

# declare dependency
#---------------------------------------------------
aes_128_dep = declare_dependency(
    link_with : aes_128_lib,
    include_directories : aes_128_inc)
    