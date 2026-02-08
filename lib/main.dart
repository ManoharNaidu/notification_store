import 'package:flutter/material.dart';
import 'services/notification_channel.dart';
import 'screens/notification_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NotificationChannelService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification Store',
      home: NotificationListScreen(),
    );
  }
}
