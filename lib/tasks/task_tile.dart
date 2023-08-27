import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.status,
      required this.task,
      required this.tickTask,
      this.deleteTask});

  final bool status;
  final String task;
  final Function(bool?)? tickTask;
  final Function()? deleteTask;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task,
        style: TextStyle(
          decoration: status ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: status,
        onChanged: tickTask,
      ),
      onLongPress: deleteTask,
    );
  }
}
