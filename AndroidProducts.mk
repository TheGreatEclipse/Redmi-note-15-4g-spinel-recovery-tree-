#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP Device Tree – Redmi Note 15 4G (spinel)
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_spinel.mk

# Use COMMON_LUNCH_CHOICES instead of deprecated add_lunch_combo (vendorsetup.sh)
COMMON_LUNCH_CHOICES := \
    twrp_spinel-user \
    twrp_spinel-userdebug \
    twrp_spinel-eng
