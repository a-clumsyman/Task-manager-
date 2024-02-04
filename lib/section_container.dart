// section_container.dart
import 'package:flutter/material.dart';
import 'task.dart';
import 'expandable_task_tile.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final List<Task> tasks;
  final Function(Task) onTaskChecked;
  final Function() onAddTask;

  SectionContainer(
      {required this.title,
      required this.tasks,
      required this.onTaskChecked,
      required this.onAddTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: onAddTask,
                icon: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(height: 8),
          Column(
            children: tasks
                .map(
                  (task) => ExpandableTaskTile(
                      task: task, onTaskChecked: onTaskChecked),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
