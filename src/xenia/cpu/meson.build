# xenia/cpu
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'breakpoint.cc',
    'cpu_flags.cc',
    'elf_module.cc',
    'entry_table.cc',
    'export_resolver.cc',
    'function.cc',
    'function_debug_info.cc',
    'lzx.cc',
    'mmio_handler.cc',
    'module.cc',
    'processor.cc',
    'raw_module.cc',
    'stack_walker_posix.cc',
    'stack_walker_win.cc',
    'test_module.cc',
    'thread.cc',
    'thread_state.cc',
    'xex_module.cc')


# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = [
  'backend',
  'compiler',
  'hir',
  'ppc']

foreach dir : dirs
    subdir(dir)
endforeach