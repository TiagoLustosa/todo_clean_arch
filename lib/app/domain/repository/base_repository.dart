import 'package:todo_list/app/domain/entity/todo.dart';

abstract class BaseRepository<T, Params> {
  Future<T> create(Params params);
  Future<void> createRandomTodos(String params);
  Future<T?> findById(int id);
  Future<List<T>> findAll();
  Future<T> update(Params params);
  Future<void> delete(Todo todo);
  Future<void> deleteAll();
}
