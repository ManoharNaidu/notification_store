class StoredNotification {
  final int? id;
  final String app;
  final String title;
  final String body;
  final int time;

  StoredNotification({
    this.id,
    required this.app,
    required this.title,
    required this.body,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'app': app, 'title': title, 'body': body, 'time': time};
  }

  factory StoredNotification.fromMap(Map<String, dynamic> map) {
    return StoredNotification(
      id: map['id'],
      app: map['app'],
      title: map['title'],
      body: map['body'],
      time: map['time'],
    );
  }
}
