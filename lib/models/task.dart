class Task {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.isCompleted,
  });
}
