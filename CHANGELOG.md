# Changelog

All notable changes to RufusMac are documented here.
This project adheres to [Semantic Versioning](https://semver.org).

## [0.1.0] — 2026-06-15

First functional preview. Built with the help of Claude Code.

### Added
- **Liquid Glass UI** — native SwiftUI for macOS 26 (Tahoe): mode switcher, device picker, drag-and-drop boot selection, contextual options, confirmation sheet, and persistent footer.
- **Safe device detection** — `DiskService` lists only external/physical/removable disks; internal disks are never shown (covered by unit tests).
- **Writer engines** — `BurnPlanner` generates auditable command pipelines for:
  - **Single ISO / DD** — raw `dd` write for Linux and hybrid images, with optional SHA-256 verify.
  - **Windows** — FAT32 + file copy, automatic `install.wim` → `.swm` split, and a **Windows 11 bypass** (TPM / Secure Boot / RAM / CPU + local-account `BypassNRO`).
  - **Reclaim** — restore a USB to a normal, usable volume.
  - **Multiboot (experimental)** — Ventoy-style layout, plus optional Linux persistence.
- **Dry-run "Preview only"** mode and a full command preview before any destructive action.
- **ISO catalog** — curated, browsable list of popular distributions and Windows.
- **Checksum service** — SHA-256/512 verification.
- **`rmctl` CLI** — `list`, `preview`, `catalog`, `verify`.
- **Packaging** — `build_app.sh`, `make_dmg.sh` (portable `.dmg` + checksum), `make_icon.sh`, `fetch_thirdparty.sh`, `scrub_secrets.sh`.

### Known limitations
- Windows and Multiboot modes require the bundled third-party tools (`scripts/fetch_thirdparty.sh`).
- Multiboot and persistence are experimental and need real-hardware validation.
- The app is unsigned (right-click → Open on first launch).
- Real-time write progress and the in-app downloader are planned.
