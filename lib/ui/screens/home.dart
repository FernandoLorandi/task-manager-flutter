import 'package:flutter/material.dart';

import '../components/card.dart';

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
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: Duration(milliseconds: 500),
        child: ListView(
          children: <Widget>[
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
            TaskCard(
              title: "Aprender JavaScript",
              imageCard: "https://i.redd.it/f4x5xj63bzoa1.png",
              difficultLevel: 4,
            ),
            TaskCard(
              title: "Aprender JavaScript",
              imageCard: "https://i.redd.it/f4x5xj63bzoa1.png",
              difficultLevel: 4,
            ),
            TaskCard(
              title: "Aprender JavaScript",
              imageCard: "https://i.redd.it/f4x5xj63bzoa1.png",
              difficultLevel: 4,
            ),
            TaskCard(
              title: "Aprender JavaScript",
              imageCard: "https://i.redd.it/f4x5xj63bzoa1.png",
              difficultLevel: 4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: opacity ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      ),
    );
  }
}
