import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Task("Aprender Flutteraa aaaa aaa aaaa AAAAAAA sssss DDDDD"),
            Task("Aprender SQL"),
            Task("Aprender Python"),
            Task("Aprender Python"),
            Task("Aprender Python"),
            Task("Aprender Python"),
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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                Container(
                  width: 200,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
