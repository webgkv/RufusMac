# Contributing to RufusMac

Thanks for your interest! RufusMac is open source under GPLv3.

## Getting started
```bash
git clone git@github.com:h4rithd/RufusMac.git
cd RufusMac
swift build            # builds with Command Line Tools (no full Xcode needed)
swift run rmctl list   # try the CLI
```

## Project layout
- `Sources/RufusMacKit` — pure-Swift engine (no UI). Add disk/image/writer logic here.
- `Sources/RufusMac` — SwiftUI app (Liquid Glass). UI only.
- `Sources/rmctl` — command-line companion.
- `Tests/RufusMacKitTests` — Swift Testing suite (run with `swift test`; needs Xcode).
- `scripts/` — build, packaging, icon, and safety scripts.

## Guidelines
- Keep engine logic **UI-free and testable** in `RufusMacKit`.
- Anything destructive must produce a previewable `BurnPlan` and go through `PrivilegedRunner`.
- **Never** allow internal disks to become write targets — preserve `DiskParser`'s safety filter and its tests.
- Match the existing Swift style; document non-obvious behavior.
- Run `scripts/scrub_secrets.sh` before opening a PR.

## Commits & PRs
- Small, focused PRs with a clear description.
- Note any change that affects the safety model explicitly.
