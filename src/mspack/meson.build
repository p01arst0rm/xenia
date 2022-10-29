# mspack src
#============================================================================

# dependencies
#============================================================================

mspack_dep_list = [
    fmt_dep
]

# src files
#============================================================================

mspack_src = files(
    'logging.cc',
    'lzxd.c',
    'system.c')

# include directories
#========================================================================

# include current dir
#---------------------------------------------------
mspack_inc += include_directories('.')

# build
#========================================================================

# build library
#---------------------------------------------------
mspack_lib = library(
    'mspack',
    sources : mspack_src,
    dependencies : mspack_dep_list,
    include_directories : [
        mspack_inc,
        xenia_inc],
    gnu_symbol_visibility: 'hidden')

# declare dependency
#---------------------------------------------------
mspack_dep = declare_dependency(
    link_with : mspack_lib,
    include_directories : mspack_inc)
