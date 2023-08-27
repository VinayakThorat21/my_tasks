import 'package:flutter/material.dart';
import 'package:my_tasks/models/task_data.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyTodoApp());

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (_) => TaskData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}
