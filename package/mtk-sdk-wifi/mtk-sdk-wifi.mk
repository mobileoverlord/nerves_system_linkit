#############################################################
#
# mtk-sdk-wifi
#
#############################################################

MTK_SDK_WIFI_SOURCE =
MTK_SDK_WIFI_VERSION = 0.1
MTK_SDK_WIFI_LICENSE = GPLv2
MTK_SDK_WIFI_DEPENDENCIES = linux

MTK_SDK_WIFI_PACKAGE_DIR = $(NERVES_DEFCONFIG_DIR)/package/mtk-sdk-wifi

define MTK_SDK_WIFI_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/ap_client $(MTK_SDK_WIFI_PACKAGE_DIR)/src/ap_client.c
endef

define MTK_SDK_WIFI_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/ap_client $(TARGET_DIR)/usr/bin

	# Install the wifi kernel module based on the kernel version
	$(INSTALL) -D -m 644 $(MTK_SDK_WIFI_PACKAGE_DIR)/wifi_binary/mt_wifi.ko_$(LINUX_VERSION_PROBED)_all \
		$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/mt_wifi.ko
	$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)

	# Copy rootfs-addition additions over
	cp -r $(MTK_SDK_WIFI_PACKAGE_DIR)/files/* $(TARGET_DIR)
endef

$(eval $(generic-package))
