import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/usecase/base_usecase.dart';

abstract class FindTodoByIdUsecase implements BaseUseCase<Todo?, int> {}
