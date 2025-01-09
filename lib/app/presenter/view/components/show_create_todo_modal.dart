import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/presenter/view_model/todo_view_model.dart';
import 'package:todo_list/app/domain/entity/todo.dart';
import 'package:todo_list/utils/custom_colors.dart';

void showCreateTodoModal(BuildContext context) {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final viewModel = Provider.of<TodoViewModel>(context, listen: false);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
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
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: TextField(
                      controller: titleController,
                      style: TextStyle(
                          color: CustomColors.stateBlue, fontSize: 10),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.stateBlue),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.stateBlue),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: CustomColors.stateBlue),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: "What's in your mind?",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                            color: CustomColors.stateBlue, fontSize: 10),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: BoxDecoration(
                border: Border.all(
                  color: CustomColors.mutedAzure,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: descriptionController,
                maxLines: null,
                style: TextStyle(
                  color: CustomColors.stateBlue,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  prefixIcon: Icon(
                    Icons.edit,
                    color: CustomColors.stateBlue,
                  ),
                  hintText: 'Add a note',
                  hintStyle: TextStyle(
                    color: CustomColors.stateBlue,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Todo todo = Todo(
                    title: titleController.text,
                    isCompleted: false,
                    description: descriptionController.text,
                  );

                  viewModel.createTodoUsecase!(todo);
                  viewModel.loadTodos();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Create Todo',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}
