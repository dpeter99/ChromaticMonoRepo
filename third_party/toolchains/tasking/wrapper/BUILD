# third_party\toolchains\tasking\wrapper\BUILD

package(default_visibility = ['//visibility:public'])


filegroup(
  name = 'xtc',
  srcs = glob([
    '*xtc.bat',
  ]),
)



alias(
    name = "gcc",
    actual = select(
        {
            "@bazel_tools//src/conditions:linux_x86_64": "@bp_scc_linux//:scc",
            "@bazel_tools//src/conditions:windows": "@x86_64-elf-gcc//:gcc",
        },
        no_match_error = "Can not find suitable `gcc` binary for your OS",
    ),
    visibility = ["//visibility:public"],
)
