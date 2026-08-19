# Proguard rules for Kabelos Flutter app
# Keep Flutter embedding classes and plugins
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }

# Keep app classes (package: com.involvex.kabelos)
-keep class com.involvex.kabelos.** { *; }

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep JavascriptInterface annotated methods
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Don't warn about Flutter embedding (suppress noisy warnings)
-dontwarn io.flutter.embedding.**

# Keep Kotlin metadata
-keep class kotlin.Metadata { *; }
