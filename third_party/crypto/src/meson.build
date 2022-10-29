# crypto src
#============================================================================


# src files
#============================================================================

crypto_src = files(
    'rc4.c',
    'rijndael-alg-fst.c',
    'sha256.cpp')

# include directories
#========================================================================

# include current dir
#---------------------------------------------------
crypto_inc += include_directories('.')

# build
#========================================================================

# build library
#---------------------------------------------------
crypto_lib = library(
    'crypto',
    sources : crypto_src,
    dependencies : cppdes_dep,
    include_directories : crypto_inc,
    gnu_symbol_visibility: 'hidden')
