package com.example.notification_store

import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import android.util.Log

class NotificationListener : NotificationListenerService() {

    override fun onNotificationPosted(sbn: StatusBarNotification) {
        val extras = sbn.notification.extras

        val title = extras.getString("android.title")
        val text = extras.getCharSequence("android.text")?.toString()
        val packageName = sbn.packageName
        val timestamp = sbn.postTime

        Log.d("NOTIF", "$packageName | $title | $text")

        // TODO: save to database
    }
}


MethodChannel(
    FlutterEngine(this).dartExecutor.binaryMessenger,
    "notification_channel"
).invokeMethod(
    "saveNotification",
    mapOf(
        "title" to title,
        "text" to text,
        "package" to packageName,
        "timestamp" to timestamp
    )
)

