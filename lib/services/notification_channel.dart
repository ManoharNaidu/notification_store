import 'package:flutter/services.dart';
import '../data/notification_db.dart';
import '../models/notification_model.dart';

class NotificationChannelService {
  static const _channel = MethodChannel('notification_channel');

  static void initialize() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'saveNotification') {
        final data = Map<String, dynamic>.from(call.arguments);

        final notification = StoredNotification(
          app: data['package'] ?? 'Unknown',
          title: data['title'] ?? '',
          body: data['text'] ?? '',
          time: data['timestamp'],
        );

        await NotificationDB.insert(notification);
      }
    });
  }
}
