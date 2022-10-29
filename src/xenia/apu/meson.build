# xenia/apu
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'apu_flags.cc',
    'audio_driver.cc',
    'audio_system.cc',
    'xma_context.cc',
    'xma_decoder.cc',
    'xma_register_file.cc',
    'xma_register_file.cc')

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
  'xaudio2']

foreach dir : dirs
    subdir(dir)
endforeach