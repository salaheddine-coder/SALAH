# Google Maps Setup Guide

## Overview
This guide will help you set up Google Maps API for the Estaly Real Estate app.

## Step 1: Get Google Maps API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the following APIs:
   - Maps SDK for Android
   - Maps SDK for iOS
   - Places API (optional, for search functionality)
   - Geocoding API (optional, for address conversion)

4. Go to "Credentials" and create an API key
5. Restrict the API key for security:
   - For Android: Add your app's package name and SHA-1 fingerprint
   - For iOS: Add your app's bundle identifier

## Step 2: Configure Android

1. Open `android/app/src/main/AndroidManifest.xml`
2. Replace `AIzaSyDemoKeyForDevelopment` with your actual API key:

```xml
<meta-data android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_ACTUAL_API_KEY_HERE"/>
```

## Step 3: Configure iOS

1. Open `ios/Runner/AppDelegate.swift`
2. Replace `AIzaSyDemoKeyForDevelopment` with your actual API key:

```swift
GMSServices.provideAPIKey("YOUR_ACTUAL_API_KEY_HERE")
```

## Step 4: Test the Implementation

1. Run the app on a device or emulator
2. Navigate to the Maps screen
3. Verify that:
   - The map loads correctly
   - Property markers are displayed
   - Location permissions work
   - Map type toggle works
   - Current location button works

## Security Notes

- Never commit your API key to version control
- Consider using environment variables or secure storage
- Set up proper API key restrictions
- Monitor your API usage in Google Cloud Console

## iOS Deployment Target Fix

If you encounter the error about iOS deployment version, follow these steps:

1. **Update Podfile**: Set minimum iOS version to 14.0
```ruby
platform :ios, '14.0'
```

2. **Update AppFrameworkInfo.plist**: Change MinimumOSVersion to 14.0
```xml
<key>MinimumOSVersion</key>
<string>14.0</string>
```

3. **Clean and reinstall**:
```bash
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
flutter clean
flutter pub get
```

## Troubleshooting

### Common Issues:

1. **iOS deployment target error**: Update to iOS 14.0+ (see above)
2. **Map not loading**: Check if API key is correct and APIs are enabled
3. **Location not working**: Ensure location permissions are granted
4. **Markers not showing**: Verify marker creation logic and coordinates

### Debug Steps:

1. Check Android/iOS logs for error messages
2. Verify API key restrictions
3. Ensure all required APIs are enabled
4. Test on different devices/emulators

## Features Implemented

- ✅ Google Maps integration
- ✅ Property markers with info windows
- ✅ Current location detection
- ✅ Map type toggle (Normal/Satellite)
- ✅ Search bar for locations
- ✅ Filter properties on map
- ✅ Navigation to property details
- ✅ List/Map view toggle

## Next Steps

Consider implementing:
- Geocoding for address search
- Clustering for many markers
- Custom marker icons
- Directions to properties
- Nearby places integration
