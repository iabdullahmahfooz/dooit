import 'package:dooit/models/task.dart';

class TaskController {
  static final TaskController _instance = TaskController._internal();
  factory TaskController() => _instance;

  TaskController._internal();

  final List<Task> _tasks = [];
  int _idCounter = 0;

  List<Task> get tasks => _tasks;

  void addTask(String title, String description, DateTime deadline) {
    final task = Task(
      id: _idCounter++,
      title: title,
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deadline: deadline,
      isCompleted: false,
    );
    _tasks.add(task);
  }

  void editTask(
    int id,
    String title,
    String description,
    DateTime deadline,
    bool isCompleted,
  ) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = Task(
        id: id,
        title: title,
        description: description,
        createdAt: _tasks[index].createdAt,
        updatedAt: DateTime.now(),
        deadline: deadline,
        isCompleted: isCompleted,
      );
    }
  }

  void toggleTaskStatus(int id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      final task = _tasks[index];
      _tasks[index] = Task(
        id: task.id,
        title: task.title,
        description: task.description,
        createdAt: task.createdAt,
        updatedAt: DateTime.now(),
        deadline: task.deadline,
        isCompleted: !task.isCompleted,
      );
    }
  }
}
