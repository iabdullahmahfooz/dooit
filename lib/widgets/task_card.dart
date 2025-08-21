import 'package:dooit/views/add_task_screen/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/models/task.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onComplete;

  const TaskCard({super.key, required this.task, required this.onComplete});

  void _editTask(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TaskFormScreen(task: task), // ✅ pass task for editing
      ),
    );

    if (result == true) {
      // ✅ Optionally refresh UI after editing
      // (your HomeScreen should already reload tasks in setState after pop)
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDeadline = DateFormat(
      'hh:mm a • dd MMM, yyyy',
    ).format(task.createdAt); // ✅ show deadline instead of createdAt

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: AppUnits.a16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    style: AppText.h3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, size: 20),
                  onPressed: () => _editTask(context), // ✅ open edit form
                ),
              ],
            ),
            AppUnits.y8,

            Text(
              task.description,
              style: AppText.b2.copyWith(color: AppColors.greyColor),
            ),
            AppUnits.y12,

            Row(
              children: [
                Text(formattedDeadline, style: AppText.b3),
                const Spacer(),
                GestureDetector(
                  onTap: onComplete,
                  child: Row(
                    children: [
                      Text(
                        task.isCompleted ? "Completed" : "Mark as completed",
                        style: AppText.b3.copyWith(
                          color: task.isCompleted
                              ? Colors.green
                              : AppColors.greyColor,
                        ),
                      ),
                      AppUnits.x8,
                      Icon(
                        task.isCompleted
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: task.isCompleted
                            ? Colors.green
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
