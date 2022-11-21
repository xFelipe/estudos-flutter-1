import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova tarefa"),
      ),
      body: Center(
        child: Container(
            height: 650,
            width: 375,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3)),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(5.0)),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nome",
                      fillColor: Colors.white70,
                      filled: true),
                ),
              ],
            )),
      ),
    );
  }
}
