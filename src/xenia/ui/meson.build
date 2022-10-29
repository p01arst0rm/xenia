# xenia/hid
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'file_picker_android.cc',
    'file_picker_gtk.cc',
    'file_picker_win.cc',
    'graphics_upload_buffer_pool.cc',
    'graphics_util.cc',
    'imgui_dialog.cc',
    'imgui_drawer.cc',
    'immediate_drawer.cc',
    'menu_item.cc',
    'microprofile_drawer.cc',
    'presenter.cc',
    'renderdoc_api.cc',
    'surface_android.cc',
    'surface_gnulinux.cc',
    'surface_win.cc',
    'window.cc',
    'windowed_app.cc',
    'windowed_app_context.cc',
    'windowed_app_context_android.cc',
    'windowed_app_context_gtk.cc',
    'windowed_app_context_win.cc',
    'windowed_app_main_android.cc',
    'windowed_app_main_posix.cc',
    'windowed_app_main_win.cc',
    'window_android.cc',
    'window_demo.cc',
    'window_gtk.cc',
    'window_win.cc')


# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = [
  'd3d12',
  'shaders',
  'vulkan'
]

foreach dir : dirs
    subdir(dir)
endforeach