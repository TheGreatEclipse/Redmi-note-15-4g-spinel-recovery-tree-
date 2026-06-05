#!/usr/bin/env bash
#
# vendorsetup.sh – OrangeFox R12 / TWRP Environment Variables
# Device: Redmi Note 15 4G (spinel) – MT6789 / Helio G100 Ultra
# Maintained by: mkpromvp
#
# This file is sourced automatically by build/envsetup.sh
#

export LC_ALL="C"

# ─── Architecture ────────────────────────────────────────────────────
export TARGET_ARCH="arm64"

# ─── OrangeFox Core Flags ────────────────────────────────────────────
export FOX_VERSION="R12.1"
export OF_MAINTAINER="mkpromvp"
export FOX_BUILD_TYPE="Unofficial"

# A/B + Virtual A/B + vendor_boot recovery
export FOX_AB_DEVICE="1"
export FOX_VIRTUAL_AB_DEVICE="1"
export FOX_VENDOR_BOOT_RECOVERY="1"

# Vanilla build (A/B device, non-MIUI)
export FOX_VANILLA_BUILD="1"

# LZ4 ramdisk
export OF_USE_LZ4_COMPRESSION="1"

# Allow missing deps (minimal manifest build)
export ALLOW_MISSING_DEPENDENCIES=true

# ─── Screen Config (6.72" 1080x2400 FHD+ 20:9) ───────────────────────
export OF_SCREEN_H="2400"
export OF_STATUS_H="80"
export OF_STATUS_INDENT_LEFT="48"
export OF_STATUS_INDENT_RIGHT="48"
export OF_CLOCK_POS="0"
export OF_ALLOW_DISABLE_NAVBAR="0"

# ─── Flashlight (MTK paths) ───────────────────────────────────────────
export OF_FLASHLIGHT_ENABLE="1"
export OF_FL_PATH1="/sys/class/leds/flashlight/brightness"
export OF_FL_PATH2="/sys/class/leds/torch-sec1/brightness"

# ─── Dynamic Partitions / Super ───────────────────────────────────────
export OF_DYNAMIC_FULL_SIZE="9126805504"

# ─── FBE / Metadata ───────────────────────────────────────────────────
export OF_FBE_METADATA_MOUNT_IGNORE="1"
export OF_IGNORE_LOGICAL_MOUNT_ERRORS="1"

# ─── Keymaster (Android 16 uses 4.1) ─────────────────────────────────
export OF_DEFAULT_KEYMASTER_VERSION="4.1"

# ─── vendor_boot Restrictions ────────────────────────────────────────
export OF_NO_REFLASH_CURRENT_ORANGEFOX="1"

# ─── Magiskboot (for kernel 6.12+) ────────────────────────────────────
export FOX_USE_UPDATED_MAGISKBOOT="1"

# ─── Quick Backup ────────────────────────────────────────────────────
export OF_QUICK_BACKUP_LIST="/data;/boot;/vendor_boot;"

# ─── Extra Binaries ──────────────────────────────────────────────────
export FOX_USE_TAR_BINARY="1"
export FOX_USE_SED_BINARY="1"
export FOX_USE_BASH_SHELL="1"
export FOX_ASH_IS_BASH="1"
export OF_ENABLE_LPTOOLS="1"

# ─── Misc ─────────────────────────────────────────────────────────────
export OF_NO_MIUI_OTA_VENDOR_BACKUP="1"
export FOX_ENABLE_APP_MANAGER="0"
export FOX_DELETE_AROMAFM="0"
export FOX_INSTALLER_DEBUG_MODE="0"

# ─── Build target notification ────────────────────────────────────────
echo "[OrangeFox R12] Environment loaded for spinel (vendor_boot A/B)"
echo "Run: lunch fox_spinel-eng && mka vendorbootimage"
