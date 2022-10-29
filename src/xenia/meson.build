


# group("src")
# project("xenia-core")
#   uuid("970f7892-f19a-4bf5-8795-478c51757bec")
#   kind("StaticLib")
#   language("C++")
#   links({
#     "fmt",
#     "xenia-base",
#   })
#   defines({
#   })
#   files({"*.h", "*.cc"})


# dependencies
#============================================================================

xenia_dep_list = [
    aes_dep,
    capstone_dep,
    capstone_dep,
    libavcodec_dep,
    libavutil_dep,
    # llvm_dep
    # rpc_dep,
    
]


# src files
#============================================================================

xenia_src = files(
    'config.cc',
    'emulator.cc',
    'memory.cc')

# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')


# add subdirectories
#---------------------------------------------------
dirs = [
  'app',
  'apu',
  'base',
  'cpu',
  'debug',
  'gpu',
  'helper',
  'hid',
  'kernel',
  'tools',
  'ui',
  'vfs']

foreach dir : dirs
    subdir(dir)
endforeach

# build
#============================================================================

xenia_bin = executable(
    'xenia',
    sources : [
        xenia_src,
    ],
    install : false,
    install_mode : 'rwxr-xr-x',
    install_dir : bindir,
    include_directories : [
        xenia_inc
    ],
    dependencies : xenia_dep_list)