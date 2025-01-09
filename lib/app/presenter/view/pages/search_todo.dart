import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/presenter/view_model/todo_view_model.dart';
import 'package:todo_list/app/presenter/view/components/no_todo_found.dart';
import 'package:todo_list/app/presenter/view/components/todo_item.dart';

class SearchTodo extends StatelessWidget {
  const SearchTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TodoViewModel>(context, listen: false).loadTodos(),
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Consumer<TodoViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBar(
                    hintText: 'Search here',
                    onChanged: (query) {
                      viewModel.searchTodos(query);
                    },
                  ),
                  const SizedBox(height: 16),
                  // if (viewModel.connectionState == ConnectionState.waiting)
                  //   const Expanded(
                  //     child: Center(child: CircularProgressIndicator()),
                  //   )
                  if (viewModel.filteredTodos.isEmpty)
                    const Expanded(
                      child: Center(
                        child: NoTodoFound(text: 'No result found.'),
                      ),
                    )
                  else
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...viewModel.filteredTodos.map(
                              (todo) => TodoItem(
                                todo: todo,
                                onTap: () async {
                                  await viewModel.toggleIsCompletedTodo(todo);
                                  viewModel.searchTodos(
                                      viewModel.currentSearchQuery);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
