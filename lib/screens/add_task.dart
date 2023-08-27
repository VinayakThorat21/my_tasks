import 'package:flutter/material.dart';
import 'package:my_tasks/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:my_tasks/models/task.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    String task = 'New Task';

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 40.0,
          right: 40.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newTask) {
                task = newTask;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 17.0,
                bottom: 10.0,
              ),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent),
                ),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false).addTask(
                    Task(name: task),
                  );
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
