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
        appBar: AppBar(leading: Container(), title: const Text("Tarefas")),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Task("Aprender Flutter",
                fotoUrl:
                    "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large"),
            Task(
              "Aprender SQL",
              fotoUrl:
                  "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
            ),
            Task(
              "Meditar",
              fotoUrl:
                  "https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg",
            ),
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

class Task extends StatefulWidget {
  final String name;
  final String? fotoUrl;
  int nivel;

  Task(this.name, {Key? key, this.nivel = 0, this.fotoUrl}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5, bottom: 10),
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Column(
            children: [
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
                      child: widget.fotoUrl != null
                          ? Image.network(widget.fotoUrl!, fit: BoxFit.cover)
                          : null,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.blue[100],
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.lightBlue[100],
                              size: 15,
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                              print(
                                  "Aprendendo ${widget.name} - Nível: ${widget.nivel}.");
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                "Lvl up",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 250,
                      child: LinearProgressIndicator(
                        value: widget.nivel / 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Nível: ${widget.nivel}",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
