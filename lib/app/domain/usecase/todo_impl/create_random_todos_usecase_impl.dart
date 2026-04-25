import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/create_random_todos_usecase.dart';

class CreateRandomTodosUsecaseImpl implements CreateRandomTodosUsecase {
  final TodoRepository _todoRepository;

  CreateRandomTodosUsecaseImpl({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<void> call(String rawQuery) async {
    await _todoRepository.createRandomTodos(rawQuery);
  }
}
