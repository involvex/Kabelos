pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    // Use AGP 8.x compatible with Gradle 8.6 in CI for now; we'll migrate to AGP 9 in a dedicated branch.
    id("com.android.application") version "8.6.0" apply false
    // Use Kotlin 1.9.20 to match embedded-kotlin expectations on this toolchain.
    id("org.jetbrains.kotlin.android") version "1.9.20" apply false
}

include(":app")
