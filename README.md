# 🦊 OrangeFox CI — Xiaomi Spinel

GitHub Actions workflow that builds OrangeFox Recovery for the **Xiaomi Spinel** (Redmi Note 12 Pro+ / POCO X5 Pro) entirely in the cloud — no local machine needed.

---

## Repository layout

This repo uses **two branches** that serve different purposes:

| Branch | Purpose |
|--------|---------|
| `Builder` | Holds the workflow file (`.github/workflows/build.yml`) and the optional LDCheck tools (`tools/ldcheck`, `tools/libneeds`) |
| `Tree` | Holds the device tree (the `.mk` files, `BoardConfig.mk`, `Android.mk`, etc.) for spinel |

> The workflow checks out both branches on the runner at build time — you never need to merge them.

---

## First-time setup

### 1 — Fork / create the repo

Create a single GitHub repo. Push your device tree files to the `Tree` branch and the workflow + tools to the `Builder` branch.

```
your-repo/
├── (Builder branch)
│   ├── .github/
│   │   └── workflows/
│   │       └── build.yml   ← the workflow
│   └── tools/
│       ├── ldcheck         ← optional, only needed if you enable LDCheck
│       └── libneeds        ← optional, only needed if you enable LDCheck
│
└── (Tree branch)
    ├── Android.mk
    ├── AndroidProducts.mk
    ├── BoardConfig.mk
    ├── device.mk
    └── ...
```

### 2 — Add secrets (optional but recommended)

Go to **Settings → Secrets and variables → Actions → New repository secret** and add:

| Secret | What it is |
|--------|-----------|
| `TG_TOKEN` | Telegram bot token — get one from [@BotFather](https://t.me/BotFather) |
| `TG_CHAT_ID` | Your Telegram chat / channel ID |

If you skip these, the build will still work — Telegram notifications will just be silently skipped.

---

## Running a build

1. Go to your repo on GitHub → **Actions** tab.
2. Click **🦊 OrangeFox · Xiaomi Spinel** in the left sidebar.
3. Click **Run workflow** (top right).
4. Fill in the inputs:

| Input | Description | Example |
|-------|-------------|---------|
| **OrangeFox branch** | Which Android base to build against | `12.1 — Android 12L` |
| **Maintainer patch version** | Appended to the build version string | `1` |
| **Bundle latest Magisk?** | Downloads and bundles the latest Magisk zip into the recovery | `true` / `false` |
| **Run LDCheck?** | Checks for missing shared library dependencies after the build | `false` |
| **LDCheck blob path** | The binary to check (only matters if LDCheck is enabled) | `system/bin/qseecomd` |
| **Extra exports** | Shell exports injected before `lunch` — for advanced overrides | `export FOX_USE_NANO_EDITOR=1` |

5. Click the green **Run workflow** button.

---

## What happens during the build

```
Checkout Builder branch (ci/)
        ↓
Parse branch input → set env vars
        ↓
Free up disk space + add 12 GB swap
        ↓
Install Android build dependencies
        ↓
Restore ccache (speeds up repeat builds)
        ↓
Sync OrangeFox sources via orangefox_sync.sh
        ↓
(14.1 only) Ensure Guava dependency
        ↓
Clone device tree from Tree branch → device/xiaomi/spinel/
        ↓
(optional) Download latest Magisk
        ↓
lunch → make clean → mka adbd vendorbootimage
        ↓
Check for OrangeFox*.img and OrangeFox*.zip
        ↓
Upload to GitHub Release
        ↓
Mirror zip to oshi.at
        ↓
(optional) Run LDCheck
        ↓
Telegram notification (success or failure)
```

---

## Build outputs

A successful build creates a **GitHub Release** tagged with the run ID, containing:

| File | Description |
|------|-------------|
| `OrangeFox-*.img` | Flashable vendor_boot image (flash via fastboot) |
| `OrangeFox-*.zip` | Flashable zip (sideload via a working recovery) |
| `OrangeFox-*.img.tar` | Tar-wrapped image for Odin / SP Flash Tool |
| `ramdisk-recovery.*` | Raw ramdisk artifact |

The zip is also mirrored to **oshi.at** and the direct link is sent via Telegram.

---

## Flashing

### Via fastboot (clean flash)
```bash
fastboot flash vendor_boot OrangeFox-*.img
fastboot reboot recovery
```

### Via sideload (from an existing recovery)
```
adb sideload OrangeFox-*.zip
```

---

## LDCheck (advanced)

LDCheck scans a target binary inside the built recovery root and lists any shared libraries it needs that aren't present — useful for catching broken vendor blobs before you flash.

To use it:
1. Place `ldcheck` and `libneeds` in the `tools/` folder of the `Builder` branch.
2. Enable **Run LDCheck** when triggering the workflow.
3. Set **LDCheck blob path** to the binary you want to check (relative to the recovery root), e.g. `system/bin/qseecomd`.

Results are printed in the **Run LDCheck** step log. The step is set to `continue-on-error` so a failed check won't fail the whole build.

---

## ccache

Build times for repeat runs are significantly faster thanks to ccache (capped at 50 GB). The cache is keyed per branch — switching between `12.1` and `14.1` uses separate caches.

| Run type | Approximate time |
|----------|-----------------|
| First build (cold cache) | ~3–4 hours |
| Subsequent builds (warm cache) | ~1–2 hours |

---

## Troubleshooting

**Build fails at `lunch`**
Check that your `BoardConfig.mk` and `device.mk` have correct `PRODUCT_DEVICE` and `PRODUCT_BRAND` values — the workflow parses these to locate the tree.

**No `.img` or `.zip` in outputs**
The build compiled but OrangeFox post-processing didn't run. Check the `mka` log for errors around `vendorbootimage`.

**Telegram not sending**
Confirm `TG_TOKEN` and `TG_CHAT_ID` secrets are set correctly. The bot must have permission to post in the target chat.

**14.1 build fails with Guava error**
The workflow auto-clones a Guava fallback, but if the AOSP mirror is slow the step may time out. Re-run the workflow — it will retry.
