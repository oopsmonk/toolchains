package(default_visibility = ['//visibility:public'])

filegroup(
  name = 'gcc',
  srcs = [
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc',
  ],
)

filegroup(
  name = 'ar',
  srcs = [
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-ar',
  ],
)

filegroup(
  name = 'ld',
  srcs = [
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-ld',
  ],
)

filegroup(
  name = 'nm',
  srcs = [
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-nm',
  ],
)

filegroup(
  name = 'objcopy',
  srcs = [
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-objcopy',
  ],
)

filegroup(
  name = 'objdump',
  srcs = [
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-objdump',
  ],
)

filegroup(
  name = 'strip',
  srcs = [
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-strip',
  ],
)

filegroup(
  name = 'as',
  srcs = [
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-as',
  ],
)

filegroup(
  name = 'compiler_pieces',
  srcs = glob([
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/**',
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/libexec/**',
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/lib/gcc/arm-linux-gnueabihf/**',
    'arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/include/**',
  ]),
)

filegroup(
  name = 'compiler_components',
  srcs = [
    ':gcc',
    ':ar',
    ':ld',
    ':nm',
    ':objcopy',
    ':objdump',
    ':strip',
    ':as',
  ],
)

