package com.example.notification_store

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity()


private val CHANNEL = "notification_channel"

override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(
        flutterEngine.dartExecutor.binaryMessenger,
        CHANNEL
    ).setMethodCallHandler { call, result ->
        if (call.method == "saveNotification") {
            result.success(null)
        }
    }
}
