#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP/OrangeFox R12 Device Tree - Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/spinel

ALLOW_MISSING_DEPENDENCIES := true

AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    odm_dlkm \
    product \
    vbmeta_vendor \
    vendor_dlkm \
    system_ext \
    vendor \
    system \
    boot \
    vendor_boot \
    vbmeta_system

BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT    := true
BOARD_USES_RECOVERY_AS_BOOT                     := false
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT   := true
TARGET_NO_RECOVERY                              := true
BOARD_USES_GENERIC_KERNEL_IMAGE                 := true

TARGET_ARCH               := arm64
TARGET_ARCH_VARIANT       := armv8-2a
TARGET_CPU_ABI            := arm64-v8a
TARGET_CPU_ABI2           :=
TARGET_CPU_VARIANT        := cortex-a76
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH               := arm
TARGET_2ND_ARCH_VARIANT       := armv8-2a
TARGET_2ND_CPU_ABI            := armeabi-v7a
TARGET_2ND_CPU_ABI2           := armeabi
TARGET_2ND_CPU_VARIANT        := cortex-a55
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_SUPPORTS_64_BIT_APPS := false
TARGET_SUPPORTS_64_BIT_APPS := false

OVERRIDE_TARGET_FLATTEN_APEX := true
TARGET_BOOTLOADER_BOARD_NAME := spinel
TARGET_NO_BOOTLOADER         := true
TARGET_SCREEN_DENSITY := 450

# Kernel / vendor_boot header v4 - GKI 6.12.30
BOARD_BOOTIMG_HEADER_VERSION  := 4
BOARD_KERNEL_BASE             := 0x3fff8000
BOARD_KERNEL_PAGESIZE         := 4096
# FIX: BOARD_KERNEL_OFFSET was missing - required for mkbootimg header v4
BOARD_KERNEL_OFFSET           := 0x00008000
BOARD_RAMDISK_OFFSET          := 0x26f08000
BOARD_KERNEL_TAGS_OFFSET      := 0x07c88000
BOARD_DTB_OFFSET              := 0x07c88000
BOARD_KERNEL_IMAGE_NAME       := Image
BOARD_RAMDISK_USE_LZ4         := true

BOARD_KERNEL_CMDLINE          := bootopt=64S3,32N2,64N2
BOARD_VENDOR_CMDLINE          := bootopt=64S3,32N2,64N2

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset    $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize       $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --board          ""
# FIX: Added --kernel_offset (required for mkbootimg v4)
BOARD_MKBOOTIMG_ARGS += --kernel_offset  $(BOARD_KERNEL_OFFSET)

TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb        $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# FIX: Use TARGET_NO_KERNEL (correct GKI flag) instead of empty TARGET_FORCE_PREBUILT_KERNEL
TARGET_NO_KERNEL              := true
BOARD_INCLUDE_DTB_IN_BOOTIMG  :=
BOARD_KERNEL_SEPARATED_DTBO   :=
BOARD_PREBUILT_DTBOIMAGE       :=

BOARD_FLASH_BLOCK_SIZE                := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE        := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE          := 8388608
BOARD_HAS_LARGE_FILESYSTEM            := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE      := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE  := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE    := erofs
TARGET_COPY_OUT_VENDOR                := vendor

BOARD_SUPER_PARTITION_SIZE   := 9126805504
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system system_ext vendor product mi_ext vendor_dlkm odm_dlkm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

TARGET_BOARD_PLATFORM := mt6789

TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4   := true
TARGET_USERIMAGES_USE_F2FS   := true
TARGET_RECOVERY_FSTAB        := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

BOARD_AVB_ENABLE                              := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS            += --flags 3
BOARD_AVB_VENDOR_BOOT_KEY_PATH               := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VENDOR_BOOT_ALGORITHM              := SHA256_RSA4096
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX         := 1
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 1

PLATFORM_SECURITY_PATCH      := 2099-12-31
VENDOR_SECURITY_PATCH        := 2099-12-31
BOOT_SECURITY_PATCH          := 2099-12-31
PLATFORM_VERSION             := 16.0.0
PLATFORM_VERSION_LAST_STABLE := 16

TW_THEME                    := portrait_hdpi
TW_EXTRA_LANGUAGES          := true
TW_SCREEN_BLANK_ON_BOOT     := true
TW_INPUT_BLACKLIST          := "hbtp_vm"
TW_USE_TOOLBOX              := true
TW_INCLUDE_REPACKTOOLS      := true
TW_INCLUDE_RESETPROP        := true
TW_INCLUDE_LPTOOLS          := true
TW_INCLUDE_FASTBOOTD        := true
TW_INCLUDE_FB2PNG           := true
TW_INCLUDE_NTFS_3G          := true
TW_LOAD_VENDOR_BOOT_MODULES := true
TW_FRAMERATE                := 60
TARGET_USES_MKE2FS          := true
TW_EXCLUDE_APEX             := true
TW_EXCLUDE_LPDUMP           := false
TW_DEVICE_VERSION           := spinel-mkpromvp-v1

TW_BRIGHTNESS_PATH          := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS           := 2047
TW_DEFAULT_BRIGHTNESS       := 1200

TW_INCLUDE_CRYPTO            := true
TW_INCLUDE_CRYPTO_FBE        := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY        := 2
# FIX: TW_FORCE_KEYMASTER_VER must be numeric (4), not "true"
TW_FORCE_KEYMASTER_VER       := 4

BOARD_USES_METADATA_PARTITION := true
TW_ENABLE_SNAPUSERD := true

FOX_BUILD_DEVICE        := spinel
FOX_AB_DEVICE           := 1
FOX_VIRTUAL_AB_DEVICE   := 1
FOX_VENDOR_BOOT_RECOVERY := 1

TARGET_USES_LOGD    := true
TWRP_INCLUDE_LOGCAT := true
