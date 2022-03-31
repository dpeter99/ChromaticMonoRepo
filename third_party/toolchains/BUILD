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
    name = "elf_gcc_toolchain",
    toolchain_identifier = "elf-gcc-toolchain",
    toolchain_config = ":elf_gcc_toolchain_config",
    all_files = ":all_files",
    compiler_files = ":all_files",
    dwp_files = ":empty",
    linker_files = ":all_files",
    objcopy_files = ":empty",
    strip_files = ":empty",
)

cc_toolchain_suite(
    name = "elf_gcc",
    toolchains = {
        "x86_64": ":elf_gcc_toolchain",
    },
    tags = ["manual"]
)