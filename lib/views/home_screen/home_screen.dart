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
  List<Task> tasks = List.from(dummyTasks);

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
      tasks[index].completed = !tasks[index].completed;

      showSmallSnackBar(
        tasks[index].completed ? 'Completed!' : 'Pending Again!',
        tasks[index].completed
            ? '${tasks[index].title} marked as completed 🎉'
            : '${tasks[index].title} marked as pending',
        tasks[index].completed ? ContentType.success : ContentType.warning,
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

  Future<bool> onWillPop() async {
    final now = DateTime.now();
    if (lastBackPressed == null ||
        now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
      lastBackPressed = now;

      showSmallSnackBar(
        'Hold on!',
        'Press back again to exit',
        ContentType.warning,
      );

      return false;
    }
    return true;
  }

  Widget _buildTaskList() {
    return ListView.builder(
      padding: AppUnits.a16,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(
          task: tasks[index],
          onEdit: () => editTask(index),
          onToggleComplete: () => toggleComplete(index),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
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
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
        ),
      ),
    );
  }
}
