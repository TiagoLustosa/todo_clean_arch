import 'package:todo_list/app/domain/entity/todo.dart';

abstract class TodoLocalDatasource {
  Future<Todo> create(Todo todo);
  Future<void> createRandomTodos(String noParams);
  Future<Todo?> findById(int id);
  Future<List<Todo>> findAll();
  Future<Todo> update(Todo todo);
  Future<void> delete(Todo todo);
  Future<void> deleteAll();
}
