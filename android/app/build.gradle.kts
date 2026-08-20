import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

val hasReleaseSigningConfig = listOf(
    "keyAlias",
    "keyPassword",
    "storeFile",
    "storePassword",
).all { !keystoreProperties.getProperty(it).isNullOrBlank() }

val splitPerAbi = providers.gradleProperty("split-per-abi")
    .map(String::toBoolean)
    .getOrElse(false)
val supportedAbis = listOf("arm64-v8a", "x86_64")

android {
    namespace = "com.involvex.kabelos"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    // Use the new compilerOptions DSL for Kotlin JVM target (AGP 9+)
    compilerOptions {
        kotlinOptions {
            // set jvm target to Java 11
            jvmTarget.set("11")
        }
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.involvex.kabelos"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 33
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // Flutter owns ABI filters for split builds. For other builds, keep
        // unsupported armeabi-v7a out because no libopus binary is bundled.
        if (!splitPerAbi) {
            ndk {
                abiFilters += supportedAbis
            }

            externalNativeBuild {
                cmake {
                    abiFilters += supportedAbis
                }
            }
        }
    }

    externalNativeBuild {
        cmake {
            path = file("src/main/cpp/CMakeLists.txt")
            version = "3.22.1"
        }
    }

    dependenciesInfo {
        includeInApk = false
        includeInBundle = false
    }

    packaging {
        jniLibs {
            excludes += setOf("**/armeabi-v7a/**")
        }
    }

    signingConfigs {
        if (hasReleaseSigningConfig) {
            create("release") {
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
            }
        }
    }

    buildTypes {
        release {
            // Enable R8 code shrinking and resource shrinking for smaller, optimized APKs.
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android.txt"),
                file("proguard-rules.pro")
            )

            if (hasReleaseSigningConfig) {
                signingConfig = signingConfigs.getByName("release")
            }

            // Ensure release builds are not debuggable
            isDebuggable = false
        }
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20240303")
}

flutter {
    source = "../.."
}
