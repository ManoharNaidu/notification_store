import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationDetailScreen extends StatelessWidget {
  final StoredNotification notification;

  const NotificationDetailScreen({required this.notification});

  @override
  Widget build(BuildContext context) {
    final time =
        DateTime.fromMillisecondsSinceEpoch(notification.time);

    return Scaffold(
      appBar: AppBar(title: const Text('Notification')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('App: ${notification.app}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(notification.title,
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text(notification.body),
            const SizedBox(height: 12),
            Text('Time: $time'),
          ],
        ),
      ),
    );
  }
}
