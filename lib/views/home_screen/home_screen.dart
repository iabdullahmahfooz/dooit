import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tasks = [
    {
      "title": "Exercise",
      "description": "Carry out a yoga session",
      "time": "10:30 PM 19 Feb, 2025",
      "completed": false,
    },
    {
      "title": "Code Review",
      "description": "Review pull requests for the authentication module.",
      "time": "01:00 PM 19 Feb, 2025",
      "completed": false,
    },
    {
      "title": "Project Update",
      "description": "Send weekly progress report to the manager.",
      "time": "05:00 PM 19 Feb, 2025",
      "completed": true,
    },
  ];

  void toggleComplete(int index) {
    setState(() {
      tasks[index]["completed"] = !tasks[index]["completed"];
    });
  }

  void editTask(int index) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Edit ${tasks[index]["title"]}")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppUnits.a16,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.purple[100],
                    child: Text("A", style: AppText.h3),
                  ),
                  const Spacer(),
                  const Icon(Icons.search),
                  AppUnits.x16,
                  const Icon(Icons.notifications_none),
                ],
              ),
            ),

            Padding(
              padding: AppUnits.a16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Hello Abdullah", style: AppText.h2),
                      AppUnits.x8,
                      const Text("👋", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AppUnits.y8,
                  Text(
                    "Let’s get started keeping your tasks organized",
                    style: AppText.b2.copyWith(color: AppColors.greyColor),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: AppUnits.a16,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskCard(
                    title: task["title"],
                    description: task["description"],
                    time: task["time"],
                    isCompleted: task["completed"],
                    onEdit: () => editTask(index),
                    onToggleComplete: () => toggleComplete(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Add task",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Task"),
        ],
      ),
    );
  }
}
