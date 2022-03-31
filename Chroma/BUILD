filegroup(
  name = 'src',
  srcs = glob([
    'src/**/*.cpp',
    'src/**/*.c',
  ]),
)

filegroup(
  name = 'inc',
  srcs = glob([
    'inc/**/*',
  ]),
)

filegroup(
    name = 'test',
    srcs = ['src/test.cpp'],
)

cc_binary(
    name = "chroma_kernel",
    srcs = [
        ":src"
    ],
    includes = [
        ":inc",
    ]
)