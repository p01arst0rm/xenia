# dxbc src
#============================================================================


# src files
#============================================================================

dxbc_src = files(
    'DXBCChecksum.cpp')

# include directories
#========================================================================

# include current dir
#---------------------------------------------------
dxbc_inc += include_directories('.')

# build
#========================================================================

# build library
#---------------------------------------------------
dxbc_lib = library(
    'dxbc',
    sources : dxbc_src,
    include_directories : dxbc_inc,
    gnu_symbol_visibility: 'hidden')
