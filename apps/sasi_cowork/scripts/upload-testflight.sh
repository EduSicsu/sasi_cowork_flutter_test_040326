#!/usr/bin/env bash
# Upload SASI Cowork IPA to TestFlight via command line.
#
# Prerequisites:
#   - flutter build ipa (run from apps/sasi_cowork)
#   - Apple ID with App Store Connect access
#   - App-specific password (Apple ID → Sign-In and Security → App-Specific Passwords)
#     or store password in keychain: xcrun altool --store-password-in-keychain-item "AC_PASSWORD" -u "your@email.com" -p "app-specific-password"
#
# Usage:
#   From apps/sasi_cowork:
#     ./scripts/upload-testflight.sh
#   Or with env vars:
#     APPLE_ID=your@email.com APPLE_APP_PASSWORD=xxxx-xxxx-xxxx-xxxx ./scripts/upload-testflight.sh
#
# IPA path: build/ios/ipa/sasi_cowork.ipa (after flutter build ipa)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
IPA_PATH="$APP_DIR/build/ios/ipa/sasi_cowork.ipa"

if [[ ! -f "$IPA_PATH" ]]; then
  echo "IPA not found at $IPA_PATH"
  echo "Run from apps/sasi_cowork: flutter build ipa"
  exit 1
fi

APPLE_ID="${APPLE_ID:-}"
APPLE_APP_PASSWORD="${APPLE_APP_PASSWORD:-}"

if [[ -z "$APPLE_ID" ]]; then
  echo "Set APPLE_ID (your Apple ID email), e.g.:"
  echo "  export APPLE_ID=your@email.com"
  echo "  export APPLE_APP_PASSWORD=xxxx-xxxx-xxxx-xxxx"
  echo "Or use keychain (no password in env):"
  echo "  xcrun altool --upload-app --type ios --file \"$IPA_PATH\" --username \"your@email.com\" --password \"@keychain:AC_PASSWORD\""
  exit 1
fi

if [[ -z "$APPLE_APP_PASSWORD" ]]; then
  echo "Trying keychain item AC_PASSWORD..."
  xcrun altool --upload-app --type ios --file "$IPA_PATH" \
    --username "$APPLE_ID" --password "@keychain:AC_PASSWORD"
else
  xcrun altool --upload-app --type ios --file "$IPA_PATH" \
    --username "$APPLE_ID" --password "$APPLE_APP_PASSWORD"
fi

echo "Upload finished. Check App Store Connect → TestFlight for processing."
