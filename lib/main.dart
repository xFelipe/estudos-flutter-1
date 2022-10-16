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
        home: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Eixo Y, que nesse caso é o eixo principal da Column
          crossAxisAlignment: CrossAxisAlignment.end, // Eixo X, que nesse caso é o eixo secundário
          children: [
            Container(
              color: Colors.white,
              width: 200,
              height: 153,
            ),
            Container(
              color: Colors.red,
              width: 300,
              height: 153,
            ),
          ],
        ));
  }
}

/*
home: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              color: Colors.red,
              width: 500,
              height: 300,
            ),
            Container(
              color: Colors.white,
              width: 500,
              height: 300,
            ),
            Container(
              color: Colors.blue,
              width: 500,
              height: 300,
            )
          ],
        )
 */
