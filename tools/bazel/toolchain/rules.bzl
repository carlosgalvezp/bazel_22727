def _download_arm_toolchain_impl(rctx):
    # Download
    rctx.download_and_extract(
        url = "https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz",
        sha256 = "6cd1bbc1d9ae57312bcd169ae283153a9572bd6a8e4eeae2fedfbc33b115fdbb",
        stripPrefix = "arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi",
    )

    # Copy the BUILD.arm and cc_toolchain_config.bzl file.
    rctx.symlink(Label("//tools/bazel:BUILD.arm"), "BUILD")
    rctx.symlink(Label("//tools/bazel/toolchain:cc_toolchain_config.bzl"), "cc_toolchain_config.bzl")

download_arm_toolchain = repository_rule(
    implementation = _download_arm_toolchain_impl
)

def setup_arm_toolchain():
    download_arm_toolchain(name = "arm")
    native.register_toolchains("//tools/bazel/toolchain:gcc_toolchain_for_arm_none")

####################################################

def _download_clang_toolchain_impl(rctx):
    # Download Clang
    rctx.download_and_extract(
        url = "https://github.com/carlosgalvezp/compilers/releases/download/llvm-20240518200914-ubuntu22.04-ca70568/llvm-20240518200914-ubuntu22.04-ca70568.tar.gz",
        sha256 = "690766e557b8dc6e42cbe842082239a33f8af72be42f1b80c95158eec6b950a3",
    )

    # Copy the BUILD.llvm and cc_toolchain_config.bzl file.
    rctx.symlink(Label("//tools/bazel:BUILD.clang"), "BUILD")
    rctx.symlink(Label("//tools/bazel/toolchain:cc_toolchain_config.bzl"), "cc_toolchain_config.bzl")


download_clang_toolchain = repository_rule(
    implementation = _download_clang_toolchain_impl,
)

def setup_clang_toolchain():
    download_clang_toolchain(name = "clang")
