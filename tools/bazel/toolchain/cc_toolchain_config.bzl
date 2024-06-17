load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")

def _impl(ctx):
    tool_paths = []
    for name, path in ctx.attr.tool_paths.items():
        tool_paths.append(
            tool_path(
                name = name,
                path = path,
        )
    )

    features = []

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        toolchain_identifier = "local",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "k8",
        target_libc = "unknown",
        compiler = ctx.attr.compiler_name,
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "tool_paths": attr.string_dict(),
        "compiler_name": attr.string(),
        "target_cpu": attr.string(),
        "sysroot": attr.string(),
        "system_includes": attr.string_list(),
    },
    provides = [CcToolchainConfigInfo],
)
