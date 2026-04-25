import 'package:flutter/material.dart';
import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/todo_usecases.dart';
import 'package:todo_list/utils/random_todos.dart';

class TodoViewModel extends ChangeNotifier {
  TodoUseCases? useCases;

  TodoViewModel({required this.useCases});
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
      _todos = await useCases!.findAll.call('null');
      _connectionState = ConnectionState.done;
      notifyListeners();
    } catch (error) {
      _connectionState = ConnectionState.none;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> createTodo(Todo newTodo) async {
    try {
      _connectionState = ConnectionState.waiting;

      await useCases!.createTodo(newTodo);
      await loadTodos();
      _connectionState = ConnectionState.done;
      notifyListeners();
    } catch (error) {
      _connectionState = ConnectionState.none;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> createRandomTodos() async {
    try {
      _connectionState = ConnectionState.waiting;

      await useCases!.createRandomTodos(RandomTodos.rawQuery);
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

  Future<void> deleteTodo(Todo todo) async {
    try {
      _connectionState = ConnectionState.waiting;
      await useCases!.delete(todo);
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

      await useCases!.deleteAll('null');
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
      await useCases!.toggle(toggledTodo);

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
