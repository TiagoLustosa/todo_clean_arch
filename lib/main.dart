import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/domain/usecase/todo/create_random_todos_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/delete_all_todos_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/delete_todo_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/find_all_todos_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/find_todo_by_id_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/toggle_is_completed_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo/update_todo_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/create_random_todos_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/create_todo_usecase_impl.dart';
import 'package:todo_list/app/data/datasource/local/todo_local_datasource.dart';
import 'package:todo_list/app/data/datasource/local/todo_local_datasource_impl.dart';
import 'package:todo_list/app/data/datasource/repository/todo/todo_repository_impl.dart';
import 'package:todo_list/app/domain/repository/todo_repository.dart';
import 'package:todo_list/app/domain/usecase/todo/create_todo_usecase.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/delete_all_todos_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/delete_todo_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/find_all_todos_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/find_todo_by_id_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/todo_usecases.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/toggle_is_completed_usecase_impl.dart';
import 'package:todo_list/app/domain/usecase/todo_impl/update_todo_usecase.dart';
import 'package:todo_list/app/presenter/view/pages/home_screen.dart';
import 'package:todo_list/app/presenter/view_model/todo_view_model.dart';
import 'package:todo_list/utils/local_database.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<LocalDatabase>(
          create: (_) => LocalDatabase()..initDatabase(),
        ),
        ProxyProvider<LocalDatabase, TodoLocalDatasource>(
          update: (_, localDatabase, __) =>
              TodoLocalDatasourceImpl(localDatabase),
        ),
        ProxyProvider<TodoLocalDatasource, TodoRepository>(
          update: (_, localDatasource, __) =>
              TodoRepositoryImpl(localDatasource),
        ),
        ProxyProvider<TodoRepository, CreateTodoUsecase>(
          update: (_, repository, __) =>
              CreateTodoUsecaseImpl(todoRepository: repository),
        ),
        ProxyProvider<TodoRepository, FindAllTodosUsecase>(
          update: (_, repository, __) =>
              FindAllTodosUsecaseImpl(todoRepository: repository),
        ),
        ProxyProvider<TodoRepository, DeleteTodoUsecase>(
          update: (_, repository, __) =>
              DeleteTodoUsecaseImpl(todoRepository: repository),
        ),
        ProxyProvider<TodoRepository, CreateRandomTodosUsecase>(
          update: (_, repository, __) =>
              CreateRandomTodosUsecaseImpl(todoRepository: repository),
        ),
        ProxyProvider<TodoRepository, FindTodoByIdUsecase>(
          update: (_, repository, __) =>
              FindTodoByIdUsecaseImpl(todoRepository: repository),
        ),
        ProxyProvider<TodoRepository, DeleteAllTodosUsecase>(
          update: (_, repository, __) =>
              DeleteAllTodosUsecaseImpl(todoRepository: repository),
        ),
        ProxyProvider<TodoRepository, UpdateTodoUsecase>(
          update: (_, repository, __) =>
              UpdateTodoUsecaseImpl(todoRepository: repository),
        ),
        ProxyProvider2<UpdateTodoUsecase, FindTodoByIdUsecase,
            ToggleIsCompletedUsecase>(
          update: (_, updateTodoUsecase, findTodoByIdUsecase, __) =>
              ToggleIsCompletedUsecaseImpl(
            updateTodoUsecase: updateTodoUsecase,
            findTodoByIdUsecase: findTodoByIdUsecase,
          ),
        ),

        // ChangeNotifierProxyProvider para o TodoViewModel
        ProxyProvider<TodoRepository, TodoUseCases>(
          update: (_, repository, __) => TodoUseCases(
            createTodo: CreateTodoUsecaseImpl(todoRepository: repository),
            createRandomTodos:
                CreateRandomTodosUsecaseImpl(todoRepository: repository),
            findAll: FindAllTodosUsecaseImpl(todoRepository: repository),
            delete: DeleteTodoUsecaseImpl(todoRepository: repository),
            deleteAll: DeleteAllTodosUsecaseImpl(todoRepository: repository),
            update: UpdateTodoUsecaseImpl(todoRepository: repository),
            toggle: ToggleIsCompletedUsecaseImpl(
              updateTodoUsecase:
                  UpdateTodoUsecaseImpl(todoRepository: repository),
              findTodoByIdUsecase:
                  FindTodoByIdUsecaseImpl(todoRepository: repository),
            ),
          ),
        ),

        /// Presentation layer
        ChangeNotifierProxyProvider<TodoUseCases, TodoViewModel>(
          create: (_) => TodoViewModel(useCases: null), // temporary safe value
          update: (_, useCases, viewModel) {
            viewModel!.useCases = useCases;
            return viewModel;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Todo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Urbanist',
          useMaterial3: true,
        ),
        home: HomeScreen());
  }
}
