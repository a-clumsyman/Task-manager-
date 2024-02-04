// later_section.dart
import 'package:flutter/material.dart';
import 'section_container.dart';
import 'expandable_task_tile.dart';
import 'task.dart';

class LaterSection extends StatelessWidget {
  final List<Task> laterTasks;
  final Function(Task) onTaskChecked;
  final Function(String) onAddTask;

  LaterSection(this.laterTasks, this.onTaskChecked, this.onAddTask);

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Later',
      tasks: laterTasks,
      onTaskChecked: onTaskChecked,
      onAddTask: () {
        onAddTask('Later');
      },
    );
  }
}
