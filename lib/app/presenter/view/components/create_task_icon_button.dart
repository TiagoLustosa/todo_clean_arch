import 'package:flutter/material.dart';
import 'package:todo_list/utils/custom_colors.dart';

class CreateTaskIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CreateTaskIconButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.blue10,
        ),
        child: TextButton.icon(
          icon: Icon(Icons.add, color: CustomColors.blue, size: 24),
          onPressed: onPressed,
          label: Text(
            'Create task',
            style: TextStyle(
                color: CustomColors.blue,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
