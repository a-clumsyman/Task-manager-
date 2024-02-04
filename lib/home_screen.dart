import 'package:flutter/material.dart';
import 'section_container.dart';
import 'expandable_task_tile.dart';
import 'completed_tasks_screen.dart';
import 'task.dart';

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
            SectionContainer(
              title: 'Now',
              tasks: nowTasks,
              onTaskChecked: onTaskChecked,
              onAddTask: () {
                _showAddTaskDialog('Now');
              },
            ),
            SectionContainer(
              title: 'Next',
              tasks: nextTasks,
              onTaskChecked: onTaskChecked,
              onAddTask: () {
                _showAddTaskDialog('Next');
              },
            ),
            SectionContainer(
              title: 'Later',
              tasks: laterTasks,
              onTaskChecked: onTaskChecked,
              onAddTask: () {
                _showAddTaskDialog('Later');
              },
            ),
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
    });
  }

  void _showAddTaskDialog(String section) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Task to $section'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Task Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Task Description'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Task newTask = Task(
                  title: titleController.text,
                  description: descriptionController.text,
                );

                setState(() {
                  if (section == 'Now') {
                    nowTasks.add(newTask);
                  } else if (section == 'Next') {
                    nextTasks.add(newTask);
                  } else if (section == 'Later') {
                    laterTasks.add(newTask);
                  }
                });

                Navigator.of(context).pop();
              },
              child: Text('Add Task'),
            ),
          ],
        );
      },
    );
  }
}
