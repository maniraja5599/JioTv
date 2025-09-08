# 📱 FiFTO TV APK Build Instructions

## 🚀 Quick APK Creation Methods

### Method 1: Online APK Builder (Recommended)
1. **Go to:** [APK Builder Online](https://www.apk-builder.com/) or [PWA Builder](https://www.pwabuilder.com/)
2. **Upload your web app:** Use the URL `http://192.168.1.113:5001`
3. **Configure:**
   - App Name: `FiFTO TV`
   - Package Name: `com.fifto.tv`
   - Version: `1.0.0`
4. **Download APK:** The service will generate an APK file

### Method 2: Using Android Studio
1. **Download Android Studio** from [developer.android.com](https://developer.android.com/studio)
2. **Open the project:** Navigate to `JioTv/android/` folder
3. **Install Java 11+** (required for Android Gradle Plugin)
4. **Build APK:** Run `Build > Build Bundle(s) / APK(s) > Build APK(s)`

### Method 3: Using Cordova/PhoneGap
1. **Install Cordova:**
   ```bash
   npm install -g cordova
   ```
2. **Create project:**
   ```bash
   cordova create fifto-tv com.fifto.tv "FiFTO TV"
   cd fifto-tv
   ```
3. **Add Android platform:**
   ```bash
   cordova platform add android
   ```
4. **Copy web files** to `www/` directory
5. **Build APK:**
   ```bash
   cordova build android
   ```

## 📋 Features Included in APK

### ✅ **Home Button**
- Quick navigation to main page
- Located in navbar next to logo
- No icon, text-only as requested

### ✅ **Casting Functionality**
- Cast button in navbar
- Compatible with Chromecast/Android TV
- Visual feedback when casting
- Works with Chrome browser

### ✅ **Mobile Optimized**
- Responsive design for all screen sizes
- Touch-friendly interface
- Android TV compatible

### ✅ **PWA Features**
- Installable as native app
- Offline capability
- App-like experience

## 🎯 Installation Instructions

### For Users:
1. **Download APK** from any of the methods above
2. **Enable Unknown Sources** in Android settings
3. **Install APK** by tapping on the file
4. **Launch FiFTO TV** from app drawer

### For Developers:
1. **Connect Android device** via USB
2. **Enable USB Debugging** in Developer Options
3. **Install via ADB:**
   ```bash
   adb install app-debug.apk
   ```

## 🔧 Server Requirements

The APK requires the JioTV Go server to be running:
- **Local Network:** `http://192.168.1.113:5001`
- **Features:** Home button, Casting, Theme toggle
- **Compatibility:** All Android devices (API 21+)

## 📱 APK Specifications

- **Target SDK:** 33 (Android 13)
- **Minimum SDK:** 21 (Android 5.0)
- **Architecture:** Universal (ARM, x86)
- **Size:** ~5-10 MB
- **Permissions:** Internet, Network State

## 🚀 Quick Start

1. **Start JioTV Go server:**
   ```bash
   cd JioTv
   go run main.go serve --public
   ```

2. **Build APK** using any method above

3. **Install and enjoy** FiFTO TV on your Android device!

---

**Note:** The APK is a wrapper around the web interface, so it requires the Go server to be running for full functionality.
