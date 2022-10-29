# xenia/hid
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'app_manager.cc',
    'content_manager.cc',
    'user_profile.cc',
    'xam_avatar.cc',
    'xam_content.cc',
    'xam_content_aggregate.cc',
    'xam_content_device.cc',
    'xam_enum.cc',
    'xam_info.cc',
    'xam_input.cc',
    'xam_locale.cc',
    'xam_module.cc',
    'xam_msg.cc',
    'xam_net.cc',
    'xam_notify.cc',
    'xam_nui.cc',
    'xam_party.cc',
    'xam_task.cc',
    'xam_ui.cc',
    'xam_user.cc',
    'xam_video.cc',
    'xam_voice.cc')


# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = [
  'apps'
]

foreach dir : dirs
    subdir(dir)
endforeach