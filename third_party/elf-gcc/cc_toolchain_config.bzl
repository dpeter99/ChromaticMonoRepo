#third_party\elf-gcc\cc_toolchain_config.bzl

load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "action_config",
    "feature",
    "flag_group",
    "flag_set",
    "tool",
    #"tool_path",
)

all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

all_compile_actions = [
    ACTION_NAMES.assemble,
    ACTION_NAMES.c_compile,
    ACTION_NAMES.clif_match,
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.cpp_header_parsing,
    ACTION_NAMES.cpp_module_codegen,
    ACTION_NAMES.cpp_module_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.lto_backend,
    ACTION_NAMES.preprocess_assemble,
]

def _impl(ctx):
    gcc_wrapper = ctx.file.gcc_wrapper
    ld_wrapper = ctx.file.ld_wrapper
    ar_wrapper = ctx.file.ar_wrapper

    action_configs = [
        action_config(
            action_name = ACTION_NAMES.cpp_link_nodeps_dynamic_library,
            tools = [tool(tool = gcc_wrapper)],
        ),
        action_config(
            action_name = ACTION_NAMES.cpp_link_executable,
            implies = [],
            tools = [tool(tool = gcc_wrapper)],
        ),
        action_config(
            action_name = "ld_pack_object",
            tools = [tool(tool = ld_wrapper)],
        ),
        action_config(
            action_name = ACTION_NAMES.cpp_compile,
            #implies = [
            #"compiler_input_flags",
            #"compiler_output_flags",
            #"default_compile_flags",
            #"user_compile_flags",
            #    "include_paths",
            #],
            tools = [tool(tool = gcc_wrapper)],
        ),
        action_config(
            action_name = ACTION_NAMES.c_compile,
            tools = [tool(tool = gcc_wrapper)],
        ),
        action_config(
            action_name = ACTION_NAMES.cpp_header_parsing,
            tools = [tool(tool = gcc_wrapper)],
        ),
        action_config(
            action_name = ACTION_NAMES.cpp_link_static_library,
            tools = [tool(tool = ar_wrapper)],
        ),
    ]

    default_compiler_flags = feature(
        name = "default_compiler_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = all_compile_actions,
                flag_groups = [
                    flag_group(
                        flags = [
                            "-ffreestanding",
                            "-O0",
                            "-Wall",
                            "-Wextra",
                            "-Werror",
                            "-fPIC",
                            "-fno-canonical-system-headers",
                            "-Wno-builtin-macro-redefined",
                            "-D__DATE__=\"redacted\"",
                            "-D__TIMESTAMP__=\"redacted\"",
                            "-D__TIME__=\"redacted\"",
                        ],
                    ),
                ],
            ),
        ],
    )

    default_linker_flags = feature(
        name = "default_linker_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = ([
                    flag_group(
                        flags = [
                            "-ffreestanding",
                            "-O2",
                            "-nostdlib",
                            "-nostartfiles",
                            "-lgcc",
                        ],
                    ),
                ]),
            ),
        ],
    )

    features = [
        default_compiler_flags,
        default_linker_flags,
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        toolchain_identifier = "aarch64-toolchain",
        host_system_name = "local",
        target_system_name = "unknown",
        target_cpu = "unknown",
        target_libc = "unknown",
        compiler = "unknown",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        #tool_paths = tool_paths,
        action_configs = action_configs,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    provides = [CcToolchainConfigInfo],
    attrs = {
        "gcc_wrapper": attr.label(allow_single_file = True, default = "@x86_64-elf-gcc//:gcc", doc = "Wrapper to call different TASKING executables"),
        "ld_wrapper": attr.label(allow_single_file = True, default = "@x86_64-elf-gcc//:ld", doc = "Wrapper to call different TASKING executables"),
        "ar_wrapper": attr.label(allow_single_file = True, default = "@x86_64-elf-gcc//:ar", doc = "Wrapper to call different TASKING executables"),
    },
    #toolchains = [
    #        "@bazel_tools//tools/cpp:toolchain_type", # copybara-use-repo-external-label
    #],
)
