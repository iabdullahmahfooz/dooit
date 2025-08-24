import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/widgets/task_card.dart';
import 'package:dooit/models/task.dart';
import 'package:dooit/widgets/custom_bottom_navbar.dart';
import 'package:dooit/theme/units.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dooit/controllers/task_controller.dart';
import 'package:dooit/utils/snackbar_helper.dart';
import 'package:dooit/widgets/undo_snackbar.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TaskController taskController = TaskController();
  DateTime? lastBackPressed;

  void toggleComplete(Task task) {
    setState(() {
      taskController.toggleTaskStatus(task.id);
      final updatedTask = taskController.tasks.firstWhere(
        (t) => t.id == task.id,
      );

      showSmallSnackBar(
        context,
        updatedTask.isCompleted ? "Completed!" : "Pending Again!",
        updatedTask.isCompleted
            ? "${updatedTask.title} marked as completed 🎉"
            : "${updatedTask.title} marked as pending",
        contentType: updatedTask.isCompleted
            ? ContentType.success
            : ContentType.warning,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Task> allTasks = taskController.tasks;
    final List<Task> pendingTasks = allTasks
        .where((t) => !t.isCompleted)
        .toList();
    final List<Task> completedTasks = allTasks
        .where((t) => t.isCompleted)
        .toList();

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final now = DateTime.now();
        if (lastBackPressed == null ||
            now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
          lastBackPressed = now;

          showSmallSnackBar(
            context,
            'Hold on!',
            'Press back again to exit',
            contentType: ContentType.warning,
          );
        } else {
          Navigator.of(context).maybePop();
        }
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Padding(
              padding: AppUnits.hx24,
              child: Text("Tasks", style: AppText.h2),
            ),
            bottom: TabBar(
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.greyColor,
              indicatorColor: AppColors.primaryColor,
              tabs: const [
                Tab(text: "All tasks"),
                Tab(text: "Pending"),
                Tab(text: "Completed"),
              ],
            ),
          ),
          body: Column(
            children: [
              AppUnits.y12,
              Expanded(
                child: TabBarView(
                  children: [
                    _buildTaskList(allTasks),
                    _buildTaskList(pendingTasks),
                    _buildTaskList(completedTasks),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
        ),
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    if (tasks.isEmpty) {
      return const Center(child: Text("No tasks available"));
    }
    return Padding(
      padding: AppUnits.hx24,
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Dismissible(
            key: Key(task.id.toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),

            onDismissed: (_) {
              UndoSnackbar(
                task: task,
                onDelete: () {
                  setState(() {
                    taskController.deleteTask(task.id);
                  });
                },
                onUndo: () {
                  setState(() {
                    taskController.restoreTask(task, index);
                  });
                },
              ).show(context);
            },
            child: TaskCard(task: task, onComplete: () => toggleComplete(task)),
          );
        },
      ),
    );
  }
}
