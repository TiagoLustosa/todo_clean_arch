import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/find_all_todos_usecase.dart';

class FindAllTodosUsecaseImpl implements FindAllTodosUsecase {
  final TodoRepository _todoRepository;

  FindAllTodosUsecaseImpl({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<List<Todo>> call(String nothing) async {
    return await _todoRepository.findAll();
  }
}
