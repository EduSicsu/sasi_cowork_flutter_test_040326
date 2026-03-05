# TestFlight – SASI Cowork iOS

Steps to build and distribute the app via TestFlight.

## Prerequisites

- Apple Developer Program membership
- App created in [App Store Connect](https://appstoreconnect.apple.com) with bundle ID: `com.example.sasiCoworkFlutterTest040326`
- Xcode with the correct development team selected (Runner target)

## Build

From `apps/sasi_cowork`:

```bash
flutter clean
flutter pub get
flutter build ipa
```

Optional build number:

```bash
flutter build ipa --build-number=2
```

- **Archive**: `build/ios/archive/Runner.xcarchive`
- **IPA** (if export succeeds): `build/ios/ipa/sasi_cowork.ipa`

If IPA export fails (e.g. missing distribution certificate), use **Upload via Xcode** below with the archive.

## Upload via Xcode (recommended first time)

1. Open the workspace: `apps/sasi_cowork/ios/Runner.xcworkspace`
2. Or open the archive: `open apps/sasi_cowork/build/ios/archive/Runner.xcarchive`
3. In Organizer: select the archive → **Distribute App** → **App Store Connect** → **Upload**
4. Follow the wizard (signing, options). Use your Apple ID when prompted.

## Upload via command line

After a successful `flutter build ipa`, the IPA is at `build/ios/ipa/sasi_cowork.ipa`.

Using the script (from `apps/sasi_cowork`):

```bash
chmod +x scripts/upload-testflight.sh
export APPLE_ID=your@email.com
export APPLE_APP_PASSWORD=xxxx-xxxx-xxxx-xxxx   # App-specific password from appleid.apple.com
./scripts/upload-testflight.sh
```

Or with keychain (store password once):

```bash
xcrun altool --store-password-in-keychain-item "AC_PASSWORD" -u "your@email.com" -p "app-specific-password"
./scripts/upload-testflight.sh   # uses APPLE_ID + keychain
```

Manual upload:

```bash
xcrun altool --upload-app --type ios --file build/ios/ipa/sasi_cowork.ipa \
  --username "your@email.com" --password "@keychain:AC_PASSWORD"
```

## After upload

- App Store Connect → your app → **TestFlight**
- Wait for the build to finish processing (about 5–15 minutes)
- Add **Internal** and/or **External** testers and distribute the build

## Version and bundle ID

- **Version**: `apps/sasi_cowork/pubspec.yaml` → `version: 1.0.0+1` (version 1.0.0, build 1). Increment the number after `+` for each new upload.
- **Bundle ID**: `com.example.sasiCoworkFlutterTest040326` (set in `ios/Runner.xcodeproj/project.pbxproj`). For production, consider changing `com.example` to your own prefix.
