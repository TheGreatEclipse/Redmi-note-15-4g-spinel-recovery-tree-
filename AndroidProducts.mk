#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP/OrangeFox R12 Device Tree - Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_spinel.mk \
    $(LOCAL_DIR)/fox_spinel.mk

# COMMON_LUNCH_CHOICES registers products in lunch (replaces deprecated vendorsetup.sh)
COMMON_LUNCH_CHOICES := \
    twrp_spinel-eng \
    twrp_spinel-userdebug \
    fox_spinel-eng \
    fox_spinel-userdebug
