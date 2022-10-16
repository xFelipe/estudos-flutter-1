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
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blue,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      color: Colors.white,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      color: Colors.amber,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      color: Colors.white,
                      width: 50,
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.cyan,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.pinkAccent,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: Colors.purple,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Container(
              color: Colors.amber,
              width: 300,
              height: 30,
              child: const Text(
                "Texto maluco",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print("Você apertou o Botão!");
                },
                child: Text("Aperte o botão!"))
          ],
        ),
      ),
    );
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
