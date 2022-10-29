# xenia/hid
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'kernel_flags.cc',
    'kernel_module.cc',
    'kernel_state.cc',
    'user_module.cc',
    'xenumerator.cc',
    'xevent.cc',
    'xfile.cc',
    'xiocompletion.cc',
    'xmodule.cc',
    'xmutant.cc',
    'xnotifylistener.cc',
    'xobject.cc',
    'xsemaphore.cc',
    'xsocket.cc',
    'xsymboliclink.cc',
    'xthread.cc',
    'xtimer.cc')


# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = [
  'info',
  'util',
  'xam',
  'xbdm',
  'xboxkrnl'
]

foreach dir : dirs
    subdir(dir)
endforeach