
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


import 'notifications.dart'; // Modèle des événements

class DatabaseService {
  DatabaseService();
  static final DatabaseService _instance = DatabaseService._init(); // Singleton
  static Database? _database;

  DatabaseService._init();

  static DatabaseService get instance => _instance;



  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'events.db'); // Nom de la base de données

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    // Création de la table des événements
    const sql = '''
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
    ''';
    await db.execute(sql);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<List<Notifications>> getAllEvents() async {
    final db = await database;
    final result = await db.query('events');


    print("Retrieved ${result.length} events from the database");

    return result.map((json) => Notifications.fromJson(json)).toList();
  }
  Future<int> addEvent(Notifications event) async {
    final db = await database;
    return await db.insert('events', event.toJson());
  }
  Future<void> deleteEvent(int? eventId) async {
    final db = await database;
    await db.delete(
      'events',
      where: 'id = ?',
      whereArgs: [eventId],
    );
  }
}
