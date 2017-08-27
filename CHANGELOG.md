# Changelog

## v0.14.1

  Updated dependencies
  * nerves_system_br v0.13.7

## v0.14.0

  This release contains an updated toolchain with Linux 4.1 Headers.
  You will have to clean and compile any c/c++ code in your project and
  dependencies. Failure to do so will result in an error when producing firmware.

  * nerves_system_br v0.13.5
    * fwup 0.15.4

  * Nerves toolchain v0.11.0
    https://github.com/nerves-project/toolchains/releases/tag/v0.11.0

  * New features
    * The application data partition is now `ext4`. This greatly improves its
      robustness to corruption. Nerves.Runtime contains code to initialize it on
      first boot.
    * Firmware images now contain metadata that can be queried at runtime (see
      Nerves.Runtime.KV
    * Firmware updates verify that they're updating the right target. If the target
      doesn't say that it's an `qemu` through the firmware metadata, the update
      will fail.
    * Added meta-misc and meta-vcs-identifier to the `fwup.conf` metadata for use
      by users and for the regression test framework
      
## v0.13.0

  * nerves_system_br v0.13.2
    * OTP 20
    * erlinit 1.1.3
    * fwup 0.15.3

## v0.12.0

This image is backwards incompatible with previous ones, so over-the-air
upgrades won't work. In theory, it's possible to make them work. If you
installed a previous version of Nerves onto your LinkIt Smart, this version will
force you to update the Linux kernel on the NAND Flash. Boot this one and run:

    :os.cmd("dd if=/boot/uImage of=/dev/mtdblock3 bs=1M")

This one's Linux kernel supports the `ext4` file system. Without the new kernel,
the application partition won't mount.

  * nerves_system_br v0.12.1
    * Buildroot 2017.05
    * Erlang/OTP 19.3
    * erlinit 1.1.1
    * fwup 0.15.0

  * New features
    * The application data partition is now `ext4`. This greatly improves its
      robustness to corruption. Nerves.Runtime contains code to initialize it on
      first boot.
    * Firmware images now contain metadata that can be queried at runtime (see
      Nerves.Runtime.KV

## v0.11.0

  * New Features
    * Support for Nerves 0.5.0

## v0.10.1

  * Bug fixes
    * Fix Musl C library/Buildroot issue where an incorrect symlink to libc was
      created.

## v0.10.0

  * New features
    * Bump toolchain to use gcc 5.3 (previously using gcc 4.9.3)

## v0.8.0

This version switches to using the `nerves_package` compiler. This will
consolidate overall deps and compilers.

  * Nerves.System.BR v0.9.0
    * Support for distillery
    * Support for nerves_package compiler

## v0.7.0

When upgrading to this version, be sure to review the updates to
nerves_defconfig. BR2_PACKAGE_ERLANG is no longer selected automatically and
must be added.

  * nerves_system_br v0.7.0
    * Package updates
      * Buildroot 2016.08

    * Bug fixes
      * Many packages were removed. These include Elixir and LFE since neither are
        actually used. Both are added as part of the user build step, so no
        functionality is lost. The most visible result is that the system images
        are smaller and the test .fw file boots to the Erlang prompt.
      * Fix false positive from scrubber when checking executable formats due to
        C++ template instantiations. Ignores SYSV vs. GNU/Linux ABI difference.

## v0.6.2

  * Bug fixes
    * Enable /dev/mem
    * Move Linux kernel to /boot, since that turned out to be an easier way to
      update in the near-term

## v0.6.1

  * Package versions
    * Nerves.System.BR v0.6.1
    * Linux 4.4

  * New features
    * On board wi-fi works

## v0.6.0
  * Nerves.System.BR v0.6.0
    * Package updates
      * Erlang OTP 19
      * Elixir 1.3.1
      * fwup 0.8.0
      * erlinit 0.7.3
      * bborg-overlays (pull in I2C typo fix from upstream)
    * Bug fixes
      * Synchronize file system kernel configs across all platforms

## v0.5.0

  * Nerves.System.BR v0.4.1
    * Bug fixes
      * syslinux fails to boot when compiled on some gcc 5 systems
      * Fixed regression when booting off eMMC on the BBB

    * Package updates
      * Erlang 18.3
      * Elixir 1.2.5
  * Enhancements
    * Includes config-pin for controlling pin muxing. more info: https://github.com/cdsteinkuehler/beaglebone-universal-io
