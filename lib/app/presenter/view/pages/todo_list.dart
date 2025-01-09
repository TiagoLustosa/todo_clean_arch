import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/presenter/view_model/todo_view_model.dart';
import 'package:todo_list/app/presenter/view/components/no_todo_found.dart';
import 'package:todo_list/app/presenter/view/components/todo_item.dart';
import 'package:todo_list/app/presenter/view/components/welcome.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: FutureBuilder(
        future: Provider.of<TodoViewModel>(context, listen: false).loadTodos(),
        builder: (context, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Welcome(
                text:
                    'You\'ve got ${context.watch<TodoViewModel>().todos.length} tasks to do.',
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Consumer<TodoViewModel>(
                  builder: (context, viewModel, child) {
                    if (viewModel.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (viewModel.todos.isEmpty) {
                      return Center(
                        child: const NoTodoFound(text: 'No todos found.'),
                      );
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          ...viewModel.todos.map(
                            (todo) => TodoItem(
                              todo: todo,
                              onTap: () {
                                viewModel.toggleIsCompletedTodo(todo);
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
