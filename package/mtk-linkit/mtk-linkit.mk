#############################################################
#
# mtk-linkit
#
#############################################################

MTK_LINKIT_SOURCE =
MTK_LINKIT_VERSION = 0.1
MTK_LINKIT_LICENSE = GPLv2

MTK_LINKIT_PACKAGE_DIR = $(NERVES_DEFCONFIG_DIR)/package/mtk-linkit

define MTK_LINKIT_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/pinmux $(MTK_LINKIT_PACKAGE_DIR)/pinmux.c
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/refclk $(MTK_LINKIT_PACKAGE_DIR)/refclk.c
endef

define MTK_LINKIT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/pinmux $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 755 $(@D)/refclk $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
