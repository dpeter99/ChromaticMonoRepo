load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

URL_TOOLCHAIN = "https://github.com/lordmilko/i686-elf-tools/releases/download/7.1.0/"

def toolchains():
    if "x86_64-elf-gcc" not in native.existing_rules():
        http_archive(
            name = "x86_64-elf-gcc",
            build_file = Label("//third_party/elf-gcc:x86_64-elf-gcc.BUILD"),
            url = URL_TOOLCHAIN + "x86_64-elf-tools-windows.zip",
            #strip_prefix = "x86_64-elf-tools-windows",
            sha256 = "335af11609759012e817013a070c7f22cbd66c7330dce23f54eed444cdaf3a9d",
        )
