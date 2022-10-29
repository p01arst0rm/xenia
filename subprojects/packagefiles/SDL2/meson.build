project('SDL2', ['cpp'])

cpp = meson.get_compiler('cpp')

_deps = []
_search = join_paths(meson.current_source_dir(), 'lib')
foreach d : ['SDL2', 'SDL2main']
  _deps += cpp.find_library(d , dirs : _search)
endforeach

SDL2_dep = declare_dependency(
  include_directories : include_directories('include'),
  dependencies : _deps,
  version : '9.0.0',
)
