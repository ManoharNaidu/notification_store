import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final StoredNotification notification;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final time = DateTime.fromMillisecondsSinceEpoch(notification.time);

    return ListTile(
      leading: const Icon(Icons.notifications),
      title: Text(
        notification.title.isNotEmpty ? notification.title : '(No title)',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        notification.app,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(_formatTime(time), style: const TextStyle(fontSize: 12)),
      onTap: onTap,
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();

    if (now.difference(time).inDays == 0) {
      return '${time.hour.toString().padLeft(2, '0')}:'
          '${time.minute.toString().padLeft(2, '0')}';
    } else {
      return '${time.day}/${time.month}';
    }
  }
}
