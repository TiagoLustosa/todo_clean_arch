import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/presenter/view_model/todo_view_model.dart';
import 'package:todo_list/app/presenter/view/components/create_task_icon_button.dart';
import 'package:todo_list/app/presenter/view/components/no_todo_found.dart';
import 'package:todo_list/app/presenter/view/components/show_create_todo_modal.dart';
import 'package:todo_list/app/presenter/view/components/welcome.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  late TodoViewModel todoViewModel;
  @override
  void initState() {
    super.initState();
    todoViewModel = context.read<TodoViewModel>();
    Future.microtask(() {
      if (!mounted) return;
      todoViewModel.loadTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Consumer<TodoViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Welcome(text: 'Create tasks to achieve more.'),
              TextButton(
                onPressed: () async {
                  await todoViewModel.createRandomTodos();
                  // Recarrega a lista após criar todos aleatórios
                  if (!mounted) return;
                  todoViewModel.loadTodos();
                },
                child: const Text(
                  'Hidden Button to create random todos',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NoTodoFound(
                          text:
                              'You have ${viewModel.todos.length} task listed.'),
                      const SizedBox(
                          height: 16), // Usando SizedBox em vez de spacing
                      CreateTaskIconButton(
                        onPressed: () {
                          showCreateTodoModal(
                              context); // Removido setState desnecessário
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
