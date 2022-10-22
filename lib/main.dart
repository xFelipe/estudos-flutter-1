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
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              RandomColorRectangle(),
              RandomColorRectangle(),
              RandomColorRectangle(),
            ],
          ),
          Row(
            children: [
              RandomColorRectangle(),
              RandomColorRectangle(),
              RandomColorRectangle(),
            ],
          ),
          Row(
            children: [
              RandomColorRectangle(),
              RandomColorRectangle(),
              RandomColorRectangle(),
            ],
          ),
          Row(
            children: [
              RandomColorRectangle(),
              RandomColorRectangle(),
              RandomColorRectangle(),
            ],
          ),
        ]),
      ),
    );
  }
}

class RandomColorRectangle extends StatefulWidget {
  Color color = Colors.white;

  static Color _randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  resetColor() {
    color = _randomColor();
  }

  RandomColorRectangle({Key? key}) : super(key: key) {
    resetColor();
  }

  @override
  State<RandomColorRectangle> createState() => _RandomColorRectangleState();
}

class _RandomColorRectangleState extends State<RandomColorRectangle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { setState(() {
        widget.resetColor();
      });},
      child: Container(
        color: widget.color,
        height: 150,
        width: 130,
      ),
    );
  }
}
