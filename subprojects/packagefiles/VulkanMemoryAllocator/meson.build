project('VulkanMemoryAllocator', ['cpp'])

cpp = meson.get_compiler('cpp')
_search = join_paths(meson.current_source_dir(), 'lib')

VulkanMemoryAllocator_dep = declare_dependency(
  dependencies : cpp.find_library('VulkanMemoryAllocator' , dirs : _search),
  include_directories : include_directories('include'),
  version : '9.0.0',
)
