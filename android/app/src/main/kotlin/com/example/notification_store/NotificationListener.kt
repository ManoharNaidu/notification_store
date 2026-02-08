package com.example.notification_store

import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import android.util.Log
import com.example.notification_store.MainActivity

class NotificationListener : NotificationListenerService() {

    override fun onNotificationPosted(sbn: StatusBarNotification) {
        try {
            val extras = sbn.notification.extras

            val title = extras.getString("android.title") ?: ""
            val text = extras.getCharSequence("android.text")?.toString() ?: ""
            val packageName = sbn.packageName
            val timestamp = sbn.postTime

            if (title.isEmpty() && text.isEmpty()) return

            Log.d(
                "NotificationListener",
                "From: $packageName | $title | $text"
            )

            // SAFE nullable check
            MainActivity.methodChannel?.invokeMethod(
                "saveNotification",
                mapOf(
                    "package" to packageName,
                    "title" to title,
                    "text" to text,
                    "timestamp" to timestamp
                )
            )

        } catch (e: Exception) {
            Log.e("NotificationListener", "Error reading notification", e)
        }
    }
}
