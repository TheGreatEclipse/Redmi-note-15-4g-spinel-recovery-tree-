#
# Copyright (C) 2026 OrangeFox Recovery Project
# Copyright (C) 2026 mkpromvp - Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit AOSP base
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit common TWRP/OrangeFox stuff - CRITICAL for lunch registration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/spinel/device.mk)

# ─── Device Identifiers ───────────────────────────────────────────────
PRODUCT_DEVICE       := spinel
PRODUCT_NAME         := fox_spinel
PRODUCT_BRAND        := Redmi
PRODUCT_MODEL        := Redmi Note 15 4G
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_RELEASE_NAME := spinel

# ─── OrangeFox Version ────────────────────────────────────────────────
FOX_VERSION            := R12.1
OF_MAINTAINER          := mkpromvp
FOX_BUILD_TYPE         := Unofficial

# ─── OrangeFox Device Flags ───────────────────────────────────────────
FOX_AB_DEVICE              := 1
FOX_VIRTUAL_AB_DEVICE      := 1
FOX_VENDOR_BOOT_RECOVERY   := 1
FOX_VANILLA_BUILD          := 1
OF_USE_LZ4_COMPRESSION     := 1
OF_FORCE_PREBUILT_KERNEL   := 1

# Screen geometry (6.72" FHD+ 20:9)
OF_SCREEN_H                := 2400
OF_STATUS_H                := 80
OF_STATUS_INDENT_LEFT      := 48
OF_STATUS_INDENT_RIGHT     := 48
OF_CLOCK_POS               := 0

# Flashlight (MTK LED path)
OF_FLASHLIGHT_ENABLE       := 1
OF_FL_PATH1                := /sys/class/leds/flashlight/brightness
OF_FL_PATH2                := /sys/class/leds/torch-sec1/brightness

# FBE / Metadata
OF_FBE_METADATA_MOUNT_IGNORE  := 1
OF_IGNORE_LOGICAL_MOUNT_ERRORS := 1

# Dynamic partition / super size
OF_DYNAMIC_FULL_SIZE       := 9126805504

# vendor_boot restrictions
OF_NO_REFLASH_CURRENT_ORANGEFOX := 1

# Magiskboot (use updated binary for kernel 6.12)
FOX_USE_UPDATED_MAGISKBOOT := 1

# No Miui OTA vendor backup
OF_NO_MIUI_OTA_VENDOR_BACKUP := 1

# Keymaster version for Android 16
OF_DEFAULT_KEYMASTER_VERSION := 4.1

# Quick backup list
OF_QUICK_BACKUP_LIST        := /data;/boot;/vendor_boot;

# Lptools
OF_ENABLE_LPTOOLS           := 1

# Extra binaries
FOX_USE_TAR_BINARY          := 1
FOX_USE_SED_BINARY          := 1
FOX_USE_BASH_SHELL          := 1
FOX_ASH_IS_BASH             := 1
FOX_ENABLE_APP_MANAGER      := 0
