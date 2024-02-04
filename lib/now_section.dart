// now_section.dart
import 'package:flutter/material.dart';
import 'section_container.dart';
import 'expandable_task_tile.dart';
import 'task.dart';

class NowSection extends StatelessWidget {
  final List<Task> nowTasks;
  final Function(Task) onTaskChecked;
  final Function(String) onAddTask;

  NowSection(this.nowTasks, this.onTaskChecked, this.onAddTask);

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Now',
      tasks: nowTasks,
      onTaskChecked: onTaskChecked,
      onAddTask: () {
        onAddTask('Now');
      },
    );
  }
}
