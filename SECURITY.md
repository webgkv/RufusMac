# Security & Safety

## The safety model

RufusMac deals with raw disk writes, so safety is a first-class concern:

1. **Internal disks are never targets.** `DiskService` / `DiskParser` surface only external, physical, removable disks. Covered by unit tests (`internalDriveRejected`).
2. **Everything is previewable.** Before any destructive action you see the exact command pipeline and acknowledged warnings.
3. **Dry-run option.** “Preview only” executes nothing.
4. **One privileged prompt.** Destructive work runs as a single auditable script via macOS administrator privileges.

## Reporting a vulnerability

- **This Intel fork:** open a private report via GitHub Security Advisories on [webgkv/RufusMac](https://github.com/webgkv/RufusMac), or contact the fork maintainer.
- **Upstream / original author:** [h4rithd.com](https://h4rithd.com)

Include steps to reproduce and the affected version / release tag.

## Scope notes

- Published builds are **unsigned**; verify the `.dmg` SHA-256 published with each release.
- The Windows 11 bypass intentionally disables setup checks — only use it on hardware you own.
- Runtime floor for this fork is **macOS 14**; binaries are **x86_64 only**.
