# Quick Start Guide - Atlas Dashboard

## Prerequisites Check

Before starting, ensure you have:
- [ ] Flutter SDK 3.0 or higher installed
- [ ] Dart SDK 3.0 or higher installed
- [ ] Git installed
- [ ] An IDE (VS Code, Android Studio, or IntelliJ IDEA)
- [ ] For iOS development: Xcode (macOS only)
- [ ] For Android development: Android Studio

## Installation Steps

### 1. Verify Flutter Installation

```bash
flutter --version
flutter doctor
```

If Flutter is not installed, visit: https://flutter.dev/docs/get-started/install

### 2. Clone the Repository

```bash
git clone https://github.com/moyinoluwalogo/atlas-dashboard.git
cd atlas-dashboard
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the Application

#### Option A: Using Command Line

```bash
# Run on connected device or emulator
flutter run

# Run on specific device
flutter devices  # List available devices
flutter run -d <device-id>

# Run in debug mode (default)
flutter run

# Run in profile mode (performance testing)
flutter run --profile

# Run in release mode
flutter run --release
```

#### Option B: Using IDE

**VS Code:**
1. Open the project folder
2. Press F5 or click "Run > Start Debugging"
3. Select your target device

**Android Studio:**
1. Open the project
2. Select target device from dropdown
3. Click the Run button (green play icon)

### 5. Verify Installation

Once the app starts, you should see:
- ✅ Dashboard screen with welcome message
- ✅ Sample metric cards
- ✅ Interactive charts
- ✅ Bottom navigation bar
- ✅ Settings screen accessible

## Project Structure Tour

```
atlas-dashboard/
├── lib/
│   ├── main.dart              ← App entry point - START HERE
│   ├── core/
│   │   ├── config/            ← Configuration settings
│   │   ├── theme/             ← Colors and themes
│   │   └── routing/           ← Navigation setup
│   ├── features/
│   │   ├── dashboard/         ← Main dashboard screens
│   │   ├── analytics/         ← Analytics screens
│   │   └── settings/          ← Settings screens
│   └── shared/
│       ├── models/            ← Data structures
│       ├── services/          ← API & WebSocket
│       ├── providers/         ← State management
│       └── widgets/           ← Reusable UI components
└── test/                      ← Tests
```

## Making Your First Change

### Change the App Theme Color

1. Open `lib/core/theme/app_theme.dart`
2. Find this line:
   ```dart
   static const Color primaryColor = Color(0xFF2196F3);
   ```
3. Change it to your preferred color:
   ```dart
   static const Color primaryColor = Color(0xFFFF5722);  // Orange
   ```
4. Save and hot reload (press 'r' in terminal or Ctrl+S in IDE)

### Add a New Metric Card

1. Open `lib/features/dashboard/widgets/dashboard_chart_section.dart`
2. Modify the sample data generation methods
3. Save and hot reload

## Development Workflow

### Hot Reload (for UI changes)
```bash
# Press 'r' in the terminal where flutter run is running
# Or save the file in your IDE (if configured)
```

### Hot Restart (for state reset)
```bash
# Press 'R' in the terminal
```

### Run Tests
```bash
flutter test
```

### Format Code
```bash
dart format .
```

### Analyze Code
```bash
flutter analyze
```

## Common Commands

```bash
# Clean build files
flutter clean

# Get dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# Build for Android
flutter build apk

# Build for iOS
flutter build ios

# Build for Web
flutter build web
```

## Connecting to Your Backend

### Step 1: Update API Endpoints

Edit `lib/core/config/app_config.dart`:

```dart
static const String baseUrl = 'https://your-api.com';
static const String wsUrl = 'wss://your-api.com/ws';
```

### Step 2: Test API Connection

The app will attempt to connect when:
- Dashboard loads (REST API)
- Real-time service initializes (WebSocket)

### Step 3: Handle Errors

Check the error messages displayed in the UI for connection issues.

## Troubleshooting

### Issue: "Unable to locate Android SDK"

**Solution:**
```bash
flutter doctor --android-licenses
```

### Issue: "CocoaPods not installed" (iOS)

**Solution:**
```bash
sudo gem install cocoapods
cd ios
pod install
```

### Issue: Dependencies conflict

**Solution:**
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: "Gradle build failed" (Android)

**Solution:**
1. Update Android Studio
2. Sync Gradle files
3. Clean and rebuild:
   ```bash
   cd android
   ./gradlew clean
   cd ..
   flutter clean
   flutter pub get
   flutter run
   ```

### Issue: Hot reload not working

**Solution:**
1. Use hot restart (R) instead
2. Or stop and restart the app

## Next Steps

1. **Explore the Code:**
   - Start with `lib/main.dart`
   - Check out dashboard screens
   - Review data models

2. **Customize:**
   - Change colors in theme
   - Modify chart configurations
   - Add your own widgets

3. **Integrate Backend:**
   - Update API endpoints
   - Test with real data
   - Implement authentication

4. **Deploy:**
   - Build for your target platform
   - Test thoroughly
   - Release to stores

## Learning Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Riverpod Documentation](https://riverpod.dev)
- [FL Chart Examples](https://github.com/imaNNeo/fl_chart/tree/master/example)

## Getting Help

- 📖 Read the [full documentation](docs/README.md)
- 🐛 Report issues on GitHub
- 💬 Ask questions in discussions
- 📧 Contact maintainers

## Development Checklist

- [ ] Flutter installed and working
- [ ] Project cloned
- [ ] Dependencies installed
- [ ] App running on device/emulator
- [ ] Made first code change
- [ ] Hot reload working
- [ ] Tests running
- [ ] Backend endpoints configured (if applicable)

---

**Congratulations!** 🎉 You're ready to start developing with Atlas Dashboard!

For detailed information, see the [main README](README.md) and [documentation](docs/README.md).
