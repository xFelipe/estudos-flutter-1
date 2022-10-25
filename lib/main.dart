import 'package:flutter/material.dart';
import 'package:primeiro_projeto/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(leading: Container(), title: const Text("Tarefas")),
        body: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: opacity ? 1 : 0,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Task("Aprender Flutter", 1,
                  fotoUrl:
                      "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large"),
              Task(
                "Aprender SQL",
                2,
                fotoUrl:
                    "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
              ),
              Task(
                "Meditar",
                3,
                fotoUrl:
                    "https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg",
              ),
              Task("Aprender Python", 4),
              Task("Aprender Python", 5),
              Task("Aprender Python", 6),
              Task("Aprender Python", -15),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(opacity ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                opacity = !opacity;
              });
            }),
      ),
    );
  }
}
