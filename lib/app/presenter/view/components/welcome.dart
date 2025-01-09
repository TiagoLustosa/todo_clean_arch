// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_list/utils/custom_colors.dart';

class Welcome extends StatelessWidget {
  final String text;
  const Welcome({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Welcome, ',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600, // Negrito
              fontSize: 24,
              color: CustomColors.statePurple, // Cor roxa
            ),
            children: [
              TextSpan(
                text: 'John.',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold, // Negrito mais destacado
                  fontSize: 24,
                  color: CustomColors.blue, // Cor azul
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4), // Espaço entre as linhas
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w400, // Peso regular
            fontSize: 16,
            color: CustomColors.statePurple, // Cor roxa
          ),
        ),
      ],
    );
  }
}
