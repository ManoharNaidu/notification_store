package com.example.notification_store

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    companion object {
        const val CHANNEL = "notification_channel"

        // This is used by NotificationListener to access Flutter
        lateinit var methodChannel: MethodChannel
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        )

        // We don't handle calls FROM Flutter here for now
        methodChannel.setMethodCallHandler { _, result ->
            result.notImplemented()
        }
    }
}
