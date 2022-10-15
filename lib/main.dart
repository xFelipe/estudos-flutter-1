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
        home: Stack(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  color: Colors.red,
                  width: 500,
                  height: 760,
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.white,
                  width: 500,
                  height: 507,
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  color: Colors.blue,
                  width: 500,
                  height: 254,
                ),
              ],
            )
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
