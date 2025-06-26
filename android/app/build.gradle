plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // ✅ Needed for Firebase
}

android {
    namespace = "com.example.sust_medical" // ✅ Must match your Firebase package name
    compileSdk = flutter.compileSdkVersion

    ndkVersion = "27.0.12077973" // ✅ Matches required Firebase NDK version

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    defaultConfig {
        applicationId = "com.example.sust_medical" // ✅ Same as in google-services.json
        minSdk = 23 // ✅ Firebase requires at least 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.debug // 🔒 Replace with release key for production
        }
    }
}

flutter {
    source = "../.."
}

// ✅ Required to enable Firebase SDKs
apply plugin: 'com.google.gms.google-services'
