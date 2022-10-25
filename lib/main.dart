import 'package:flutter/material.dart';
import 'dart:math' as math;

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [ColorsRow(), ColorsRow(), ColorsRow(), ColorsRow()]),
      ),
    );
  }
}

class RandomColorRectangle extends StatefulWidget {
  Color color = Colors.white;
  Widget? child;

  static Color _randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  resetColor() {
    color = _randomColor();
  }

  RandomColorRectangle({Key? key, this.child}) : super(key: key) {
    resetColor();
  }

  @override
  State<RandomColorRectangle> createState() => _RandomColorRectangleState();
}

class _RandomColorRectangleState extends State<RandomColorRectangle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.resetColor();
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 4)),
        height: 150,
        width: 125,
        child: widget.child
      ),
    );
  }
}

class ColorsRow extends StatelessWidget {
  const ColorsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RandomColorRectangle(),
        RandomColorRectangle(child: const Icon(Icons.people_alt)),
        RandomColorRectangle(),
      ],
    );
  }
}
