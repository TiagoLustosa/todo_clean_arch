// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_list/utils/custom_colors.dart';

class DeleteAllTodos extends StatelessWidget {
  final VoidCallback onPressed;
  const DeleteAllTodos({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Completed Tasks',
          style: TextStyle(
            color: CustomColors.statePurple,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              'Delete all',
              style: TextStyle(
                color: CustomColors.fireRed,
                fontSize: 18,
              ),
            ))
      ],
    );
  }
}
