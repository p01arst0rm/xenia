# imgui src
#============================================================================


# src files
#============================================================================

imgui_src = files(
    'imgui.cpp',
    'imgui_draw.cpp',
    'imgui_widgets.cpp')

# include directories
#========================================================================

# include current dir
#---------------------------------------------------
imgui_inc += include_directories('.')

# build
#========================================================================

# build library
#---------------------------------------------------
imgui_lib = library(
    'imgui',
    sources : imgui_src,
    include_directories : imgui_inc,
    gnu_symbol_visibility: 'hidden')
