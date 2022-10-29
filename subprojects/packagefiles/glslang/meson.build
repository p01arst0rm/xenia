project('glslang', ['cpp'])

cpp = meson.get_compiler('cpp')

_deps = []
_search = join_paths(meson.current_source_dir(), 'lib')
foreach d : ['glslang', 'MachineIndependent', 'OSDependent',
              'GenericCodeGen',
              'OGLCompiler',]
  _deps += cpp.find_library(d , dirs : _search)
endforeach

glslang_dep = declare_dependency(
  include_directories : include_directories('include'),
  dependencies : _deps,
  version : '9.0.0',
)
