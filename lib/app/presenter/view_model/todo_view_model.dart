import 'package:flutter/material.dart';
import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/usecase/todo/create_todo_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/delete_all_todos_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/delete_todo_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/find_all_todos_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/toggle_is_completed_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/update_todo_usecase.dart';

class TodoViewModel extends ChangeNotifier {
  CreateTodoUsecase? createTodoUsecase;
  DeleteTodoUsecase? deleteTodoUsecase;
  FindAllTodosUsecase? findAllTodosUsecase;
  DeleteAllTodosUsecase? deleteAllTodosUsecase;
  UpdateTodoUsecase? updateTodoUsecase;
  ToggleIsCompletedUsecase? toggleIsCompletedUsecase;

  TodoViewModel({
    this.createTodoUsecase,
    this.findAllTodosUsecase,
    this.deleteTodoUsecase,
    this.deleteAllTodosUsecase,
    this.updateTodoUsecase,
    this.toggleIsCompletedUsecase,
  });
  factory TodoViewModel.empty() {
    return TodoViewModel();
  }

  List<Todo> _todos = [];
  List<Todo> _filteredTodos = [];
  List<Todo> _completedTodos = [];
  String _currentSearchQuery = '';
  ConnectionState _connectionState = ConnectionState.none;

  List<Todo> get todos => _todos;
  String get currentSearchQuery => _currentSearchQuery;
  List<Todo> get filteredTodos => _filteredTodos;
  List<Todo> get completedTodos => _completedTodos;
  ConnectionState get connectionState => _connectionState;

  Future<void> loadTodos() async {
    try {
      _connectionState = ConnectionState.waiting;
      _todos = await findAllTodosUsecase!.call('null');
      _connectionState = ConnectionState.done;
      notifyListeners();
    } catch (error) {
      _connectionState = ConnectionState.none;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> createTodo(String title, String description) async {
    try {
      _connectionState = ConnectionState.waiting;

      final newTodo = Todo(
        title: title,
        description: description,
        isCompleted: false,
      );

      await createTodoUsecase!(newTodo);
      await loadTodos();
      _connectionState = ConnectionState.done;
      notifyListeners();
    } catch (error) {
      _connectionState = ConnectionState.none;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      _connectionState = ConnectionState.waiting;
      await deleteTodoUsecase!(todo);
      await finishedTodos();
      _connectionState = ConnectionState.done;
      notifyListeners();
    } catch (error) {
      _connectionState = ConnectionState.none;
      rethrow;
    }
  }

  Future<void> deleteAllTodos() async {
    try {
      _connectionState = ConnectionState.waiting;

      await deleteAllTodosUsecase!('null');
      _todos.clear();
      _filteredTodos.clear();

      await loadTodos();
      await finishedTodos();
      _connectionState = ConnectionState.done;
      notifyListeners();
    } catch (error) {
      _connectionState = ConnectionState.none;
      notifyListeners();
      rethrow;
    }
  }

  void searchTodos(String query) {
    _currentSearchQuery = query;
    if (query.isEmpty) {
      _filteredTodos = List.from(_todos);
    } else {
      _filteredTodos = _todos
          .where((todo) =>
              todo.title.toLowerCase().contains(query.toLowerCase()) ||
              todo.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    _connectionState = ConnectionState.done;
    notifyListeners();
  }

  Future<void> toggleIsCompletedTodo(Todo todo) async {
    try {
      Todo toggledTodo = todo.copyWith(isCompleted: !todo.isCompleted);
      await toggleIsCompletedUsecase!(toggledTodo);

      await finishedTodos();
      notifyListeners();
    } catch (error) {
      _connectionState = ConnectionState.none;
    }
  }

  Future<void> finishedTodos() async {
    try {
      _connectionState = ConnectionState.waiting;
      await loadTodos();

      _completedTodos = _todos.where((todo) => todo.isCompleted).toList();
      _connectionState = ConnectionState.done;
      notifyListeners();
    } catch (error) {
      _connectionState = ConnectionState.none;
      notifyListeners();
      rethrow;
    }
  }
}
