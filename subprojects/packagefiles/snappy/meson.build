project(
  'snappy',
  ['cpp'])

# src files
#============================================================================

snappy_src = files(
  'snappy_unittest.cc',
  'snappy-c.cc',
  'snappy-sinksource.cc',
  'snappy-stubs-internal.cc',
  'snappy-test.cc',
  'snappy.cc')

# include directories
#========================================================================

# include current dir
#---------------------------------------------------
snappy_inc = [include_directories('.')]

# build library
#---------------------------------------------------
snappy_lib = library(
    'snappy',
    sources : snappy_src,
    include_directories : snappy_inc,
    gnu_symbol_visibility: 'hidden')

# declare dependency
#---------------------------------------------------
snappy_dep = declare_dependency(
    link_with : snappy_lib,
    include_directories : snappy_inc)
    