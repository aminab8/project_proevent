import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/notificationitem.dart';
import '../model/notifications.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  static DatabaseService get instance => _instance;

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'events.db');
    await deleteDatabase(path); // Code temporaire pour supprimer la base de données

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE events (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            place TEXT,
            date TEXT,
            startTime TEXT,
            endTime TEXT,
            color INTEGER,
            isCompleted INTEGER,
            type TEXT,
            namedept TEXT,
            namesession TEXT
          );
        ''');
        print('Table events created');

        await db.execute('''
          CREATE TABLE notifications (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            body TEXT,
            eventId INTEGER
          );
        ''');
        print('Table notifications created');
      },
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    print('Database initialized');
    return _database!;
  }

  Future<int> addEvent(Notifications event) async {
    final db = await database;

    int eventId = await db.insert('events', event.toJson());
    print('Event added with ID: $eventId');

    return eventId;
  }

  Future<List<Notifications>> getAllEvents() async {
    final db = await database;

    final result = await db.query('events');
    List<Notifications> events = result.map((json) =>
        Notifications.fromJson(json)).toList();
    print('Fetched ${events.length} events');
    return events;
  }

  Future<int> addNotification(NotificationItem notification) async {
    final db = await database;

    int notificationId = await db.insert('notifications', notification.toJson());
    print('Notification added with ID: $notificationId');

    return notificationId;
  }

  Future<List<NotificationItem>> getAllNotifications() async {
    final db = await database;

    final result = await db.query('notifications');
    List<NotificationItem> notifications = result.map((json) =>
        NotificationItem.fromJson(json)).toList();
    print('Fetched ${notifications.length} notifications');
    return notifications;
  }
}
