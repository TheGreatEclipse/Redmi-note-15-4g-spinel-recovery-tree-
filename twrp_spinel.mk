#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP Device Tree - Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#
# TWRP Product Makefile - spinel (Redmi Note 15 4G)
#

# Inherit AOSP base
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit some common TWRP stuff - CRITICAL: registers twrp_spinel in lunch
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/spinel/device.mk)

# ─── Device Identifiers ───────────────────────────────────────────────
PRODUCT_DEVICE       := spinel
PRODUCT_NAME         := twrp_spinel
PRODUCT_BRAND        := Redmi
PRODUCT_MODEL        := Redmi Note 15 4G
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_RELEASE_NAME := spinel

# ─── TWRP Version ─────────────────────────────────────────────────────
TW_DEVICE_VERSION := spinel-mkpromvp-v1
