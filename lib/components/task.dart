import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import 'difficulty.dart';

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
                    TaskImage(fotoUrl: widget.fotoUrl),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        Difficulty(widget.dificuldade)
                      ],
                    ),
                    LvlUpButtom(onPressed: () {
                      setState(() {
                        widget.nivel++;
                        // print("Aprendendo ${widget.name} - Nível: ${widget.nivel}.");
                      });
                    })
                  ],
                ),
              ),
              NivelBar(
                nivel: widget.nivel,
                difficulty: widget.dificuldade,
              )
            ],
          )
        ],
      ),
    );
  }
}

class LvlUpButtom extends StatelessWidget {
  void Function() onPressed;

  LvlUpButtom({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 75,
      child: ElevatedButton(
          onPressed: onPressed,
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
    );
  }
}

class TaskImage extends StatelessWidget {
  const TaskImage({
    Key? key,
    this.fotoUrl,
  }) : super(key: key);

  final String? fotoUrl;

  @override
  Widget build(BuildContext context) {
    Image? image;
    if (fotoUrl != null) {
      if (isURL(fotoUrl)) {
        image = Image.network(fotoUrl!, fit: BoxFit.cover);
      } else {
        image = Image.asset(fotoUrl!, fit: BoxFit.cover);
      }
    }
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(5)),
      width: 72,
      height: 100,
      child: image != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child:  image)
          : null,
    );

  }
}

class NivelBar extends StatelessWidget {
  const NivelBar({
    Key? key,
    required this.nivel,
    required this.difficulty,
  }) : super(key: key);

  final int nivel;
  final int difficulty;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProgressionBar(nivel: nivel, difficulty: difficulty),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Nível: $nivel",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
      ],
    );
  }
}

class ProgressionBar extends StatelessWidget {
  const ProgressionBar({
    Key? key,
    required this.nivel,
    required this.difficulty,
  }) : super(key: key);

  final int nivel;
  final int difficulty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 250,
        child: LinearProgressIndicator(
          value: (nivel / difficulty) / 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
