project('llvm-win', ['cpp'])

cpp = meson.get_compiler('cpp')

# fetch library
#-------------------------------------------------
if host_machine.system().contains('windows')
    _deps = []
    foreach d : ['LLVMCodeGen', 'LLVMScalarOpts', 'LLVMAnalysis',
                'LLVMTransformUtils', 'LLVMCore', 'LLVMX86CodeGen',
                'LLVMSelectionDAG', 'LLVMipo', 'LLVMAsmPrinter',
                'LLVMInstCombine', 'LLVMInstrumentation', 'LLVMMC',
                'LLVMGlobalISel', 'LLVMObjectYAML', 'LLVMDebugInfoPDB',
                'LLVMVectorize', 'LLVMPasses', 'LLVMSupport',
                'LLVMLTO', 'LLVMObject', 'LLVMDebugInfoCodeView',
                'LLVMDebugInfoDWARF', 'LLVMOrcJIT', 'LLVMProfileData',
                'LLVMObjCARCOpts', 'LLVMBitReader', 'LLVMCoroutines',
                'LLVMBitWriter', 'LLVMRuntimeDyld', 'LLVMMIRParser',
                'LLVMX86Desc', 'LLVMAsmParser', 'LLVMTableGen',
                'LLVMFuzzMutate', 'LLVMLinker', 'LLVMMCParser',
                'LLVMExecutionEngine', 'LLVMCoverage', 'LLVMInterpreter',
                'LLVMTarget', 'LLVMX86AsmParser', 'LLVMSymbolize',
                'LLVMDebugInfoMSF', 'LLVMMCJIT', 'LLVMXRay',
                'LLVMX86Disassembler',
                'LLVMMCDisassembler', 'LLVMOption', 'LLVMIRReader',
                'LLVMDlltoolDriver', 'LLVMDemangle',
                'LLVMBinaryFormat', 'LLVMLineEditor',
                'LLVMWindowsManifest', 'LLVMX86Info']
      _deps += cpp.find_library(d , dirs : join_paths(meson.project_source_root(), 'lib'))
    endforeach

    llvm_dep = declare_dependency(
      include_directories : include_directories('include'),
      dependencies : _deps,
      version : '9.0.0',
    )

    has_rtti = false
    irbuilder_h = files('include/llvm/IR/IRBuilder.h')
endif

