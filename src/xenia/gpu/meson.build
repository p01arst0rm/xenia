# xenia/debug
#============================================================================


# src files
#============================================================================

xenia_src += files(
    'command_processor.cc',
    'draw_extent_estimator.cc',
    'draw_util.cc',
    'dxbc_shader.cc',
    'dxbc_shader_translator.cc',
    'dxbc_shader_translator_alu.cc',
    'dxbc_shader_translator_fetch.cc',
    'dxbc_shader_translator_memexport.cc',
    'dxbc_shader_translator_om.cc',
    'gpu_flags.cc',
    'graphics_system.cc',
    'packet_disassembler.cc',
    'primitive_processor.cc',
    'registers.cc',
    'register_file.cc',
    'render_target_cache.cc',
    'sampler_info.cc',
    'shader.cc',
    'shader_compiler_main.cc',
    'shader_interpreter.cc',
    'shader_translator.cc',
    'shader_translator_disasm.cc',
    'shared_memory.cc',
    'spirv_shader.cc',
    'spirv_shader_translator.cc',
    'spirv_shader_translator_alu.cc',
    'spirv_shader_translator_fetch.cc',
    'spirv_shader_translator_rb.cc',
    'texture_cache.cc',
    'texture_conversion.cc',
    'texture_dump.cc',
    'texture_extent.cc',
    'texture_info.cc',
    'texture_info_formats.cc',
    'texture_util.cc',
    'trace_dump.cc',
    'trace_player.cc',
    'trace_reader.cc',
    'trace_viewer.cc',
    'trace_writer.cc',
    'ucode.cc',
    'xenos.cc')


# include directories
#========================================================================

# include current dir
#---------------------------------------------------
xenia_inc += include_directories('.')

# add subdirectories
#---------------------------------------------------
dirs = [
    'd3d12',
    'null',
    'shaders',
    'vulkan']

foreach dir : dirs
    subdir(dir)
endforeach