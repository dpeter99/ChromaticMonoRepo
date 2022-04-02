package(default_visibility = ["//visibility:public"])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

filegroup(name = "empty")

filegroup(
  name = 'bins',
  srcs = glob([
    'bin/**',
  ]),
)

filegroup(
  name = 'all_files',
  srcs = [
    '@x86_64-elf-gcc//:toolchain',
    ':bins',
  ],
)

cc_toolchain_config(name = "elf_gcc_toolchain_config")

cc_toolchain(
    name = "elf_gcc_toolchain_definition",
    #toolchain_identifier = "elf-gcc-toolchain",
    toolchain_config = ":elf_gcc_toolchain_config",
    all_files = ":all_files",
    compiler_files = ":all_files",
    dwp_files = ":empty",
    linker_files = ":all_files",
    objcopy_files = ":empty",
    strip_files = ":empty",
)

#cc_toolchain_suite(
#    name = "elf_gcc",
#    toolchains = {
#        "x86_64": ":elf_gcc_toolchain",
#    },
#    tags = ["manual"]
#)

toolchain(
    name = "elf_gcc_toolchain",
    toolchain = ":elf_gcc_toolchain_definition",
    # Register this toolchain with platforms.
    # The public interface for all C++ toolchains. Starlark rules that use C++
    # access the toolchain through this interface.
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    # Trigger this toolchain for x86-compatible platforms.
    # See https://github.com/bazelbuild/platforms.
    target_compatible_with = ["@platforms//cpu:x86_64"],

)