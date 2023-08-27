import 'package:flutter/material.dart';
import 'package:my_tasks/screens/add_task.dart';
import 'package:provider/provider.dart';
import 'package:my_tasks/models/task_data.dart';
import 'package:my_tasks/tasks/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Consumer<TaskData>(
          builder: (context, taskData, Widget? child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 70.0,
                  bottom: 40.0,
                  left: 40.0,
                  right: 7.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        color: Colors.lightBlueAccent,
                        size: 60.0,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'My Todo',
                      style: TextStyle(
                        fontSize: 45.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 7.0),
                    Text(
                      taskData.remainingTasks == 0
                          ? 'You\'re all caught up!'
                          : (taskData.remainingTasks == 1
                              ? '${taskData.remainingTasks} Task to Go!'
                              : '${taskData.remainingTasks} Tasks to Go!'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: taskData.totalTasks != 0
                      ? const TaskList()
                      : const Center(
                          child: Icon(
                            Icons.task_alt_rounded,
                            color: Colors.lightBlueAccent,
                            size: 200.0,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: const AddTask(),
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}
