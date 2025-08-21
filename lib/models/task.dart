class Task {
  final int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime? deadline;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.deadline,
    this.isCompleted = false, required DateTime updatedAt,
  });
}
