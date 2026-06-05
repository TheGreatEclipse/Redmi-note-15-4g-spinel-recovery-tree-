#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP/OrangeFox R12 Device Tree – Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/spinel

# ─── Dynamic Partitions ──────────────────────────────────────────────
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# ─── Virtual A/B ─────────────────────────────────────────────────────
ENABLE_VIRTUAL_AB := true

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

# ─── OTA / Update Engine (required for A/B) ─────────────────────────
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    update_engine_sideload

# ─── Fastbootd ──────────────────────────────────────────────────────
PRODUCT_PACKAGES += \
    fastbootd

# ─── Snapuserd (EROFS + Virtual A/B OTA) ────────────────────────────
PRODUCT_PACKAGES += \
    snapuserd

# ─── Shipping API Level (Android 16 = API 36) ────────────────────────
PRODUCT_SHIPPING_API_LEVEL := 36

# ─── Soong Namespaces ────────────────────────────────────────────────
PRODUCT_SOONG_NAMESPACES += device/xiaomi/spinel

# ─── Properties ──────────────────────────────────────────────────────
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.vendor_boot=true \
    ro.recovery.vendor_boot=1
