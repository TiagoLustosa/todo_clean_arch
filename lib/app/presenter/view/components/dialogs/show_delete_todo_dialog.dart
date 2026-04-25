import 'package:flutter/material.dart';
import 'package:todo_list/utils/custom_colors.dart';

Future<void> showDeleteTodoDialog(
  BuildContext context,
  VoidCallback onDelete,
  bool allTodos,
) async {
  final message = allTodos ? "all todos" : "this todo";

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete $message'),
        content: Text('Are you sure you want to delete $message?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: CustomColors.blue,
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onDelete,
            style: TextButton.styleFrom(
              foregroundColor: CustomColors.fireRed,
            ),
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}
