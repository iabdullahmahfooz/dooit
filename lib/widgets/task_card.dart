import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onEdit;
  final VoidCallback onToggleComplete;

  const TaskCard({
    super.key,
    required this.task,
    required this.onEdit,
    required this.onToggleComplete,
  });

  @override
  Widget build(BuildContext context) {
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
                Text(task.title, style: AppText.h3),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit, size: 20),
                  onPressed: onEdit,
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
                Text(task.time, style: AppText.b3),
                const Spacer(),
                GestureDetector(
                  onTap: onToggleComplete,
                  child: Row(
                    children: [
                      Text(
                        "Mark as completed",
                        style: AppText.b3.copyWith(
                          color: task.completed
                              ? Colors.green
                              : AppColors.greyColor,
                        ),
                      ),
                      AppUnits.x8,
                      Icon(
                        task.completed
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: task.completed
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
