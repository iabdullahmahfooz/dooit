import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/models/task.dart';

class UndoButton extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onUndo;

  const UndoButton({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onUndo,
  });

  void show(BuildContext context) {
    onDelete();

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Task '${task.title}' deleted",
          style: AppText.b2.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "UNDO",
          textColor: AppColors.scaffoldBackgroundColor,
          onPressed: onUndo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This widget itself isn’t shown directly in UI,
    // it’s only used via .show(context)
    return const SizedBox.shrink();
  }
}
