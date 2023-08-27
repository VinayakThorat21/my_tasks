import 'package:flutter/material.dart';
import 'package:my_tasks/tasks/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:my_tasks/models/task_data.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) => TaskTile(
            task: taskData.tasks[index].name,
            status: taskData.tasks[index].isDone,
            tickTask: (status) {
              taskData.tickTask(index);
            },
            deleteTask: () {
              taskData.removeTask(taskData.tasks[index]);
            },
          ),
          itemCount: taskData.totalTasks,
        );
      },
    );
  }
}
