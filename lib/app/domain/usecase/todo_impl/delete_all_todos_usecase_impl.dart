import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/delete_all_todos_usecase.dart';

class DeleteAllTodosUsecaseImpl implements DeleteAllTodosUsecase {
  final TodoRepository _todoRepository;

  DeleteAllTodosUsecaseImpl({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<void> call(String noParams) async {
    await _todoRepository.deleteAll();
  }
}
