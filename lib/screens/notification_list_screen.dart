import 'package:flutter/material.dart';
import '../data/notification_db.dart';
import '../models/notification_model.dart';
import 'notification_detail_screen.dart';
import '../widgets/notifications_tile.dart';

class NotificationListScreen extends StatefulWidget {
  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  late Future<List<StoredNotification>> notifications;

  @override
  void initState() {
    super.initState();
    notifications = NotificationDB.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: FutureBuilder(
        future: notifications,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data as List<StoredNotification>;

          if (data.isEmpty) {
            return const Center(child: Text('No notifications yet'));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              final n = data[index];

              return NotificationTile(
                notification: n,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NotificationDetailScreen(notification: n),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
