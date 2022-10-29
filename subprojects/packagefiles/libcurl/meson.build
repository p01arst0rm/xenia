project('libcurl', ['cpp'])



cpp = meson.get_compiler('cpp')

_search = join_paths(meson.current_source_dir(), 'lib')
message(_search)
libcurl_lib = cpp.find_library('libcurl_imp', dirs : _search)

libcurl_dep = declare_dependency(
  include_directories : include_directories('include'),
  dependencies : libcurl_lib,
  version : '6.0.0',
)
