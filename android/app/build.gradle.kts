plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.batterylearn"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.batterylearn"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions += "default"

    productFlavors {
        create("development") {
            dimension = "default"
            applicationId = "com.example.batterymonitor.dev"
            versionCode = flutter.versionCode
            versionName = "${flutter.versionName}-dev"
            resValue("string", "app_name", "Battery Monitor Dev")
        }
        
        create("staging") {
            dimension = "default"
            applicationId = "com.example.batterymonitor.staging"
            versionCode = flutter.versionCode
            versionName = "${flutter.versionName}-staging"
            resValue("string", "app_name", "Battery Monitor Staging")
        }
        
        create("production") {
            dimension = "default"
            applicationId = "com.example.batterymonitor"
            versionCode = flutter.versionCode
            versionName = flutter.versionName
            resValue("string", "app_name", "Battery Monitor")
        }
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}