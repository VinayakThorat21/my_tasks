import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:my_tasks/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Make Coffee'),
    Task(name: 'Drink Water')
  ];

  // Get values
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get totalTasks {
    return _tasks.length;
  }

  int get remainingTasks {
    int undone = 0;
    for (var task in _tasks) {
      if (!task.isDone) {
        undone++;
      }
    }
    return undone;
  }

  // Operations
  void tickTask(int index) {
    _tasks[index].taskStatus();
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
