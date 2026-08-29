# Changelog

All notable changes to this **Intel Mac fork** ([webgkv/RufusMac](https://github.com/webgkv/RufusMac))
are documented here. Upstream history begins at **0.1.0**.

> **Best-effort fork.** Support and porting of newer upstream releases are
> **not guaranteed** — see README **Scope & maintenance**.

## [0.1.0-intel] — 2026-08-29

Intel Mac packaging release based on upstream **0.1.0**.

### Changed
- **Intel-only packaging** — `scripts/build_app.sh` / DMG force `--arch x86_64` and refuse fat/arm64 binaries.
- **macOS 14/15 support** — deployment floor **14.0**; Liquid Glass on 26+, `.ultraThinMaterial` UI fallback on 14/15. Building still requires the macOS 26 SDK.
- **Docs / branding** — README keeps full upstream feature docs, adapted for this Intel fork; footer credits Intel fork by webgkv. Fork work reworked with Cursor.
- **Release artifact** — `RufusMac-<version>-mac-intel-X64.dmg` (Buzz-style naming).

## [0.1.0] — 2026-06-15

First functional preview (upstream). Built with the help of Claude Code.

### Added
- **Liquid Glass UI** — native SwiftUI for macOS 26 (Tahoe).
- **Safe device detection** — external/physical/removable disks only.
- **Writer engines** — Single ISO / DD, Windows (+ Win11 bypass + WIM split), Reclaim, Multiboot *(experimental)*.
- Dry-run preview, ISO catalog, checksums, `rmctl` CLI, portable `.dmg` packaging.

### Known limitations
- Windows and Multiboot modes need bundled third-party tools (`scripts/fetch_thirdparty.sh`).
- Multiboot and persistence need real-hardware validation.
- The app is unsigned (right-click → Open on first launch).
