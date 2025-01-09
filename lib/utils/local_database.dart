import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static const String _tableName = 'todos';
  static Database? _database;

  Future<Database> get database async => _database ??= await initDatabase();

  Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'todos.db');

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isCompleted INTEGER)');
      },
    );
    return database;
  }
}
