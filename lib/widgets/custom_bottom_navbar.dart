import 'package:dooit/views/add_task_screen/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:dooit/views/home_screen/home_screen.dart';
import 'package:dooit/views/task_screen/task_screen.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, this.currentIndex = 0});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return; // prevent reloading same screen

    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
        break;
      case 1: // Add Task
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddTaskScreen()),
        );
        break;
      case 2: // Task
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const TaskScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: "Add task",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.check), label: "Task"),
      ],
    );
  }
}
