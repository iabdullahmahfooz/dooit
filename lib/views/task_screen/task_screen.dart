import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/mocks/mock_tasks.dart';
import 'package:dooit/widgets/task_card.dart';
import 'package:dooit/models/task.dart';
import 'package:dooit/widgets/custom_bottom_navbar.dart';
import 'package:dooit/theme/units.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime? lastBackPressed;

  void showSmallSnackBar(String title, String message, ContentType type) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      content: Transform.scale(
        scale: 0.85,
        child: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: type,
        ),
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void _onPopInvokedWithResult(bool didPop, Object? result) {
    if (didPop) return;

    final now = DateTime.now();
    if (lastBackPressed == null ||
        now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
      lastBackPressed = now;

      showSmallSnackBar(
        'Hold on!',
        'Press back again to exit',
        ContentType.warning,
      );
    } else {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = mockTasks;

    final List<Task> pendingTasks = tasks
        .where((task) => task.isCompleted == false)
        .toList();
    final List<Task> completedTasks = tasks
        .where((task) => task.isCompleted == true)
        .toList();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvokedWithResult,
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
                    _buildTaskList(tasks),
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
          return TaskCard(
            task: task,
            onEdit: () {
              debugPrint("Edit tapped for ${task.title}");
            },
            onComplete: () {
              debugPrint("Completed tapped for ${task.title}");
            },
          );
        },
      ),
    );
  }
}
