#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP Device Tree - Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, device/xiaomi/spinel/device.mk)

PRODUCT_DEVICE       := spinel
PRODUCT_NAME         := twrp_spinel
PRODUCT_BRAND        := Redmi
PRODUCT_MODEL        := Redmi Note 15 4G
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_RELEASE_NAME := spinel

TW_DEVICE_VERSION := spinel-mkpromvp-v1
