"""A Starlark cc_toolchain configuration rules"""

load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "action_config",
    "artifact_name_pattern",
    "env_entry",
    "env_set",
    "feature",
    "feature_set",
    "flag_group",
    "flag_set",
    "make_variable",
    "tool",
    "tool_path",
    "variable_with_value",
    "with_feature_set",
)

load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")

def _impl(ctx):
    all_compile_actions = [
        ACTION_NAMES.c_compile,
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.assemble,
        ACTION_NAMES.preprocess_assemble,
        ACTION_NAMES.cpp_header_parsing,
        ACTION_NAMES.cpp_module_compile,
        ACTION_NAMES.cpp_module_codegen,
        ACTION_NAMES.clif_match,
        ACTION_NAMES.lto_backend,
    ]

    all_cpp_compile_actions = [
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.cpp_header_parsing,
        ACTION_NAMES.cpp_module_compile,
        ACTION_NAMES.cpp_module_codegen,
        ACTION_NAMES.clif_match,
    ]

    preprocessor_compile_actions = [
        ACTION_NAMES.c_compile,
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.preprocess_assemble,
        ACTION_NAMES.cpp_header_parsing,
        ACTION_NAMES.cpp_module_compile,
        ACTION_NAMES.clif_match,
    ]

    codegen_compile_actions = [
        ACTION_NAMES.c_compile,
        ACTION_NAMES.cpp_compile,
        ACTION_NAMES.linkstamp_compile,
        ACTION_NAMES.assemble,
        ACTION_NAMES.preprocess_assemble,
        ACTION_NAMES.cpp_module_codegen,
        ACTION_NAMES.lto_backend,
    ]

    all_link_actions = [
        ACTION_NAMES.cpp_link_executable,
        ACTION_NAMES.cpp_link_dynamic_library,
        ACTION_NAMES.cpp_link_nodeps_dynamic_library,
    ]

    objcopy_embed_data_action = action_config(
        action_name = "objcopy_embed_data",
        enabled = True,
        tools = [tool(path = "arm-linux-gnueabihf/arm-linux-gnueabihf-objcopy")],
    )

    action_configs = [objcopy_embed_data_action]

    armeabihf_feature = feature(
        name = "armeabihf",
        flag_sets = [
            flag_set(
                actions = all_compile_actions + all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = [
                            "--target=arm-linux-gnueabihf",
                        ],
                    ),
                ],
            ),
        ],
    )

    unfiltered_compile_flags_feature = feature(
        name = "unfiltered_compile_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.cpp_module_codegen,
                    ACTION_NAMES.lto_backend,
                    ACTION_NAMES.clif_match,
                ],
                flag_groups = [
                    flag_group(
                        flags = [
                            "-no-canonical-prefixes",
                            "-Wno-builtin-macro-redefined",
                            "-D__DATE__=\"redacted\"",
                            "-D__TIMESTAMP__=\"redacted\"",
                            "-D__TIME__=\"redacted\"",
                        ],
                    ),
                ],
            ),
        ],
    )

    default_compile_flags_feature = feature(
        name = "default_compile_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.cpp_module_codegen,
                    ACTION_NAMES.lto_backend,
                    ACTION_NAMES.clif_match,
                ],
                flag_groups = [
                    flag_group(
                        flags = [
                            "-v",
                            "-Lexternal/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/libexec/gcc/arm-linux-gnueabihf/4.9.3",
                            "-nostdinc",
                            "--sysroot=external/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/sysroot",
                            "-isystem",
                            "external/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/sysroot/usr/include",
                            "-Bexternal/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/libexec/gcc/arm-linux-gnueabihf/4.9.3",
                            "-Bexternal/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/libexec/gcc/arm-linux-gnueabihf/4.9.3/plugin",
                            "-Bexternal/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/libexec/gcc/arm-linux-gnueabihf/4.9.3/install-tools",
                            "-Bexternal/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/bin/",
                            "-I",
                            "external/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/lib/gcc/arm-linux-gnueabihf/4.9.3/include",
                            "-I",
                            "external/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/lib/gcc/arm-linux-gnueabihf/4.9.3/include-fixed",
                            "-I",
                            "external/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/include/c++/4.9.3",
                            "-I",
                            "external/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/include/c++/4.9.3/arm-linux-gnueabihf",
                            #"-U_FORTIFY_SOURCE",
                            #"-fstack-protector",
                            "-fPIE",
                            #"-fdiagnostics-color=always",
                        ],
                    ),
                ],
            ),
        ],
    )

    default_link_flags_feature = feature(
        name = "default_link_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = [
                            "-Lexternal/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/libexec/gcc/arm-linux-gnueabihf/4.9.3",
                            "--sysroot=external/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/sysroot",
                            "-Bexternal/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/bin",
                            "-Lexternal/rpi_arm_toolchain/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/libexec/gcc/arm-linux-gnueabihf/4.9.3",
                            "-lstdc++",
                            "-lm",
                            "-lpthread",
                            #"-no-canonical-prefixes",
                            "-pie",
                            #"-Wl,-z,relro,-z,now",
                            "-Wl,-no-as-needed",
                        ],
                    ),
                ],
            ),
        ],
    )

    supports_pic_feature = feature(name = "supports_pic", enabled = True)

    # objcopy_embed_flags_feature = feature(
    #     name = "objcopy_embed_flags",
    #     enabled = True,
    #     flag_sets = [
    #         flag_set(
    #             actions = ["objcopy_embed_data"],
    #             flag_groups = [flag_group(flags = ["-I", "binary"])],
    #         ),
    #     ],
    # )

    user_compile_flags_feature = feature(
        name = "user_compile_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.cpp_module_codegen,
                    ACTION_NAMES.lto_backend,
                    ACTION_NAMES.clif_match,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["%{user_compile_flags}"],
                        iterate_over = "user_compile_flags",
                        expand_if_available = "user_compile_flags",
                    ),
                ],
            ),
        ],
    )

    # sysroot_feature = feature(
    #     name = "sysroot",
    #     enabled = True,
    #     flag_sets = [
    #         flag_set(
    #             actions = [
    #                 ACTION_NAMES.preprocess_assemble,
    #                 ACTION_NAMES.linkstamp_compile,
    #                 ACTION_NAMES.c_compile,
    #                 ACTION_NAMES.cpp_compile,
    #                 ACTION_NAMES.cpp_header_parsing,
    #                 ACTION_NAMES.cpp_module_compile,
    #                 ACTION_NAMES.cpp_module_codegen,
    #                 ACTION_NAMES.lto_backend,
    #                 ACTION_NAMES.clif_match,
    #                 ACTION_NAMES.cpp_link_executable,
    #                 ACTION_NAMES.cpp_link_dynamic_library,
    #                 ACTION_NAMES.cpp_link_nodeps_dynamic_library,
    #             ],
    #             flag_groups = [
    #                 flag_group(
    #                     flags = ["--sysroot=%{sysroot}"],
    #                     expand_if_available = "sysroot",
    #                 ),
    #             ],
    #         ),
    #     ],
    # )
    supports_dynamic_linker_feature = feature(name = "supports_dynamic_linker", enabled = True)

    features = [
            default_compile_flags_feature,
            default_link_flags_feature,
            supports_pic_feature,
            # objcopy_embed_flags_feature,
            user_compile_flags_feature,
            # sysroot_feature,
            unfiltered_compile_flags_feature,
            supports_dynamic_linker_feature,
            armeabihf_feature,
        ]

    make_variables = []

    tool_paths = [
        tool_path(name = "ar", path = "arm-linux-gnueabihf/arm-linux-gnueabihf-ar"),
        tool_path(
            name = "compat-ld",
            path = "arm-linux-gnueabihf/arm-linux-gnueabihf-ld",
        ),
        tool_path(name = "cpp", path = "arm-linux-gnueabihf/arm-linux-gnueabihf-gcc"),
        tool_path(name = "dwp", path = "arm-linux-gnueabihf/arm-linux-gnueabihf-dwp"),
        tool_path(name = "gcc", path = "arm-linux-gnueabihf/arm-linux-gnueabihf-gcc"),
        tool_path(name = "gcov", path = "arm-linux-gnueabihf/arm-linux-gnueabihf-gcov"),
        tool_path(name = "ld", path = "arm-linux-gnueabihf/arm-linux-gnueabihf-ld"),
        tool_path(name = "nm", path = "arm-linux-gnueabihf/arm-linux-gnueabihf-nm"),
        tool_path(
            name = "objcopy",
            path = "arm-linux-gnueabihf/arm-linux-gnueabihf-objcopy",
        ),
        tool_path(
            name = "objdump",
            path = "arm-linux-gnueabihf/arm-linux-gnueabihf-objdump",
        ),
        tool_path(
            name = "strip",
            path = "arm-linux-gnueabihf/arm-linux-gnueabihf-strip",
        ),
    ]


    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(out, "Fake executable")

    return [
        # create a CcToolchainConfigInfo provider
        cc_common.create_cc_toolchain_config_info(
            ctx = ctx,
            features = features,
            action_configs = action_configs,
            artifact_name_patterns = [],
            cxx_builtin_include_directories = [],
            toolchain_identifier = "rpi_arm_toolchain",
            host_system_name = "armv6",
            target_system_name = "arm-linux-gnueabihf",
            target_cpu = "armv6",
            target_libc = "glibc_2.19",
            compiler = "gcc",
            abi_version = "armv6",
            abi_libc_version = "armv6",
            tool_paths = tool_paths,
            make_variables = [],
            builtin_sysroot = None,
            cc_target_os = None,
        ),
        DefaultInfo(
            executable = out,
        ),
    ]
cc_toolchain_config =  rule(
    implementation = _impl,
    attrs = {
        "cpu": attr.string(mandatory=True, values=["armv6"]),
    },
    provides = [CcToolchainConfigInfo],
    executable = True,
)
