import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/usecase/todo/find_todo_by_id_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/toggle_is_completed_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/update_todo_usecase.dart';

class ToggleIsCompletedUsecaseImpl implements ToggleIsCompletedUsecase {
  final FindTodoByIdUsecase _findTodoByIdUsecase;
  final UpdateTodoUsecase _updateTodoUsecase;

  ToggleIsCompletedUsecaseImpl({
    required FindTodoByIdUsecase findTodoByIdUsecase,
    required UpdateTodoUsecase updateTodoUsecase,
  })  : _findTodoByIdUsecase = findTodoByIdUsecase,
        _updateTodoUsecase = updateTodoUsecase;

  @override
  Future<Todo> call(Todo todo) async {
    final todoFounded = await _findTodoByIdUsecase.call(todo.id!);
    final updatedTodo =
        todoFounded?.copyWith(isCompleted: !todoFounded.isCompleted);

    return await _updateTodoUsecase(updatedTodo!);
  }
}
