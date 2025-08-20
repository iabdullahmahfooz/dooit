import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/models/task.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onEdit;
  final VoidCallback onComplete;

  const TaskCard({
    super.key,
    required this.task,
    required this.onEdit,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'hh:mm a • dd MMM, yyyy',
    ).format(task.createdAt);

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
                Text(formattedDate, style: AppText.b3),
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
