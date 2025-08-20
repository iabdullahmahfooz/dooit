import 'package:dooit/mocks/mock_tasks.dart';
import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/widgets/task_card.dart';
import 'package:dooit/widgets/custom_appbar.dart';
import 'package:dooit/widgets/custom_bottom_navbar.dart';
import 'package:dooit/models/task.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = List.from(mockTasks);

  DateTime? lastBackPressed;
  int currentIndex = 0;

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
      tasks[index].isCompleted = !tasks[index].isCompleted;

      showSmallSnackBar(
        tasks[index].isCompleted ? 'Completed!' : 'Pending Again!',
        tasks[index].isCompleted
            ? '${tasks[index].title} marked as completed 🎉'
            : '${tasks[index].title} marked as pending',
        tasks[index].isCompleted ? ContentType.success : ContentType.warning,
      );
    });
  }

  void editTask(int index) {
    showSmallSnackBar(
      'Edit Task',
      'Editing ${tasks[index].title}',
      ContentType.help,
    );
  }

  void _onPopInvokedWithResult(bool didPop, Object? result) {
    if (didPop) return; // If pop was allowed, do nothing

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
      // Allow pop to exit the app
      Navigator.of(context).pop(true);
    }
  }

  Widget _buildTaskList() {
    return ListView.builder(
      padding: AppUnits.a16,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(
          task: tasks[index],
          onEdit: () => editTask(index),
          onComplete: () => toggleComplete(index),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent default pop behavior
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
        bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
      ),
    );
  }
}
