workspace(
    name = "chroma_monorepo",
)

load("//third_party:deps.bzl", "deps")

deps()

register_toolchains(
    "//third_party/elf-gcc:elf_gcc_toolchain",
    #"//bar_tools:barc_windows_toolchain",
    # Target patterns are also permitted, so you could have also written:
    # "//bar_tools:all",
)
