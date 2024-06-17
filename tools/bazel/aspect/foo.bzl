def _impl(target, ctx):
    return []

foo = aspect(
    implementation = _impl,
    attrs = {
        "_foo_wrapper": attr.label(
            default = "//tools/bazel/aspect:foo_wrapper",
            executable = True,
            cfg = "exec",
        ),
    },
)
