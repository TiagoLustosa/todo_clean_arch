import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/repository/base_repository.dart';

abstract class TodoRepository implements BaseRepository<Todo, Todo> {}
