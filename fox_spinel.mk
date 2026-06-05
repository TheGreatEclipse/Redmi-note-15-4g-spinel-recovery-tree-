#
# Copyright (C) 2026 OrangeFox Recovery Project
# Copyright (C) 2026 mkpromvp - Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit AOSP base
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# CRITICAL FIX: OrangeFox R12 uses vendor/fox/config/common.mk
# Using vendor/twrp/config/common.mk breaks fox_spinel lunch target
$(call inherit-product, vendor/fox/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/spinel/device.mk)

PRODUCT_DEVICE       := spinel
PRODUCT_NAME         := fox_spinel
PRODUCT_BRAND        := Redmi
PRODUCT_MODEL        := Redmi Note 15 4G
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_RELEASE_NAME := spinel

FOX_MAINTAINER_PATCH_VERSION          := 1
OF_MAINTAINER        := mkpromvp
FOX_BUILD_TYPE       := Unofficial

FOX_AB_DEVICE             := 1
FOX_VIRTUAL_AB_DEVICE     := 1
FOX_VENDOR_BOOT_RECOVERY  := 1
FOX_VANILLA_BUILD         := 1
OF_USE_LZ4_COMPRESSION    := 1

OF_SCREEN_H               := 2400
OF_STATUS_H               := 80
OF_STATUS_INDENT_LEFT     := 48
OF_STATUS_INDENT_RIGHT    := 48
OF_CLOCK_POS              := 0

OF_FLASHLIGHT_ENABLE      := 1
OF_FL_PATH1               := /sys/class/leds/flashlight/brightness
OF_FL_PATH2               := /sys/class/leds/torch-sec1/brightness

OF_FBE_METADATA_MOUNT_IGNORE  := 1
OF_IGNORE_LOGICAL_MOUNT_ERRORS := 1

OF_DYNAMIC_FULL_SIZE      := 9126805504
OF_NO_REFLASH_CURRENT_ORANGEFOX := 1
FOX_USE_UPDATED_MAGISKBOOT := 1
OF_NO_MIUI_OTA_VENDOR_BACKUP := 1
OF_DEFAULT_KEYMASTER_VERSION := 4.1
OF_QUICK_BACKUP_LIST      := /data;/boot;/vendor_boot;
OF_ENABLE_LPTOOLS         := 1

FOX_USE_TAR_BINARY        := 1
FOX_USE_SED_BINARY        := 1
FOX_USE_BASH_SHELL        := 1
FOX_ASH_IS_BASH           := 1
FOX_ENABLE_APP_MANAGER    := 0
