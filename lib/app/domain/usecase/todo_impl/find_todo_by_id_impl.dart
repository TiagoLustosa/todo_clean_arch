import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/find_todo_by_id_usecase.dart';

class FindTodoByIdUsecaseImpl implements FindTodoByIdUsecase {
  final TodoRepository _todoRepository;

  FindTodoByIdUsecaseImpl({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<Todo?> call(int id) async {
    return await _todoRepository.findById(id);
  }
}
