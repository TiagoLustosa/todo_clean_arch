import 'package:sqflite/sqflite.dart';
import 'package:todo_list/app/data/datasource/local/todo_local_datasource.dart';
import 'package:todo_list/app/data/exceptions/database_connection_exception.dart';
import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/utils/local_database.dart';

class TodoLocalDatasourceImpl implements TodoLocalDatasource {
  final LocalDatabase _localDatabase;

  TodoLocalDatasourceImpl(this._localDatabase);

  static const String _tableName = 'todos';

  Future<Database> _getDatabase() async {
    try {
      return await _localDatabase.database;
    } catch (e) {
      throw LocalDatabaseException('Failed to open the database: $e');
    }
  }

  @override
  Future<Todo> create(Todo params) async {
    try {
      final db = await _getDatabase();
      final id = await db.insert(
        _tableName,
        params.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return params.copyWith(id: id);
    } catch (e) {
      throw LocalDatabaseException('Failed to create Todo: $e');
    }
  }

  @override
  Future<void> createRandomTodos(String rawQuery) async {
    try {
      final db = await _getDatabase();
      db.rawQuery(rawQuery);
    } catch (e) {
      throw LocalDatabaseException('Failed to create random todos: $e');
    }
  }

  @override
  Future<List<Todo>> findAll() async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(_tableName);
      return List<Todo>.from(maps.map((map) => Todo.fromMap(map)));
    } catch (e) {
      throw LocalDatabaseException('Failed to fetch all Todos: $e');
    }
  }

  @override
  Future<Todo?> findById(int id) async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      if (maps.isNotEmpty) {
        return Todo.fromMap(maps.first);
      }
      return null;
    } catch (e) {
      throw LocalDatabaseException('Failed to find Todo by ID: $id - $e');
    }
  }

  @override
  Future<Todo> update(Todo params) async {
    try {
      final db = await _getDatabase();
      final result = await db.update(
        _tableName,
        params.toMap(),
        where: 'id = ?',
        whereArgs: [params.id],
      );
      if (result == 0) {
        throw LocalDatabaseException(
            'No Todo found to update with ID: ${params.id}');
      }
      return params;
    } catch (e) {
      throw LocalDatabaseException(
        'Failed to update Todo with ID: ${params.id} - $e',
      );
    }
  }

  @override
  Future<void> delete(Todo todo) async {
    try {
      final db = await _getDatabase();
      final result = await db.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [todo.id],
      );
      if (result == 0) {
        throw LocalDatabaseException(
            'No Todo found to delete with ID: ${todo.id}');
      }
    } catch (e) {
      throw LocalDatabaseException(
          'Failed to delete Todo with ID: ${todo.id} - $e');
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      final db = await _getDatabase();
      final result = await db.delete(
        _tableName,
        where: 'isCompleted = ?',
        whereArgs: [1],
      );
      if (result == 0) {
        throw LocalDatabaseException('No todos found to delete');
      }
    } catch (e) {
      throw LocalDatabaseException('Failed to delete all todos: $e');
    }
  }
}
