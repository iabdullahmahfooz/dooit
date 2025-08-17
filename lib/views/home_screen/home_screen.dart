import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/widgets/task_card.dart';
import 'package:dooit/widgets/custom_appbar.dart';
import 'package:dooit/widgets/custom_bottom_navbar.dart';
import 'package:dooit/models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(
      title: "Exercise",
      description: "Carry out a yoga session",
      time: "10:30 PM 19 Feb, 2025",
    ),
    Task(
      title: "Code Review",
      description: "Review pull requests for the authentication module.",
      time: "01:00 PM 19 Feb, 2025",
    ),
    Task(
      title: "Project Update",
      description: "Send weekly progress report to the manager.",
      time: "05:00 PM 19 Feb, 2025",
      completed: true,
    ),
  ];

  DateTime? lastBackPressed;
  int currentIndex = 0;

  void toggleComplete(int index) {
    setState(() {
      tasks[index].completed = !tasks[index].completed;
    });
  }

  void editTask(int index) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Edit ${tasks[index].title}")));
  }

  Future<bool> onWillPop() async {
    final now = DateTime.now();
    if (lastBackPressed == null ||
        now.difference(lastBackPressed!) > Duration(seconds: 2)) {
      lastBackPressed = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Press back again to exit"),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true;
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
              Expanded(
                child: ListView.builder(
                  padding: AppUnits.a16,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskCard(
                      title: task.title,
                      description: task.description,
                      time: task.time,
                      isCompleted: task.completed,
                      onEdit: () => editTask(index),
                      onToggleComplete: () => toggleComplete(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
