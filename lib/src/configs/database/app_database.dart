import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {

  static final _instance = AppDatabase._internal();

  AppDatabase._internal();

  factory AppDatabase() => _instance;

  Database _db;

  Future<Database> get current async {
    if (_db == null) {
      _db = await init();
    }
    return _db;
  }

  Future<Database> init() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'app.db');

    return openDatabase(
      databasePath,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  _createDatabase(Database db, int version) async {
    await db.execute("""
      CREATE TABLE users 
      (
        id INTEGER PRIMARY KEY,
        name TEXT,
        points INTEGER,
        image_path TEXT
      )
    """);
  }

}