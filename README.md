<div align="center">

<img src="docs/icon.png" width="128" alt="RufusMac icon" />

# RufusMac (Intel Mac fork)

### The Rufus-style bootable USB creator for macOS — Liquid Glass on 26+, material UI on 14/15.

**Create bootable Windows, Linux, and other USB installers from your Mac.** Single-ISO writing, Ventoy-style multiboot, Linux persistence, automatic checksum verification, and a built-in Windows 11 TPM / Secure Boot / online-account bypass — wrapped in Apple's native Liquid Glass design (with a fallback UI on older macOS).

[![Upstream](https://img.shields.io/badge/upstream-h4rithd%2FRufusMac-blue)](https://github.com/h4rithd/RufusMac)
![Platform](https://img.shields.io/badge/platform-macOS%2014%2B%20Intel-black?logo=apple)
![Arch](https://img.shields.io/badge/arch-x86__64%20only-lightgrey)
![Swift](https://img.shields.io/badge/Swift-6-orange?logo=swift)
![UI](https://img.shields.io/badge/SwiftUI-Liquid%20Glass%20%2B%20fallback-1aa3a3)
![License](https://img.shields.io/badge/license-GPLv3-blue)
![Made with Claude Code](https://img.shields.io/badge/built%20with-Claude%20Code-8A2BE2)
![Reworked with Cursor](https://img.shields.io/badge/Intel%20fork%20reworked%20with-Cursor-000000)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/webgkv/RufusMac)

_A single-window, native app — mode switcher, live USB detection, drag-and-drop ISO, and a one-tap **START**. Grab the Intel `.dmg` from [this fork’s Releases](https://github.com/webgkv/RufusMac/releases)._

</div>

> **Why?** [Rufus](https://rufus.ie) is the gold standard for making bootable USBs — but it's **Windows-only**. On macOS you're stuck juggling `balenaEtcher` (Linux only), `WinDiskWriter` (Windows only), and `Ventoy` (Terminal-heavy). And almost every Mac tool **struggles with Windows 11 installers**. RufusMac brings it all together in one beautiful, native app.

> 🤖 **Upstream RufusMac was designed and built with the help of [Claude Code](https://claude.com/claude-code).**  
> ⌨️ **This Intel Mac fork** (x86_64 packaging, macOS 14/15 fallback UI, docs & releases) was **reworked with [Cursor](https://cursor.com).**

Fork of [h4rithd/RufusMac](https://github.com/h4rithd/RufusMac) — same app, **RufusMac**.

**Goal:** keep RufusMac working on **Intel (x86_64) Macs**, support **macOS 14 / 15** (Liquid Glass on 26+), and ship a ready-to-run **`.dmg`** on [Releases](https://github.com/webgkv/RufusMac/releases). Upstream targets Apple Silicon and macOS 26 (Tahoe); most remaining Intel Macs stayed on Sequoia / Sonoma.

---

## Download

| Platform | Get it from |
|---|---|
| **Intel Mac** | **[This fork’s Releases](https://github.com/webgkv/RufusMac/releases)** (`.dmg`) |
| Apple Silicon | [Upstream RufusMac](https://github.com/h4rithd/RufusMac) |

## Scope & maintenance

This is a **best-effort** Intel Mac packaging / compatibility fork. **Support is
not guaranteed.** Tracking upstream and porting newer RufusMac versions is
**not guaranteed** — releases may lag or stop when the macOS / Swift toolchain
for Intel changes, when upstream diverges too far, or when time runs out.
Prefer [upstream RufusMac](https://github.com/h4rithd/RufusMac) if you are on
**Apple Silicon**.

### What this fork changes
- Builds and packages **x86_64 only** (no Apple Silicon slice in the DMG)
- Deployment floor **macOS 14** — Liquid Glass on **26+**, material UI fallback on **14/15**
- Docs, footer credit, and release naming adapted for this fork (reworked with Cursor)

---

## ✨ Features

### Everything you expect (Rufus parity)
- 🔌 **Smart device detection** — external/removable USB drives only; your internal disk is *never* listed.
- 💿 **Write any image** — ISO / IMG / DMG, Windows or Linux, auto-detected.
- 🧩 **Partition scheme** — MBR or GPT.
- 🖥️ **Target system** — UEFI or BIOS/UEFI.
- 🗂️ **File systems** — FAT32 / exFAT / NTFS.
- 🏷️ **Volume label**, quick format, and advanced options.
- 🔁 **Auto-defaults** — RufusMac picks sensible settings from the ISO you choose.

### Things people actually want (and most Mac tools lack)
- 🪟 **Windows 11 bypass, built in** — skip the **TPM 2.0, Secure Boot, RAM/CPU** checks *and* the **online-account** requirement, automatically.
- 🧱 **Large `install.wim` handling** — auto-splits `install.wim` > 4 GB into `.swm` so Windows boots from FAT32 (no NTFS gymnastics).
- 🗃️ **Ventoy-style Multiboot** *(experimental)* — set up the drive once, then **drag many ISOs** onto it and boot any one from a menu.
- 💾 **Linux persistence** — keep your changes between live-USB sessions.
- ✅ **Automatic checksum verification** — verify the image before writing and the drive after (SHA-256).
- 📚 **Built-in ISO catalog** — jump straight to official downloads for Ubuntu, Fedora, Debian, Mint, Arch, Kali, Tails, Windows, and more.
- ♻️ **Reclaim drive** — one click to turn a bootable USB back into a normal, usable disk.
- 🖱️ **Drag-and-drop** ISO selection.
- 🛡️ **Safety first** — every destructive action shows a full command preview and requires explicit confirmation. A **dry-run "Preview only"** mode runs nothing.
- 🧰 **`rmctl` CLI** — list drives, preview command pipelines, browse the catalog, and verify checksums from the terminal.
- 🎨 **Native UI** — Liquid Glass on macOS 26 (Tahoe); material fallback on macOS 14/15. Adaptive light/dark, **Intel (x86_64) only** in this fork’s DMG.

## 🆚 How it compares

| | **RufusMac** | Rufus | balenaEtcher | Ventoy | WinDiskWriter |
|---|:--:|:--:|:--:|:--:|:--:|
| Runs on macOS | ✅ | ❌ | ✅ | ⚠️ CLI | ✅ |
| Native Liquid Glass UI | ✅ (26+) | — | ❌ | ❌ | ❌ |
| UI fallback (macOS 14/15) | ✅ *this fork* | — | — | — | — |
| Windows ISO → USB | ✅ | ✅ | ⚠️ | ✅ | ✅ |
| Linux ISO → USB | ✅ | ✅ | ✅ | ✅ | ❌ |
| Windows 11 TPM/Secure Boot bypass | ✅ | ✅ | ❌ | ✅ | ⚠️ |
| Multiboot (many ISOs) | ⚗️ exp. | ❌ | ❌ | ✅ | ❌ |
| Linux persistence | ✅ | ✅ | ❌ | ✅ | ❌ |
| Checksum verification | ✅ | ✅ | ✅ | ✅ | ❌ |
| Command preview / dry-run | ✅ | ❌ | ❌ | ❌ | ❌ |
| Built-in ISO catalog | ✅ | ⚠️ | ❌ | ❌ | ❌ |
| CLI companion | ✅ | ❌ | ✅ | ✅ | ❌ |
| Open source | ✅ GPLv3 | ✅ | ✅ | ✅ | ✅ |

## 📦 Install

1. Download **`RufusMac-<version>-mac-intel-X64.dmg`** from [this fork’s Releases](https://github.com/webgkv/RufusMac/releases).
2. Open it and drag **RufusMac** to Applications.
3. First launch: **right-click → Open** (the app is unsigned open-source software, so Gatekeeper asks once).

Verify your download: `shasum -a 256 RufusMac-*-mac-intel-X64.dmg` and compare with the published `.sha256`.

> Requires **macOS 14 (Sonoma) or later** on an **Intel (x86_64)** Mac. Liquid Glass appears on macOS 26+; 14/15 use a material fallback. This fork does **not** ship an Apple Silicon slice — use [upstream](https://github.com/h4rithd/RufusMac) for Silicon.

## 🚀 Usage

1. **Plug in a USB drive** and pick it under **Device**.
2. Choose a mode: **Single ISO**, **Multiboot**, **DD Image**, or **Reclaim**.
3. **Drag in an ISO** (or click *Browse catalog* to download one).
4. Tweak options if you like — RufusMac pre-fills sensible defaults.
5. Press **START**, review the plan + warnings, then **Preview only** (safe dry-run) or **Erase & Write**.

### `rmctl` — the CLI companion
```bash
rmctl list                  # show external/removable drives (read-only)
rmctl preview windows X.iso # dry-run the exact command pipeline (nothing runs)
rmctl catalog               # browse the bundled ISO catalog
rmctl verify file.iso <sha256>
```

## 🛠️ Build from source

Building needs a toolchain with the **macOS 26 SDK** (Liquid Glass symbols). The produced app runs on **macOS 14+**.

```bash
git clone https://github.com/webgkv/RufusMac.git
cd RufusMac
swift build -c release --arch x86_64   # Intel-only; Command Line Tools / Xcode with macOS 26 SDK
scripts/make_dmg.sh                    # → dist/RufusMac-<version>-mac-intel-X64.dmg
scripts/fetch_thirdparty.sh            # (optional) bundle wimlib/ventoy/e2fsprogs for Windows + Multiboot
```
Run the tests (requires Xcode for the Swift Testing framework):
```bash
swift test --arch x86_64
```

## 🔒 Safety

RufusMac is built to **never touch your internal disk**:
- Only **external, physical, removable** disks are ever listed (verified against `diskutil`).
- Every write shows the **exact commands** and a red, explicit confirmation.
- A **dry-run** mode prints the plan without executing anything.
- All privileged work runs through a **single** macOS administrator prompt.

Writing to a USB **erases everything on it** — double-check the device you select.

## 🧠 How it works

A clean two-layer design: a pure-Swift engine (`RufusMacKit`) handles disk enumeration, image inspection, and command planning; the SwiftUI app renders Liquid Glass on macOS 26+ and a material fallback on 14/15. Destructive work is assembled into one auditable shell pipeline using `diskutil` / `hdiutil` / `dd` plus bundled `wimlib-imagex` / `mke2fs` / Ventoy. See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## 🗺️ Roadmap

- ✅ Liquid Glass UI, live device detection, dd/Linux writer, Windows writer + Win11 bypass, reclaim, ISO catalog, checksum verify, dry-run preview, `rmctl` CLI, portable `.dmg`.
- ✅ **This fork:** Intel (x86_64) packaging, macOS 14/15 UI fallback, fork docs & Intel releases (reworked with Cursor).
- ⚗️ **Experimental:** Ventoy-style multiboot, Linux persistence (need real-hardware validation).
- 🔜 In-app downloader with live progress, real-time write progress bar, presets & recents, signing + notarization, localization.

> **Status:** functional preview (`v0.1`). Linux and Reclaim use only built-in macOS tools; Windows/Multiboot need the bundled third-party tools (`scripts/fetch_thirdparty.sh`). Real bootable-media testing on target hardware is recommended before relying on it.

## 🙌 Credits & acknowledgements

- **[Rufus](https://rufus.ie)** by Pete Batard — the inspiration and the gold standard.
- **[Ventoy](https://www.ventoy.net)** — the multiboot engine concept.
- **[wimlib](https://wimlib.net)** — WIM splitting.
- Upstream RufusMac built with the help of **[Claude Code](https://claude.com/claude-code)**.
- **Intel Mac fork** (packaging, 14/15 fallback, docs, releases) reworked with **[Cursor](https://cursor.com)**.

## Upstream

- **Original repository:** [https://github.com/h4rithd/RufusMac](https://github.com/h4rithd/RufusMac)
- Original author: [Harith Dilshan](https://h4rithd.com)
- We may merge upstream when practical; continuous tracking and ongoing support are **not promised** (see **Scope & maintenance**)

## 📄 License

[GPLv3](LICENSE) © **Harith Dilshan** — consistent with the Rufus/Ventoy open-source lineage. This fork remains GPLv3.

---

<div align="center">

**Developed by [Harith Dilshan](https://h4rithd.com) · [h4rithd.com](https://h4rithd.com)**  
**Intel fork by [webgkv](https://github.com/webgkv/RufusMac)** · reworked with [Cursor](https://cursor.com)

</div>
