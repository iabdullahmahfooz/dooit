import 'package:dooit/models/task.dart';

class TaskController {
  static final TaskController _instance = TaskController._internal();
  factory TaskController() => _instance;

  TaskController._internal();

  final List<Task> _tasks = [];
  int _idCounter = 0;

  List<Task> get tasks => _tasks;

  void addTask(String title, String description, DateTime deadline) {
    final now = DateTime.now();
    final task = Task(
      id: _idCounter++,
      title: title,
      description: description,
      createdAt: now,
      updatedAt: now,
      deadline: deadline,
      isCompleted: false,
    );
    _tasks.add(task);
  }

  void restoreTask(Task task, int index) {
    final restoredTask = task.copyWith(updatedAt: DateTime.now());

    if (index >= 0 && index <= _tasks.length) {
      _tasks.insert(index, restoredTask);
    } else {
      _tasks.add(restoredTask);
    }
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
      _tasks[index] = _tasks[index].copyWith(
        title: title,
        description: description,
        deadline: deadline,
        isCompleted: isCompleted,
        updatedAt: DateTime.now(),
      );
    }
  }

  void toggleTaskStatus(int id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      final task = _tasks[index];
      _tasks[index] = task.copyWith(
        isCompleted: !task.isCompleted,
        updatedAt: DateTime.now(),
      );
    }
  }

  void deleteTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
  }
}
