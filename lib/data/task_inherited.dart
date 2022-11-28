import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task("Aprender Flutter", 1, fotoUrl: "assets/images/flutter.png"),
    Task("Aprender SQL", 2, fotoUrl: "assets/images/livro.jpg"),
    Task("Meditar", 3, fotoUrl: "assets/images/meditacao.jpeg"),
    Task("Aprender Python", 4),
    Task("Aprender Python", 5),
    Task("Aprender Python", 6),
    Task("Aprender Python", -15),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, difficulty, fotoUrl: photo));
  }


  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    bool should_update = ListEquality().equals(old.taskList, taskList);
    if (should_update) {
      print(' -- UPDATE!');
    }
    return should_update;
  }
}
