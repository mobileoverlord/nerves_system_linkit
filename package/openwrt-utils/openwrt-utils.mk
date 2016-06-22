#############################################################
#
# openwrt-utils
#
#############################################################

HOST_OPENWRT_UTILS_SOURCE =
HOST_OPENWRT_UTILS_VERSION = 0.1
HOST_OPENWRT_UTILS_LICENSE = GPLv2

HOST_OPENWRT_UTILS_PACKAGE_DIR = $(TOPDIR)/../package/openwrt-utils

define HOST_OPENWRT_UTILS_BUILD_CMDS
	$(HOSTCC) $(HOST_CFLAGS) -o $(@D)/patch-dtb $(HOST_OPENWRT_UTILS_PACKAGE_DIR)/patch-dtb.c
	$(HOSTCC) $(HOST_CFLAGS) -o $(@D)/patch-cmdline $(HOST_OPENWRT_UTILS_PACKAGE_DIR)/patch-cmdline.c
endef

define HOST_OPENWRT_UTILS_INSTALL_CMDS
	$(INSTALL) -D -m 755 $(@D)/patch-dtb $(HOST_DIR)/usr/bin
	$(INSTALL) -D -m 755 $(@D)/patch-cmdline $(HOST_DIR)/usr/bin
endef

$(eval $(host-generic-package))
