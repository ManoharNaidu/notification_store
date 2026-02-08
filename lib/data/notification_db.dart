import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/notification_model.dart';

class NotificationDB {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'notifications.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE notifications (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            app TEXT,
            title TEXT,
            body TEXT,
            time INTEGER
          )
        ''');
      },
    );
  }

  static Future<void> insert(StoredNotification notification) async {
    final db = await database;
    await db.insert('notifications', notification.toMap());
  }

  static Future<List<StoredNotification>> getAll() async {
    final db = await database;
    final data = await db.query(
      'notifications',
      orderBy: 'time DESC',
    );

    return data.map((e) => StoredNotification.fromMap(e)).toList();
  }
}
