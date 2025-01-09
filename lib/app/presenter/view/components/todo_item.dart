import 'package:flutter/material.dart';
import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/utils/custom_colors.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onTap;

  const TodoItem({
    super.key,
    required this.todo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CustomColors.paleWhite,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        spacing: 16,
        crossAxisAlignment: todo.description.isNotEmpty
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
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
              onPressed: onTap,
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
                if (todo.description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    todo.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColors.stateBlue,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (todo.description.isEmpty)
            Text(
              '...',
              style: TextStyle(
                  fontSize: 24,
                  color: CustomColors.statePurple,
                  fontWeight: FontWeight.w700),
            ),
        ],
      ),
    );
  }
}
