#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP/OrangeFox R12 Device Tree - Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/spinel

PRODUCT_USE_DYNAMIC_PARTITIONS := true
ENABLE_VIRTUAL_AB := true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES += \
    fastbootd

PRODUCT_PACKAGES += \
    snapuserd

# FIX: Missing MTK Boot Control HAL - required for A/B slot switching
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# FIX: Missing mtk_plpath_utils - required for preloader partition symlinks
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# FIX: Missing keymint packages - required for FBE decryption
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1 \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_SHIPPING_API_LEVEL := 32
PRODUCT_SOONG_NAMESPACES += device/xiaomi/spinel

PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.vendor_boot=true \
    ro.recovery.vendor_boot=1
$(call inherit-product, device/xiaomi/spinel/vendor_blobs/spinel-vendor.mk)

# Gatekeeper and VINTF Fixes

PRODUCT_PACKAGES += gatekeeperd
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false
