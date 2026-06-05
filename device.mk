#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP/OrangeFox R12 Device Tree – Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/spinel

# ─── A/B OTA Config ─────────────────────────────────────────────────
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

# ─── Boot Control HAL (MTK Android 14+/16) ──────────────────────────
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES += \
    bootctrl.mt6789 \
    libgptutils \
    libz \
    libcutils

# ─── OTA / Update Engine ────────────────────────────────────────────
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    checkpoint_gc \
    update_engine \
    update_verifier \
    update_engine_sideload

# ─── Fastbootd ──────────────────────────────────────────────────────
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# ─── Health HAL ─────────────────────────────────────────────────────
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# ─── Keymaster / KeyMint (FBE decryption) ───────────────────────────
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1 \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret

# ─── MTK Preloader Path Utils ───────────────────────────────────────
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# ─── Snapuserd (EROFS + Virtual A/B OTA) ────────────────────────────
PRODUCT_PACKAGES += \
    snapuserd

# ─── Additional crypto relink ────────────────────────────────────────
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1

# ─── Dynamic Partitions ──────────────────────────────────────────────
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# ─── Virtual A/B ─────────────────────────────────────────────────────
ENABLE_VIRTUAL_AB := true

# ─── Shipping API Level (Android 16 = API 36) ────────────────────────
PRODUCT_SHIPPING_API_LEVEL := 36

# ─── Soong Namespaces ────────────────────────────────────────────────
PRODUCT_SOONG_NAMESPACES += device/xiaomi/spinel

# ─── Properties ──────────────────────────────────────────────────────
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.vendor_boot=true \
    ro.recovery.vendor_boot=1
