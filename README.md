# incheon_knowhow

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## build

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### splash create build

```
flutter pub run flutter_native_splash:create
```

### android build

```
flutter build apk --target-platform=android-arm64
flutter build appbundle
```

### iOS build

```
flutter build ipa
```
