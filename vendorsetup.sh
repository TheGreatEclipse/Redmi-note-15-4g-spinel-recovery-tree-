#!/usr/bin/env bash
#
# vendorsetup.sh - OrangeFox R12 Environment
# Device: Redmi Note 15 4G (spinel) - MT6789
# For OrangeFox builds: kept. For TWRP builds: removed by workflow.
#

export LC_ALL="C"
export TARGET_ARCH="arm64"
export FOX_VERSION="R12.1"
export OF_MAINTAINER="mkpromvp"
export FOX_BUILD_TYPE="Unofficial"
export FOX_AB_DEVICE="1"
export FOX_VIRTUAL_AB_DEVICE="1"
export FOX_VENDOR_BOOT_RECOVERY="1"
export FOX_VANILLA_BUILD="1"
export OF_USE_LZ4_COMPRESSION="1"
export ALLOW_MISSING_DEPENDENCIES=true
export OF_SCREEN_H="2400"
export OF_STATUS_H="80"
export OF_STATUS_INDENT_LEFT="48"
export OF_STATUS_INDENT_RIGHT="48"
export OF_CLOCK_POS="0"
export OF_FLASHLIGHT_ENABLE="1"
export OF_FL_PATH1="/sys/class/leds/flashlight/brightness"
export OF_FL_PATH2="/sys/class/leds/torch-sec1/brightness"
export OF_DYNAMIC_FULL_SIZE="9126805504"
export OF_FBE_METADATA_MOUNT_IGNORE="1"
export OF_IGNORE_LOGICAL_MOUNT_ERRORS="1"
export OF_DEFAULT_KEYMASTER_VERSION="4.1"
export OF_NO_REFLASH_CURRENT_ORANGEFOX="1"
export FOX_USE_UPDATED_MAGISKBOOT="1"
export OF_QUICK_BACKUP_LIST="/data;/boot;/vendor_boot;"
export FOX_USE_TAR_BINARY="1"
export FOX_USE_SED_BINARY="1"
export FOX_USE_BASH_SHELL="1"
export FOX_ASH_IS_BASH="1"
export OF_ENABLE_LPTOOLS="1"
# FIX: Correct OrangeFox env var (OF_ prefix)
export OF_FORCE_PREBUILT_KERNEL="1"
export OF_NO_MIUI_OTA_VENDOR_BACKUP="1"
export FOX_ENABLE_APP_MANAGER="0"
export FOX_DELETE_AROMAFM="0"
export FOX_INSTALLER_DEBUG_MODE="0"

echo "[OrangeFox R12] Environment loaded for spinel (vendor_boot A/B)"
