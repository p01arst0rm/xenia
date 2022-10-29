# xenia/cpu/backend
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'assembler.cc',
    'backend.cc',
    'null_backend.cc')


# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = ['x64']

foreach dir : dirs
    subdir(dir)
endforeach