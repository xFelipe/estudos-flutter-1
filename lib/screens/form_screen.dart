import 'package:flutter/material.dart';
import 'package:primeiro_projeto/data/task_inherited.dart';
import 'package:validators/validators.dart';

import '../components/task.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    return value != null && value.isEmpty;
  }
  bool difficultyValidator(String? value) {
    return (
        value == null ||
        value.isEmpty ||
        int.tryParse(value) == null ||
        int.parse(value) > 5 ||
        int.parse(value) < 0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: nameController,
                          textAlign: TextAlign.center,
                          validator: (String? value) {
                            if (valueValidator(value)) {
                              return 'Insira o nome da tarefa';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Nome",
                              fillColor: Colors.white70,
                              filled: true),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: difficultyController,
                          textAlign: TextAlign.center,
                          validator: (String? value) {
                            if (difficultyValidator(value)) {
                              return 'Insira a dificuldade entre 1 e 5';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Dificuldade",
                              fillColor: Colors.white70,
                              filled: true),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          keyboardType: TextInputType.url,
                          controller: imageController,
                          textAlign: TextAlign.center,
                          onChanged: (text) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (valueValidator(value)) {
                              return 'Insira uma URL de imagem.';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Imagem",
                              fillColor: Colors.white70,
                              filled: true),
                        )),
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageController.text,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext buildContext,
                              Object exception, StackTrace? stackTrace) {
                            return Image.asset("assets/images/nophoto.png");
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(nameController.text);
                            print(int.parse(difficultyController.text));
                            print(imageController.text);
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Salvando nova tarefa'))
                            );
                            TaskInherited.of(widget.taskContext).newTask(
                                nameController.text,
                                imageController.text,
                                int.parse(difficultyController.text)
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Adicionar!"))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
