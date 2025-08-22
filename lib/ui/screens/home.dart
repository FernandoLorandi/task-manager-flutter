import 'package:first_project/data/task_inherited.dart';
import 'package:first_project/ui/screens/form_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool opacity = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Tarefas", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(children: TaskInherited.of(context).taskList),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) {
                  return FormScreen(taskContext: context);
                },
              ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
