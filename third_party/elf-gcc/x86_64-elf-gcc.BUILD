package(default_visibility = ['//visibility:private'])

filegroup(
  name = 'toolchain',
  srcs = glob([
    '**',
  ]),
  visibility = ["//visibility:public"],
)

filegroup(
  name = 'ld_win',
  srcs = glob([
    'bin/x86_64-elf-ld.exe',
  ]),
)

alias(
    name = "ld",
    actual = select(
        {
            "@bazel_tools//src/conditions:linux_x86_64": "@bp_scc_linux//:scc",
            "@bazel_tools//src/conditions:host_windows": "@x86_64-elf-gcc//:ld_win",
        },
        no_match_error = "Can not find suitable `gcc` binary for your OS",
    ),
    visibility = ["//visibility:public"],
)

filegroup(
  name = 'ar_win',
  srcs = glob([
    'bin/x86_64-elf-ar.exe',
  ]),
)

alias(
    name = "ar",
    actual = select(
        {
            "@bazel_tools//src/conditions:linux_x86_64": "@bp_scc_linux//:scc",
            "@bazel_tools//src/conditions:host_windows": "@x86_64-elf-gcc//:ar_win",
        },
        no_match_error = "Can not find suitable `gcc` binary for your OS",
    ),
    visibility = ["//visibility:public"],
)

filegroup(
  name = 'gcc_win',
  srcs = glob([
    'bin/x86_64-elf-gcc.exe',
  ]),
)

alias(
    name = "gcc",
    actual = select(
        {
            "@bazel_tools//src/conditions:linux_x86_64": "@bp_scc_linux//:scc",
            "@bazel_tools//src/conditions:host_windows": "@x86_64-elf-gcc//:gcc_win",
        },
        no_match_error = "Can not find suitable `gcc` binary for your OS",
    ),
    visibility = ["//visibility:public"],
)