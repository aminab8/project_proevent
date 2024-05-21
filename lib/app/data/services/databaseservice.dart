import 'package:dcli/dcli.dart';
import 'package:sqflite/sqflite.dart';

import '../model/formateur.dart';
import '../model/session.dart';
import 'notifications.dart';

class DatabaseService {
  DatabaseService();
  static final DatabaseService _instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  static DatabaseService get instance => _instance;

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'events.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
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
        namedept TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE sessions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        eventId INTEGER,
        name TEXT,
        number TEXT,
        FOREIGN KEY(eventId) REFERENCES events(id) ON DELETE CASCADE
      );
    ''');

    await db.execute('''
      CREATE TABLE formateurs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        eventId INTEGER,
        name TEXT,
        email TEXT,
        FOREIGN KEY(eventId) REFERENCES events(id) ON DELETE CASCADE
      );
    ''');
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<int> addEvent(Notifications event) async {
    final db = await database;

    // Insert event and get the id
    int eventId = await db.insert('events', event.toJson());

    // Insert sessions
    for (var session in event.sessions) {
      session.id = await db.insert('sessions', {
        'eventId': eventId,
        'name': session.name,
        'number': session.number,
      });
    }

    // Insert formateurs
    for (var formateur in event.formateurs) {
      formateur.id = await db.insert('formateurs', {
        'eventId': eventId,
        'name': formateur.name,
        'email': formateur.email,
      });
    }

    return eventId;
  }

  Future<List<Notifications>> getAllEvents() async {
    final db = await database;

    final result = await db.query('events');
    List<Notifications> events = result.map((json) => Notifications.fromJson(json)).toList();

    // Load sessions and formateurs for each event
    for (var event in events) {
      final sessionResults = await db.query('sessions', where: 'eventId = ?', whereArgs: [event.id]);
      event.sessions = sessionResults.map((json) => Session.fromJson(json)).toList();

      final formateurResults = await db.query('formateurs', where: 'eventId = ?', whereArgs: [event.id]);
      event.formateurs = formateurResults.map((json) => Formateur.fromJson(json)).toList();
    }

    return events;
  }

  Future<void> deleteEvent(int? eventId) async {
    final db = await database;

    await db.transaction((txn) async {
      await txn.delete('sessions', where: 'eventId = ?', whereArgs: [eventId]);
      await txn.delete('formateurs', where: 'eventId = ?', whereArgs: [eventId]);
      await txn.delete('events', where: 'id = ?', whereArgs: [eventId]);
    });
  }
}
