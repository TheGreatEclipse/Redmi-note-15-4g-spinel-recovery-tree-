# TWRP / OrangeFox R12 Device Tree – Redmi Note 15 4G (spinel)

## Device Specifications

| Feature            | Specification                      |
| ------------------ | ---------------------------------- |
| Codename           | spinel                             |
| Platform           | MediaTek MT6789 (Helio G100 Ultra) |
| Brand              | Redmi                              |
| Model              | Redmi Note 15 4G                   |
| Architecture       | arm64-v8a                          |
| Screen Density     | 450 DPI                            |
| Screen Resolution  | 1080 × 2400 FHD+ (6.72")          |
| Android Version    | 16 (API 36)                        |
| Build              | OS3.0.301.0.WPGMIXM                |
| Kernel             | 6.12.30 GKI                        |
| A/B Device         | Yes (Virtual A/B)                  |
| Recovery Partition | vendor\_boot (header v4)           |

## Recovery Features

* ✅ A/B (Treble) fully supported
* ✅ Recovery inside vendor\_boot partition (header v4)
* ✅ FBE (File Based Encryption) support – fscrypt policy 2
* ✅ Metadata decrypt support
* ✅ Snapuserd (Virtual A/B + EROFS)
* ✅ DTB from stock OS3.0.301.0.WPGMIXM
* ✅ AVB 2.0 support
* ✅ OrangeFox R12 build support
* ✅ TWRP Latest (twrp-14.1 manifest) support

## Build Instructions – OrangeFox R12

```bash
# 1. Set up OrangeFox R12 manifest
repo init -u https://gitlab.com/OrangeFox/sync.git -b fox_12.1
repo sync -c --no-tags --no-clone-bundle --optimized-fetch --prune -j$(nproc)

# 2. Clone device tree
git clone https://github.com/mkpromvp/Redmi-note-15-4g-spinel-recovery-tree- device/xiaomi/spinel

# 3. Build
source build/envsetup.sh
lunch fox_spinel-eng
mka vendorbootimage -j$(nproc)
```

## Build Instructions – TWRP Latest

```bash
# 1. Set up TWRP AOSP manifest
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-14.1
repo sync -c --no-tags --no-clone-bundle --optimized-fetch --prune -j$(nproc)

# 2. Clone device tree
git clone https://github.com/mkpromvp/Redmi-note-15-4g-spinel-recovery-tree- device/xiaomi/spinel

# 3. Build
source build/envsetup.sh
lunch twrp_spinel-eng
mka vendorbootimage -j$(nproc)
```

## Flash Instructions

```bash
adb reboot bootloader
fastboot flash vendor_boot out/target/product/spinel/vendor_boot.img
fastboot reboot recovery
```

## Source Dump

Based on: [Stock ROM Dump](https://github.com/mkpromvp/Stock-rom-dumber/tree/dump-redmi-spinel-os3.0.301.0.wpgmixm)

---

_Maintained by mkpromvp_
