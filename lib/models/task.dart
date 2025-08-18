class Task {
  String title;
  String description;
  String time;
  bool completed;

  Task({
    required this.title,
    required this.description,
    required this.time,
    this.completed = false,
  });
}

List<Task> dummyTasks = [
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
