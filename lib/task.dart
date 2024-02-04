// task.dart
import 'package:intl/intl.dart';

String formatDate(DateTime? dateTime) {
  if (dateTime != null) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }
  return 'N/A';
}

class Task {
  String title;
  String description;
  bool isDone;
  DateTime? dateCreated;
  DateTime? dateCompleted;

  Task({
    required this.title,
    required this.description,
    this.isDone = false,
  }) : dateCreated = DateTime.now();

  void markCompleted() {
    if (!isDone) {
      isDone = true;
      dateCompleted = DateTime.now();
    }
  }
}
