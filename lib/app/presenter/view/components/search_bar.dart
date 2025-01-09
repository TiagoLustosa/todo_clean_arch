import 'package:flutter/material.dart';
import 'package:todo_list/utils/custom_colors.dart';

class SearchTodoBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onClear;

  const SearchTodoBar({
    super.key,
    required this.controller,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: 'Search here',
      backgroundColor: WidgetStatePropertyAll(CustomColors.paleWhite),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
      elevation: const WidgetStatePropertyAll(0), // Remove a sombra

      leading: Icon(
        Icons.search,
        color: CustomColors.blue,
      ),
      onChanged: (value) {
        // Adicione lógica caso queira manipular a entrada
      },
      trailing: [
        SizedBox(
          height: 48,
          width: 48,
          child: IconButton(
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(
              iconSize: 20,
              disabledBackgroundColor: CustomColors.mutedAzure,
              shape: CircleBorder(),
            ),
            onPressed: onClear,
            icon: Icon(
              Icons.clear_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: CustomColors.statePurple,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      hintStyle: WidgetStatePropertyAll(
        TextStyle(
          color: CustomColors.statePurple.withOpacity(0.6),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: CustomColors.blue10,
            width: 1,
          ),
        ),
      ),
    );
  }
}
