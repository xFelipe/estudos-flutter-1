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
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String? fotoUrl;
  int nivel;
  late int dificuldade;

  Task(this.name, int dificuldade, {Key? key, this.nivel = 0, this.fotoUrl})
      : super(key: key) {
    if (dificuldade < 1) {
      this.dificuldade = 1;
    } else if (dificuldade > 5) {
      this.dificuldade = 5;
    } else {
      this.dificuldade = dificuldade;
    }
  }

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
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(4)),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(5)),
                      width: 72,
                      height: 100,
                      child: widget.fotoUrl != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(widget.fotoUrl!,
                                  fit: BoxFit.cover))
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
                            const Icon(
                              Icons.star,
                              color: Colors.blue,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: widget.dificuldade >= 2
                                  ? Colors.blue
                                  : Colors.blue[100],
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: widget.dificuldade >= 3
                                  ? Colors.blue
                                  : Colors.blue[100],
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: widget.dificuldade >= 4
                                  ? Colors.blue
                                  : Colors.blue[100],
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: widget.dificuldade >= 5
                                  ? Colors.blue
                                  : Colors.blue[100],
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
                        value: (widget.nivel / widget.dificuldade) / 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Nível: ${widget.nivel}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
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
