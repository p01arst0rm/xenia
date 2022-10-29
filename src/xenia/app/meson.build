# xenia/app
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'emulator_window.cc',
    'xenia_main.cc')

# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = [
  'discord']

foreach dir : dirs
    subdir(dir)
endforeach