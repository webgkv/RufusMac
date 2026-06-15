# Security & Safety

## The safety model
RufusMac deals with raw disk writes, so safety is a first-class concern:

1. **Internal disks are never targets.** `DiskService`/`DiskParser` surface only external, physical, removable disks. This is enforced in code and covered by unit tests (`internalDriveRejected`).
2. **Everything is previewable.** Before any destructive action you see the exact command pipeline and explicit, acknowledged warnings.
3. **Dry-run by default option.** "Preview only" executes nothing.
4. **One privileged prompt.** Destructive work runs as a single auditable script via macOS Authorization Services.

## Reporting a vulnerability
Please report security issues privately to the maintainer via [h4rithd.com](https://h4rithd.com) rather than opening a public issue. Include steps to reproduce and the affected version.

## Scope notes
- The app is currently **unsigned**; verify the `.dmg` SHA-256 published with each release.
- The Windows 11 bypass intentionally disables setup checks — only use it on hardware you own and understand the implications (Secure Boot may need to be configured on the target).
