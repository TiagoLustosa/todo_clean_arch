import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/find_todo_by_id_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/update_todo_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/create_todo_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/delete_all_todos_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/delete_todo_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/find_all_todos_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/find_todo_by_id_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/toggle_is_completed_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/update_todo_usecase.dart';

import 'todo_usecases_test.mocks.dart';

@GenerateMocks([TodoRepository])
@GenerateMocks([FindTodoByIdUsecase])
@GenerateMocks([UpdateTodoUsecase])
void main() {
  late MockTodoRepository mockRepository;
  late MockFindTodoByIdUsecase mockFindTodoByIdUsecase;
  late MockUpdateTodoUsecase mockUpdateTodoUsecase;

  setUp(() {
    mockRepository = MockTodoRepository();
    mockFindTodoByIdUsecase = MockFindTodoByIdUsecase();
    mockUpdateTodoUsecase = MockUpdateTodoUsecase();
  });

  group('Todos Test', () {
    test('should create a new todo and return it', () async {
      final todo = Todo(
          id: 1,
          title: 'Test',
          description: 'Test description',
          isCompleted: false);

      when(mockRepository.create(todo)).thenAnswer((_) async => todo);

      final usecase = CreateTodoUsecaseImpl(todoRepository: mockRepository);
      final result = await usecase.call(todo);

      expect(result, todo);
      verify(mockRepository.create(todo)).called(1);
    });

    test('should delete the specified todo', () async {
      final todo = Todo(
          id: 1,
          title: 'Test',
          description: 'Test description',
          isCompleted: false);

      when(mockRepository.delete(todo)).thenAnswer((_) async {});

      final usecase = DeleteTodoUsecaseImpl(todoRepository: mockRepository);
      await usecase(todo);

      verify(mockRepository.delete(todo)).called(1);
    });

    test('should delete all todos', () async {
      when(mockRepository.deleteAll()).thenAnswer((_) async {});

      final usecase = DeleteAllTodosUsecaseImpl(todoRepository: mockRepository);
      await usecase.call('noParams');

      verify(mockRepository.deleteAll()).called(1);
    });

    test('should return all todos', () async {
      final todos = [
        Todo(
            id: 1,
            title: 'Test 1',
            description: 'Description 1',
            isCompleted: false),
        Todo(
            id: 2,
            title: 'Test 2',
            description: 'Description 2',
            isCompleted: true),
      ];

      when(mockRepository.findAll()).thenAnswer((_) async => todos);

      final usecase = FindAllTodosUsecaseImpl(todoRepository: mockRepository);
      final result = await usecase.call('noParams');

      expect(result, todos);
      verify(mockRepository.findAll()).called(1);
    });

    test('should return the todo with the given id', () async {
      final todo = Todo(
          id: 1,
          title: 'Test',
          description: 'Test description',
          isCompleted: false);

      when(mockRepository.findById(1)).thenAnswer((_) async => todo);

      final usecase = FindTodoByIdUsecaseImpl(todoRepository: mockRepository);
      final result = await usecase.call(1);

      expect(result, todo);
      verify(mockRepository.findById(1)).called(1);
    });

    test('should return null if no todo is found', () async {
      when(mockRepository.findById(1)).thenAnswer((_) async => null);

      final usecase = FindTodoByIdUsecaseImpl(todoRepository: mockRepository);
      final result = await usecase(1);

      expect(result, isNull);
      verify(mockRepository.findById(1)).called(1);
    });

    //Aprender a testar

    test('should toggle the isCompleted status of the todo', () async {
      final todo = Todo(
        id: 1,
        title: 'Test',
        description: 'Test description',
        isCompleted: false,
      );
      final todoFound = todo.copyWith();
      final toggledTodo = todoFound.copyWith(isCompleted: true);

      // Configura os mocks
      when(mockFindTodoByIdUsecase.call(todo.id!))
          .thenAnswer((_) async => todoFound);
      when(mockUpdateTodoUsecase.call(any))
          .thenAnswer((_) async => toggledTodo);

      // Executa o caso de uso
      final usecase = await ToggleIsCompletedUsecaseImpl(
          findTodoByIdUsecase: mockFindTodoByIdUsecase,
          updateTodoUsecase: mockUpdateTodoUsecase);
      final result = await usecase.call(todo);
      // Verificações
      expect(result.isCompleted, !todo.isCompleted);

      verify(mockFindTodoByIdUsecase.call(todo.id!)).called(1);
      verify(mockUpdateTodoUsecase.call(argThat(predicate<Todo>((updatedTodo) =>
          updatedTodo.id == todo.id &&
          updatedTodo.isCompleted == !todo.isCompleted)))).called(1);
    });

    test('should update the todo and return the updated version', () async {
      final todo = Todo(
          id: 1,
          title: 'Updated Test',
          description: 'Updated description',
          isCompleted: false);

      when(mockRepository.update(todo)).thenAnswer((_) async => todo);

      final usecase = UpdateTodoUsecaseImpl(todoRepository: mockRepository);
      final result = await usecase.call(todo);

      expect(result, todo);
      verify(mockRepository.update(todo)).called(1);
    });
  });
}
