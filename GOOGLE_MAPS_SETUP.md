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

## Troubleshooting

### Common Issues:

1. **Map not loading**: Check if API key is correct and APIs are enabled
2. **Location not working**: Ensure location permissions are granted
3. **Markers not showing**: Verify marker creation logic and coordinates

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
