#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP Device Tree – Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Enable Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# GSI keys for verified boot
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from device tree
$(call inherit-product, device/xiaomi/spinel/device.mk)

# Device identifiers
PRODUCT_DEVICE := spinel
PRODUCT_NAME := twrp_spinel
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 15 4G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
