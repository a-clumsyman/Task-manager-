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
  void initState() {
    super.initState();
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
  }

  @override
  Widget build(BuildContext context) {
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
                    decoration: InputDecoration(labelText: 'Edit Task Title'),
                  ),
                )
              : Expanded(
                  child: Text(widget.task.title),
                ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isEditing
                  ? TextField(
                      controller: descriptionController,
                      decoration:
                          InputDecoration(labelText: 'Edit Task Description'),
                    )
                  : Text('Description: ${widget.task.description}'),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isEditing) {
                      widget.task.title = titleController.text;
                      widget.task.description = descriptionController.text;
                    }
                    isEditing = !isEditing;
                  });
                },
                child: Text(isEditing ? 'Save Changes' : 'Edit Task'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
