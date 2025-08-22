import 'package:first_project/ui/components/card.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required Widget child}) : super(child: child);

  final List<TaskCard> taskList = <TaskCard>[
    TaskCard(
      title: "Aprender Flutter",
      imageCard:
          "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      difficultLevel: 1,
    ),
    TaskCard(
      title: "Aprender JavaScript",
      imageCard: "https://i.redd.it/f4x5xj63bzoa1.png",
      difficultLevel: 4,
    ),
  ];

  void newTask(String title, String imageCard, int difficultyLevel) {
    taskList.add(
      TaskCard(
        title: title,
        imageCard: imageCard,
        difficultLevel: difficultyLevel,
      ),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context
        .dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
