#!/bin/sh

set -e

FWUP_CONFIG=$NERVES_DEFCONFIG_DIR/fwup.conf

# Currently, we don't combine kernel and rootfs so the only part on the built-in
# NAND Flash is the kernel. Name it to simplify burning.
cp $BINARIES_DIR/uImage $BINARIES_DIR/lks7688.img

# Run the common post-image processing for nerves
$BR2_EXTERNAL_NERVES_PATH/board/nerves-common/post-createfs.sh $TARGET_DIR $FWUP_CONFIG
