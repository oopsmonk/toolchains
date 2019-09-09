package(default_visibility = ["//tools/arm-rpi-4.9.3-linux-gnueabihf:__pkg__"])

filegroup(
    name = "gcc",
    srcs = [
        "arm-linux-gnueabihf-gcc",
        "@rpi_arm_toolchain//:gcc",
    ],
)

filegroup(
    name = "ar",
    srcs = [
        "arm-linux-gnueabihf-ar",
        "@rpi_arm_toolchain//:ar",
    ],
)

filegroup(
    name = "ld",
    srcs = [
        "arm-linux-gnueabihf-ld",
        "@rpi_arm_toolchain//:ld",
    ],
)

filegroup(
    name = "nm",
    srcs = [
        "arm-linux-gnueabihf-nm",
        "@rpi_arm_toolchain//:nm",
    ],
)

filegroup(
    name = "objcopy",
    srcs = [
        "arm-linux-gnueabihf-objcopy",
        "@rpi_arm_toolchain//:objcopy",
    ],
)

filegroup(
    name = "objdump",
    srcs = [
        "arm-linux-gnueabihf-objdump",
        "@rpi_arm_toolchain//:objdump",
    ],
)

filegroup(
    name = "strip",
    srcs = [
        "arm-linux-gnueabihf-strip",
        "@rpi_arm_toolchain//:strip",
    ],
)

filegroup(
    name = "as",
    srcs = [
        "arm-linux-gnueabihf-as",
        "@rpi_arm_toolchain//:as",
    ],
)

filegroup(
    name = "tool-wrappers",
    srcs = [
        ":ar",
        ":as",
        ":gcc",
        ":ld",
        ":nm",
        ":objcopy",
        ":objdump",
        ":strip",
    ],
)
