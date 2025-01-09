import 'package:flutter/material.dart';
import 'package:todo_list/utils/custom_colors.dart';

Future<void> showToggleTodoDialog(
    BuildContext context, VoidCallback onToggle) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alterar Status'),
        content: const Text(
            'Deseja alterar o status deste todo para não completado?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: CustomColors.fireRed,
            ),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: onToggle,
            style: TextButton.styleFrom(
              foregroundColor: CustomColors.blue,
            ),
            child: const Text('Alterar'),
          ),
        ],
      );
    },
  );
}
