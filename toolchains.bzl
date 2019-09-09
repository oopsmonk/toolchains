load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def setup_toolchains():
    # aarch64
    http_archive(
        name = "bootlin_aarch64_toolchain",
        build_file = "@iota_toolchains//:compilers/aarch64--glibc--bleeding-edge-2018.07-1.BUILD",
        sha256 = "958ff195a79554144f25d1299fc6f8e5c3c35d060dec79baa99b898b8b00f10a",
        strip_prefix = "aarch64--glibc--bleeding-edge-2018.07-1",
        url = "https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2018.07-1.tar.bz2",
    )

    # armv7
    http_archive(
        name = "bootlin_arm_toolchain",
        build_file = "@iota_toolchains//:compilers/armv7-eabihf--glibc--bleeding-edge-2018.07-1.BUILD",
        sha256 = "d884e7459c6d64cf108c94b1fbd7924e10703ad5837831c3c88a3eabefc6c8da",
        strip_prefix = "armv7-eabihf--glibc--bleeding-edge-2018.07-1",
        url = "https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2018.07-1.tar.bz2",
    )

    # i686
    http_archive(
        name = "bootlin_i686_toolchain",
        build_file = "@iota_toolchains//:compilers/x86-i686--glibc--bleeding-edge-2018.07-1.BUILD",
        sha256 = "5ec38774469cadadfffac47392eab084f893be6a7c84fad76b371159879be74e",
        strip_prefix = "x86-i686--glibc--bleeding-edge-2018.07-1",
        url = "https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2018.07-1.tar.bz2",
    )

    # x86_64
    http_archive(
        name = "bootlin_x86_64_toolchain",
        build_file = "@iota_toolchains//:compilers/x86-64-core-i7--glibc--bleeding-edge-2018.07-1.BUILD",
        sha256 = "9bc9e7e87494f29da123889666119ba3bcdf00b1804d500ec2643f7920ac1cd5",
        strip_prefix = "x86-64-core-i7--glibc--bleeding-edge-2018.07-1",
        url = "https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2018.07-1.tar.bz2",
    )

    # esp32_64
    http_archive(
        name = "xtensa_esp32_elf_linux64",
        build_file = "@iota_toolchains//:compilers/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.BUILD",
        sha256 = "3fe96c151d46c1d4e5edc6ed690851b8e53634041114bad04729bc16b0445156",
        strip_prefix = "xtensa-esp32-elf",
        url = "https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz",
    )

    #emscripten
    http_archive(
        name = "emscripten_toolchain",
        build_file = "@iota_toolchains//:tools/emscripten/emscripten-toolchain.BUILD",
        strip_prefix = "emscripten-1.38.31",
        url = "https://github.com/kripken/emscripten/archive/1.38.31.tar.gz",
        sha256 = "c87e42cb6a104094e7daf2b7e61ac835f83674ac0168f533455838a1129cc764",
    )

    http_archive(
        name = "emscripten_clang",
        build_file = "@iota_toolchains//:compilers/emscripten-clang.BUILD",
        strip_prefix = "emscripten-llvm-e1.38.31",
        url = "https://s3.amazonaws.com/mozilla-games/emscripten/packages/llvm/tag/linux_64bit/emscripten-llvm-e1.38.31.tar.gz",
        sha256 = "a0c2f2c5a897577f40af0fdf68dcf3cf65557ff20c081df26678c066a4fed4b1",
    )

    # raspberry pi
    http_archive(
        name = "rpi_arm_toolchain",
        build_file = "@iota_toolchains//:compilers/arm-rpi-4.9.3-linux-gnueabihf.BUILD",
        sha256 = "a53ae3539c1f698843213ac045d9ef3aad6462704a8c327c779bb759862ac5fc",
        strip_prefix = "tools-49719d5544cd33b8c146235e1420f68cd92420fe",
        url = "https://github.com/raspberrypi/tools/archive/49719d5544cd33b8c146235e1420f68cd92420fe.tar.gz",
    )

def setup_initial_deps():
    http_archive(
        name = "build_bazel_rules_nodejs",
        sha256 = "1db950bbd27fb2581866e307c0130983471d4c3cd49c46063a2503ca7b6770a4",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/0.29.0/rules_nodejs-0.29.0.tar.gz"],
    )
