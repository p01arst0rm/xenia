# SPIRV-Tools dependency
#============================================================================

SPIRV_Tools_dep = dependency('SPIRV-Tools', required : false)  

if not SPIRV_Tools_dep.found()
    _deps = []
    SPIRV_Tools_headers_dir = join_paths(meson.project_source_root(),
        'subprojects', 'SPIRV-Tools_git', 'include')

    foreach d : ['SPIRV-Tools-diff', 'SPIRV-Tools-link', 'SPIRV-Tools-lint',
                'SPIRV-Tools-opt', 'SPIRV-Tools-reduce', 'SPIRV-Tools-shared',
                'SPIRV-Tools']
    _deps += cpp.find_library(d , dirs : toolchainlibdir)
    endforeach

    SPIRV_Tools_dep = declare_dependency(
    include_directories : SPIRV_Tools_headers_dir,
    dependencies : _deps,
    version : '9.0.0')
endif 