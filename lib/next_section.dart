// next_section.dart
import 'package:flutter/material.dart';
import 'section_container.dart';
import 'expandable_task_tile.dart';
import 'task.dart';

class NextSection extends StatelessWidget {
  final List<Task> nextTasks;
  final Function(Task) onTaskChecked;
  final Function(String) onAddTask;

  NextSection(this.nextTasks, this.onTaskChecked, this.onAddTask);

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Next',
      tasks: nextTasks,
      onTaskChecked: onTaskChecked,
      onAddTask: () {
        onAddTask('Next');
      },
    );
  }
}
