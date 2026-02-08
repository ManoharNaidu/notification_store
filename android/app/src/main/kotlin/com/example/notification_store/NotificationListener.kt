package com.example.notification_store

import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import android.util.Log

class NotificationListener : NotificationListenerService() {

    override fun onNotificationPosted(sbn: StatusBarNotification) {
        try {
            val extras = sbn.notification.extras

            val title = extras.getString("android.title") ?: ""
            val text = extras.getCharSequence("android.text")?.toString() ?: ""
            val packageName = sbn.packageName
            val timestamp = sbn.postTime

            // Ignore empty notifications
            if (title.isEmpty() && text.isEmpty()) return

            Log.d(
                "NotificationListener",
                "From: $packageName | $title | $text"
            )

            // Send data to Flutter via MethodChannel
            if (::MainActivity.methodChannel.isInitialized) {
                MainActivity.methodChannel.invokeMethod(
                    "saveNotification",
                    mapOf(
                        "package" to packageName,
                        "title" to title,
                        "text" to text,
                        "timestamp" to timestamp
                    )
                )
            }

        } catch (e: Exception) {
            Log.e("NotificationListener", "Error reading notification", e)
        }
    }

    override fun onNotificationRemoved(sbn: StatusBarNotification) {
        // Optional: handle removed notifications if needed
    }
}
