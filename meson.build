# Xenia project build file
#============================================================================

# Copyright (c) 2022, Xenia Development Team.
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the project nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL BEN VANIK BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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