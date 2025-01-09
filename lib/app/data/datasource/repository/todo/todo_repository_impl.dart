import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/data/datasource/local/todo_local_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource _localDatasource;

  TodoRepositoryImpl(this._localDatasource);

  @override
  Future<Todo> create(Todo params) async {
    return await _localDatasource.create(params);
  }

  @override
  Future<void> createRandomTodos(String rawQuery) async {
    await _localDatasource.createRandomTodos(rawQuery);
  }

  @override
  Future<List<Todo>> findAll() async {
    return await _localDatasource.findAll();
  }

  @override
  Future<Todo?> findById(int id) async {
    return await _localDatasource.findById(id);
  }

  @override
  Future<Todo> update(Todo params) async {
    return await _localDatasource.update(params);
  }

  @override
  Future<void> delete(Todo todo) async {
    await _localDatasource.delete(todo);
  }

  @override
  Future<void> deleteAll() async {
    await _localDatasource.deleteAll();
  }
}
