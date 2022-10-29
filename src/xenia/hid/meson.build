# xenia/hid
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'hid_demo.cc',
    'hid_flags.cc',
    'input_system.cc')


# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = [
  'nop',
  'sdl',
  'winkey',
  'xinput']

foreach dir : dirs
    subdir(dir)
endforeach