# Architecture

This document describes **webgkv/RufusMac** (Intel Mac fork). Behaviour matches
upstream RufusMac except where packaging / OS compatibility differ.

RufusMac is split into a UI-free engine and a thin SwiftUI app so risky logic
stays isolated and testable.

```
┌────────────────────────────────────────────────────────────┐
│  RufusMac (SwiftUI app, @main)                              │
│  • ContentView, DevicePicker, BootSelection, FormatOptions   │
│  • ConfirmationView (preview + dry-run gate), CatalogView    │
│  • AppModel (@Observable) orchestrates the lifecycle         │
│  • Liquid Glass on macOS 26+; material fallback on 14/15     │
└───────────────▲───────────────────────────┬─────────────────┘
                │ uses                       │ renders
┌───────────────┴───────────────────────────▼─────────────────┐
│  RufusMacKit (pure Swift, no UI — unit-tested)              │
│  Models:  USBDrive · BootImage · WriteConfig · DistroCatalog │
│  Engine:  DiskService ─ DiskParser (safety filter)           │
│           ImageInspector · BurnPlanner · PrivilegedRunner    │
│           ChecksumService · Downloader · ToolPaths · Shell   │
└───────────────┬──────────────────────────────────────────────┘
                │ shells out to
   diskutil · hdiutil · dd · shasum   (built-in, always present)
   wimlib-imagex · mke2fs · ventoy    (bundled via fetch_thirdparty.sh)
```

## Intel fork notes

- Packaging forces `--arch x86_64` (no Apple Silicon slice in the `.dmg`).
- Deployment target is **macOS 14.0**; build still needs the **macOS 26 SDK**.
- UI glass APIs are wrapped in `Sources/RufusMac/Theme/GlassCompatibility.swift`.

## Flow of a burn

1. **Enumerate** — `DiskService.listRemovableDrives()`; `DiskParser` drops non-external disks.
2. **Inspect** — `ImageInspector` classifies the ISO and detects oversized `install.wim`.
3. **Configure** — `WriteConfig.recommended(for:)` derives defaults.
4. **Plan** — `BurnPlanner.makePlan(...)` builds a `BurnPlan` (summary, warnings, steps).
5. **Confirm** — UI shows the plan; **Preview only** or **Erase & Write**.
6. **Execute** — `PrivilegedRunner` runs one admin-privileged script (or returns it in dry-run).

## Why shell-out?

macOS exposes no Swift API for raw partition/format/boot-sector work. The
auditable approach is to orchestrate CLI tools and show every command before it
runs.

## Testing

`Tests/RufusMacKitTests` covers `DiskParser` and internal-disk rejection.
`rmctl list` / `rmctl preview` are a manual harness.
