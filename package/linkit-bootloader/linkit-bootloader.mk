#############################################################
#
# linkit-bootloader
#
#############################################################

LINKIT_BOOTLOADER_VERSION = 17b849057da75f75926b62091876e6700cf7b4dc
LINKIT_BOOTLOADER_SITE = $(call github,MediaTek-Labs,linkit-smart-7688-uboot,$(LINKIT_BOOTLOADER_VERSION))
LINKIT_BOOTLOADER_LICENSE = GPLv2+
LINKIT_BOOTLOADER_LICENSE_FILES = COPYING
LINKIT_BOOTLOADER_INSTALL_TARGET = NO
LINKIT_BOOTLOADER_INSTALL_IMAGES = YES

define LINKIT_BOOTLOADER_CONFIGURE_CMDS
	# Believe it - they put the crosscompiler in the repo
	tar -x -f $(@D)/buildroot-gcc342.tar.bz2 -C $(@D)
endef

define LINKIT_BOOTLOADER_BUILD_CMDS
	CONFIG_CROSS_COMPILER_PATH=$(@D)/buildroot-gcc342/bin $(MAKE) -C $(@D) clean
	CONFIG_CROSS_COMPILER_PATH=$(@D)/buildroot-gcc342/bin $(MAKE) -C $(@D)
endef

define LINKIT_BOOTLOADER_INSTALL_IMAGES_CMDS
	cp $(@D)/uboot.bin $(BINARIES_DIR)/lks7688.ldr
endef

$(eval $(generic-package))
