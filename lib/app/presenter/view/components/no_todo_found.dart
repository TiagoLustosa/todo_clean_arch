import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/utils/custom_colors.dart';

class NoTodoFound extends StatelessWidget {
  final String text;
  const NoTodoFound({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/no_data.svg'),
        Text(
          text,
          style: TextStyle(color: CustomColors.stateBlue, fontSize: 16),
        )
      ],
    );
  }
}
