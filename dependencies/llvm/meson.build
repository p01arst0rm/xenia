# llvm dependency
#============================================================================

if host_machine.system().contains('windows')
    llvm_dep = dependency(
        'llvm',
        version : '>= 4.0',
        required : false,
        fallback : ['llvm-win', 'llvm_dep'])
else
    llvm_dep = dependency(
    'llvm',
    version : '>= 4.0')
endif
