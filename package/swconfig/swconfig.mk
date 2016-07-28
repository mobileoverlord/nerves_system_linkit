#############################################################
#
# swconfig
#
#############################################################

SWCONFIG_SOURCE =
SWCONFIG_VERSION = 0.1
SWCONFIG_LICENSE = GPLv2

SWCONFIG_PACKAGE_DIR = $(NERVES_DEFCONFIG_DIR)/package/swconfig

define SWCONFIG_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) -I$(SWCONFIG_PACKAGE_DIR)/include \
	    -lnl-3 -lnl-genl-3 -o $(@D)/swconfig $(SWCONFIG_PACKAGE_DIR)/cli.c $(SWCONFIG_PACKAGE_DIR)/swlib.c
endef

define SWCONFIG_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/swconfig $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
