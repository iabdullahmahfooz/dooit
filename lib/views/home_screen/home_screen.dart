import 'package:dooit/mocks/mock_tasks.dart';
import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/widgets/task_card.dart';
import 'package:dooit/widgets/custom_appbar.dart';
import 'package:dooit/widgets/custom_bottom_navbar.dart';
import 'package:dooit/controllers/task_controller.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController taskController = TaskController();
  DateTime? lastBackPressed;

  @override
  void initState() {
    super.initState();

    if (taskController.tasks.isEmpty) {
      taskController.tasks.addAll(mockTasks);
    }
  }

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

  void toggleComplete(int index) {
    setState(() {
      final task = taskController.tasks[index];

      taskController.toggleTaskStatus(task.id);

      final updatedTask = taskController.tasks[index];

      showSmallSnackBar(
        updatedTask.isCompleted ? 'Completed!' : 'Pending Again!',
        updatedTask.isCompleted
            ? '${updatedTask.title} marked as completed 🎉'
            : '${updatedTask.title} marked as pending',
        updatedTask.isCompleted ? ContentType.success : ContentType.warning,
      );
    });
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

  Widget _buildTaskList() {
    return ListView.builder(
      padding: AppUnits.a16,
      itemCount: taskController.tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(
          task: taskController.tasks[index],
          onComplete: () => toggleComplete(index),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvokedWithResult,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(userName: "Abdullah"),
              Expanded(child: _buildTaskList()),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
      ),
    );
  }
}
