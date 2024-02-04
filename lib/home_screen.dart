// home_screen.dart
import 'package:flutter/material.dart';
import 'section_container.dart';
import 'expandable_task_tile.dart';
import 'completed_tasks_screen.dart';
import 'task.dart';
import 'now_section.dart';
import 'next_section.dart';
import 'later_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> nowTasks = [];
  List<Task> nextTasks = [];
  List<Task> laterTasks = [];
  List<Task> completedTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NowSection(nowTasks, onTaskChecked, onAddTask),
            NextSection(nextTasks, onTaskChecked, onAddTask),
            LaterSection(laterTasks, onTaskChecked, onAddTask),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CompletedTasksScreen(completedTasks: completedTasks)),
          );
        },
        child: Icon(Icons.done),
      ),
    );
  }

  void onTaskChecked(Task task) {
    setState(() {
      nowTasks.remove(task);
      nextTasks.remove(task);
      laterTasks.remove(task);
      completedTasks.add(task);

      // Assign the date and time of completion directly
      task.dateCompleted = DateTime.now();
    });
  }

  void onAddTask(String section) {
    Task newTask = Task(
      title: '',
      description: '',
    );

    setState(() {
      if (section == 'Now' && nowTasks.length < 5) {
        nowTasks.add(newTask);
      } else if (section == 'Next') {
        nextTasks.add(newTask);
      } else if (section == 'Later') {
        laterTasks.add(newTask);
      }
    });
  }
}
