import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/exception/bussiness_rule_exception.dart';
import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/create_todo_usecase.dart';

class CreateTodoUsecaseImpl implements CreateTodoUsecase {
  final TodoRepository _todoRepository;

  CreateTodoUsecaseImpl({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<Todo> call(Todo todo) async {
    if (todo.title.isEmpty) {
      throw BusinessRuleException('Todo title cannot be empty');
    }

    return await _todoRepository.create(todo);
  }
}
