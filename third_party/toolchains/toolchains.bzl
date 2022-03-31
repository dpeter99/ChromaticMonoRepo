load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

URL_TOOLCHAIN = "https://github.com/lordmilko/i686-elf-tools/releases/download/7.1.0/"

def toolchains():
    if "x86_64-elf-gcc" not in native.existing_rules():
        http_archive(
            name = "x86_64-elf-gcc",
            build_file = Label("//third_party/toolchains:x86_64-elf-gcc.BUILD"),
            url = URL_TOOLCHAIN + "x86_64-elf-tools-windows.zip",
            ##sha256 = "35a093524e35061d0f10e302b99d164255dc285898d00a2b6ab14bfb64af3a45",
        )