load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//tools/bazel/toolchain:rules.bzl",
    "setup_clang_toolchain",
    "setup_arm_toolchain",
)

workspace(name = "main_workspace")

setup_clang_toolchain()
setup_arm_toolchain()
