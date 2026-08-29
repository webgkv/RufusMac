# Contributing to RufusMac (Intel fork)

Thanks for your interest. This repository is a **best-effort Intel Mac fork** of
[h4rithd/RufusMac](https://github.com/h4rithd/RufusMac), licensed under GPLv3.

**Support and further porting are not guaranteed** — releases may lag or stop.
For large feature work that is not Intel-/compatibility-specific, prefer
contributing **upstream** when possible.

## Getting started

```bash
git clone https://github.com/webgkv/RufusMac.git
cd RufusMac
swift build -c release --arch x86_64   # needs macOS 26 SDK; targets macOS 14+
swift run rmctl list
scripts/make_dmg.sh                    # Intel-only .dmg
```

## Project layout

- `Sources/RufusMacKit` — pure-Swift engine (no UI)
- `Sources/RufusMac` — SwiftUI app (Liquid Glass on 26+, material fallback on 14/15)
- `Sources/rmctl` — CLI companion
- `Tests/RufusMacKitTests` — Swift Testing (`swift test --arch x86_64`)
- `scripts/` — build / package / third-party fetch

## Guidelines

- Keep packaging **x86_64-only** (`scripts/build_app.sh` refuses fat/arm64)
- Keep engine logic UI-free in `RufusMacKit`
- Destructive work must go through a previewable `BurnPlan` + `PrivilegedRunner`
- **Never** allow internal disks as write targets
- UI that needs Liquid Glass must go through `GlassCompatibility` helpers
- Run `scripts/scrub_secrets.sh` before opening a PR

## Commits & PRs

- Small, focused PRs
- Call out any change to the safety model or minimum OS / arch explicitly
- Do not assume maintainers will track upstream indefinitely
