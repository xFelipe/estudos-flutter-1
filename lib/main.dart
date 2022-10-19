import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter: Meus primeiros passos")),
        body: Column(
          children: [
            Task("Aprender Flutter"),
            Task("Aprender SQL"),
            Task("Aprender Python"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String name;
  int level;

  Task(this.name, {Key? key, this.level = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black26,
                  width: 72,
                  height: 100,
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 25),
                ),
                Container(
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        print("Aprendendo $name - Level: ${++level}.");
                      },
                      child: Column(
                        children: const [
                          Icon(Icons.arrow_drop_up),
                          Text(
                            "Lvl up",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
