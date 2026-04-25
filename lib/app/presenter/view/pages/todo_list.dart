import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/presenter/view/components/no_todo_found.dart';
import 'package:todo_list/app/presenter/view/components/todo_item.dart';
import 'package:todo_list/app/presenter/view/components/welcome.dart';
import 'package:todo_list/app/presenter/view_model/todo_view_model.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;
      context.read<TodoViewModel>().loadTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TodoViewModel>();

    if (vm.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 Avoid calling watch() twice
          Welcome(
            text: 'You\'ve got ${vm.todos.length} tasks to do.',
          ),

          const SizedBox(height: 16),

          Expanded(
            child: vm.todos.isEmpty
                ? const Center(
                    child: NoTodoFound(text: 'No todos found.'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: vm.todos
                          .map(
                            (todo) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: TodoItem(
                                todo: todo,
                                onTap: () {
                                  vm.toggleIsCompletedTodo(todo);
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
