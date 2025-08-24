class Task {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? deadline;
  final bool isCompleted;
  final DateTime updatedAt; // <-- ✅ actually store it

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.deadline,
    this.isCompleted = false,
    required this.updatedAt,
  });

  // ✅ Add copyWith to simplify edits/toggles
  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? deadline,
    bool? isCompleted,
    DateTime? updatedAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      deadline: deadline ?? this.deadline,
      isCompleted: isCompleted ?? this.isCompleted,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
