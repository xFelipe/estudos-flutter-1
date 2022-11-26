import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';
import 'package:primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(), title: const Text("Tarefas")),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Task("Aprender Flutter", 1,
              fotoUrl:
              "assets/images/flutter.png"),
          Task(
            "Aprender SQL",
            2,
            fotoUrl:
            "assets/images/livro.jpg",
          ),
          Task(
            "Meditar",
            3,
            fotoUrl:
            "assets/images/meditacao.jpeg",
          ),
          Task("Aprender Python", 4),
          Task("Aprender Python", 5),
          Task("Aprender Python", 6),
          Task("Aprender Python", -15),
          SizedBox(height: 60,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FormScreen()));
            });
          }),
    );
  }
}
