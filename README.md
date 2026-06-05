# TWRP Device Tree – Redmi Note 15 4G (spinel)

## Device Specifications

| Feature | Specification |
|---------|--------------|
| Codename | spinel |
| Platform | MediaTek MT6789 (Helio G100 Ultra) |
| Brand | Redmi |
| Model | Redmi Note 15 4G |
| Architecture | arm64-v8a |
| Screen Density | 450 DPI |
| Android Version | 16 (API 36) |
| Build | OS3.0.301.0.WPGMIXM |
| Kernel | 6.12.30 |
| A/B Device | Yes |
| Recovery Partition | vendor_boot |

## Recovery Features
- ✅ A/B (Treble) fully supported
- ✅ Recovery inside vendor_boot partition
- ✅ FBE (File Based Encryption) support
- ✅ Metadata decrypt support
- ✅ Snapuserd (Virtual A/B + EROFS)
- ✅ DTB from stock OS3.0.301.0.WPGMIXM
- ✅ AVB 2.0 support

## Build Instructions
```bash
source build/envsetup.sh
lunch twrp_spinel-eng
mka vendorbootimage
```

## Source Dump
Based on: [Stock ROM Dump](https://github.com/mkpromvp/Stock-rom-dumber/tree/dump-redmi-spinel-os3.0.301.0.wpgmixm)

---
*Maintained by mkpromvp*
