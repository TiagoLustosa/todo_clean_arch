import 'package:flutter/material.dart';
import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/utils/custom_colors.dart';

class DeleteTodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedToggle;

  const DeleteTodoItem({
    super.key,
    required this.todo,
    required this.onPressedToggle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CustomColors.paleWhite,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: CustomColors.mutedAzure,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              width: 48,
              height: 48,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onPressedToggle,
                icon: Icon(
                  Icons.check,
                  size: 32,
                  color: todo.isCompleted
                      ? CustomColors.statePurple
                      : CustomColors.paleWhite,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.statePurple,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                icon: Icon(
                  Icons.delete,
                  color: CustomColors.fireRed,
                  size: 32,
                ))
          ],
        ),
      ),
    );
  }
}
