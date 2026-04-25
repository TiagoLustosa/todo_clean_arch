import 'package:todo_list/app/domain/usecase/todo/create_random_todos_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/create_todo_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/delete_all_todos_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/delete_todo_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/find_all_todos_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/toggle_is_completed_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/update_todo_usecase.dart';

class TodoUseCases {
  final CreateTodoUsecase createTodo;
  final CreateRandomTodosUsecase createRandomTodos;
  final FindAllTodosUsecase findAll;
  final DeleteTodoUsecase delete;
  final DeleteAllTodosUsecase deleteAll;
  final UpdateTodoUsecase update;
  final ToggleIsCompletedUsecase toggle;

  TodoUseCases({
    required this.createTodo,
    required this.createRandomTodos,
    required this.findAll,
    required this.delete,
    required this.deleteAll,
    required this.update,
    required this.toggle,
  });
}
