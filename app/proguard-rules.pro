# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in D:/Program Files/Android-Studio/sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the ProGuard
# include property in project.properties.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}


# Just want proguard to strip unused things, don't care about people
# seeing the source
-dontobfuscate

# So that Fabric can still have line numbers
-keepattributes SourceFile,LineNumberTable

# Picasso rules
-dontwarn com.squareup.okhttp.**

# Retrofit rules
# Platform calls Class.forName on types which do not exist on Android to determine platform.
-dontnote retrofit2.Platform
# Platform used when running on RoboVM on iOS. Will not be used at runtime.
-dontnote retrofit2.Platform$IOS$MainThreadExecutor
# Platform used when running on Java 8 VMs. Will not be used at runtime.
-dontwarn retrofit2.Platform$Java8
# Retain generic type information for use by reflection by converters and adapters.
-keepattributes Signature
# Retain declared checked exceptions for use by a Proxy instance.
-keepattributes Exceptions

# Okio
-dontwarn okio.**

# Simple-Xml Proguard Config
# Keep public classes and methods.
-dontwarn com.bea.xml.stream.**
-keep class org.simpleframework.xml.**{ *; }
-keepclassmembers,allowobfuscation class * {
    @org.simpleframework.xml.* <fields>;
    @org.simpleframework.xml.* <init>(...);
}
-dontwarn javax.xml.stream.events.**
-dontwarn javax.xml.**

# EventBus
-keepattributes *Annotation*
-keepclassmembers class ** {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }

# Only required if you use AsyncExecutor
-keepclassmembers class * extends org.greenrobot.eventbus.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}

## joda-time-android 2.8.0
# This is only necessary if you are not including the optional joda-convert dependency

-dontwarn org.joda.convert.FromString
-dontwarn org.joda.convert.ToString

# Parcel library
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

-keep class org.parceler.Parceler$$Parcels

# Unicoding Bypass library
-keep class in.uncod.android.** { *; }

# Custom rules
-keep class com.commit451.gitlab.ssl.CustomSSLSocketFactory