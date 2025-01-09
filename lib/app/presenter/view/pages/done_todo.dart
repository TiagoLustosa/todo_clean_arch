import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/presenter/view_model/todo_view_model.dart';
import 'package:todo_list/app/presenter/view/components/delete_all_todos.dart';
import 'package:todo_list/app/presenter/view/components/delete_todo_item.dart';
import 'package:todo_list/app/presenter/view/components/dialogs/show_delete_todo_dialog.dart';
import 'package:todo_list/app/presenter/view/components/dialogs/show_toggle_todo_dialog.dart';
import 'package:todo_list/app/presenter/view/components/no_todo_found.dart';

class DoneTodo extends StatefulWidget {
  const DoneTodo({super.key});

  @override
  State<DoneTodo> createState() => _DoneTodoState();
}

class _DoneTodoState extends State<DoneTodo> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TodoViewModel>(context, listen: false).finishedTodos());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
              DeleteAllTodos(
                onPressed: () => showDeleteTodoDialog(context, () {
                  viewModel.deleteAllTodos();
                  Navigator.of(context).pop();
                }, true),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: viewModel.completedTodos.isEmpty
                    ? Center(
                        child: const NoTodoFound(
                            text: 'No completed todos found.'))
                    : CustomScrollView(
                        controller: _scrollController,
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final todo = viewModel.completedTodos[index];
                                return Column(
                                  children: [
                                    DeleteTodoItem(
                                      onPressedToggle: () =>
                                          showToggleTodoDialog(context, () {
                                        viewModel.toggleIsCompletedTodo(todo);
                                        Navigator.of(context).pop();
                                      }),
                                      todo: todo,
                                      onPressed: () =>
                                          showDeleteTodoDialog(context, () {
                                        viewModel.deleteTodo(todo);
                                        Navigator.of(context).pop();
                                      }, false),
                                    ),
                                    if (index <
                                        viewModel.completedTodos.length - 1)
                                      const SizedBox(height: 16),
                                  ],
                                );
                              },
                              childCount: viewModel.completedTodos.length,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
