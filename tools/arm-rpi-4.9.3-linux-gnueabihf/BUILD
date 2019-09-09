package(default_visibility = ["//visibility:public"])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

cc_toolchain_config(
    name = "rpi_toolchain_config",
    cpu = "armv6",
)

cc_toolchain_suite(
    name = "rpi-toolchain",
    # target_cpu | compiler
    toolchains = {
        "armv6|gcc": "rpi-armv6",
        "armv6": "rpi-armv6",
    },
)

filegroup(
    name = "linux_all_files",
    srcs = [
        "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:tool-wrappers",
        "@rpi_arm_toolchain//:compiler_pieces",
    ],
)

filegroup(
    name = "linux_linker_files",
    srcs = [
        "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:ar",
        "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:gcc",
        "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:ld",
        "@rpi_arm_toolchain//:compiler_pieces",
    ],
)

filegroup(
    name = "linux_compiler_files",
    srcs = [
        "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:as",
        "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:gcc",
        "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:ld",
    ],
)

# Here we'll keep things simple by including all files ditributed in archives.
filegroup(
    name = "all",
    srcs = glob(["**/*"]),
    # visibility = ["//visibility:private"],
)

filegroup(
    name = "empty",
    srcs = [],
    # visibility = ["//visibility:private"],
)

cc_toolchain(
    name = "rpi-armv6",
    all_files = ":linux_all_files",
    # all_files = ":all",
    ar_files = "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:ar",
    as_files = "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:as",
    compiler_files = ":linux_compiler_files",
    dwp_files = ":empty",
    dynamic_runtime_lib = ":empty",
    linker_files = ":linux_linker_files",
    objcopy_files = "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:objcopy",
    static_runtime_lib = ":empty",
    strip_files = "//tools/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf:strip",
    supports_param_files = 1,
    toolchain_config = ":rpi_toolchain_config",
    toolchain_identifier = "rpi_toolchain",
    visibility = ["//visibility:public"],
)
