# xenia/hid
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'device.cc',
    'entry.cc',
    'vfs_dump.cc',
    'virtual_file_system.cc')


# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = [
  'devices'
]

foreach dir : dirs
    subdir(dir)
endforeach
