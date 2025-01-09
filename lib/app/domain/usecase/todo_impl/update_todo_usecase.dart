import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/update_todo_usecase.dart';

class UpdateTodoUsecaseImpl implements UpdateTodoUsecase {
  final TodoRepository _todoRepository;

  UpdateTodoUsecaseImpl({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<Todo> call(Todo todo) async {
    return await _todoRepository.update(todo);
  }
}
