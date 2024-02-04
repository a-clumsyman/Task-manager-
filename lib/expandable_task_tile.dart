// expandable_task_tile.dart
import 'package:flutter/material.dart';
import 'task.dart';

class ExpandableTaskTile extends StatefulWidget {
  final Task task;
  final Function(Task) onTaskChecked;

  ExpandableTaskTile({required this.task, required this.onTaskChecked});

  @override
  _ExpandableTaskTileState createState() => _ExpandableTaskTileState();
}

class _ExpandableTaskTileState extends State<ExpandableTaskTile> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    // Initialize the controllers directly in the build method
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;

    return ExpansionTile(
      title: Row(
        children: [
          Checkbox(
            value: widget.task.isDone,
            onChanged: (value) {
              setState(() {
                widget.task.isDone = value!;
                if (widget.task.isDone) {
                  // Call the callback to move the task to completed tasks
                  widget.onTaskChecked(widget.task);
                }
              });
            },
          ),
          isEditing
              ? Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Task Title'),
                    onChanged: (value) {
                      widget.task.title = value;
                    },
                  ),
                )
              : Text(
                  widget.task.title,
                  style: TextStyle(
                    decoration:
                        widget.task.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: isEditing
              ? TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Task Description'),
                  onChanged: (value) {
                    widget.task.description = value;
                  },
                )
              : Text(
                  widget.task.description,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (isEditing) {
                    // Save changes to the task when editing is complete
                    widget.task.title = titleController.text;
                    widget.task.description = descriptionController.text;
                  }
                  isEditing = !isEditing;
                });
              },
              child: Text(isEditing ? 'Save' : 'Edit'),
            ),
          ],
        ),
      ],
    );
  }
}
