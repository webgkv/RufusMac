#!/usr/bin/env bash
set -euo pipefail

# make_dmg.sh — build RufusMac.app and package a portable Intel-only .dmg
# with a drag-to-Applications layout, plus a published SHA-256.
# Uses only built-in tools (hdiutil); no third-party installers required.
#
# Output name (Buzz-style): RufusMac-<version>-mac-intel-X64.dmg
# Also writes dist/RufusMac.dmg as a stable local alias.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

"$ROOT/scripts/build_app.sh" release

VERSION="$(cat "$ROOT/VERSION" 2>/dev/null || echo 0.1.0)"
APP="$ROOT/dist/RufusMac.app"
DMG_NAME="RufusMac-${VERSION}-mac-intel-X64.dmg"
DMG="$ROOT/dist/$DMG_NAME"
DMG_ALIAS="$ROOT/dist/RufusMac.dmg"
STAGING="$ROOT/build/dmg"

echo "▶ Staging DMG contents…"
rm -rf "$STAGING"
mkdir -p "$STAGING"
cp -R "$APP" "$STAGING/"
ln -s /Applications "$STAGING/Applications"

echo "▶ Creating $DMG …"
rm -f "$DMG" "$DMG_ALIAS" "$ROOT/dist/"*.sha256
hdiutil create -volname "RufusMac" -srcfolder "$STAGING" -ov -format UDZO "$DMG" >/dev/null
ln -sf "$DMG_NAME" "$DMG_ALIAS"

echo "▶ Checksum:"
( cd "$ROOT/dist" && shasum -a 256 "$DMG_NAME" | tee "${DMG_NAME}.sha256" )

echo "✅ Portable disk image ready: $DMG"
