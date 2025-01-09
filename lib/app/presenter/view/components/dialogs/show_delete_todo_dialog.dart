import 'package:flutter/material.dart';
import 'package:todo_list/utils/custom_colors.dart';

Future<void> showDeleteTodoDialog(
    BuildContext context, VoidCallback onDelete, bool allTodos) async {
  String messageAllTodos = "este todo";
  allTodos ? messageAllTodos = "TODOS os todos" : "este todo";
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Excluir $messageAllTodos'),
        content:
            Text('Você tem certeza de que deseja excluir $messageAllTodos?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: CustomColors.blue,
            ),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: onDelete,
            style: TextButton.styleFrom(
              foregroundColor: CustomColors.fireRed,
            ),
            child: const Text('Excluir'),
          ),
        ],
      );
    },
  );
}
