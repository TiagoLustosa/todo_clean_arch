import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/delete_todo_usecase.dart';

class DeleteTodoUsecaseImpl implements DeleteTodoUsecase {
  final TodoRepository _todoRepository;

  DeleteTodoUsecaseImpl({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<void> call(Todo todo) async {
    await _todoRepository.delete(todo);
  }
}
