# xenia/hid
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'linked_type_descriptor_set_allocator.cc',
    'single_layout_descriptor_set_pool.cc',
    'spirv_tools_context.cc',
    'vulkan_immediate_drawer.cc',
    'vulkan_mem_alloc.cc',
    'vulkan_presenter.cc',
    'vulkan_provider.cc',
    'vulkan_submission_tracker.cc',
    'vulkan_upload_buffer_pool.cc',
    'vulkan_util.cc',
    'vulkan_window_demo.cc')


# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = [
  'functions'
]

foreach dir : dirs
    subdir(dir)
endforeach