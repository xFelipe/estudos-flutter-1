import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: FloatingActionButton(
        onPressed: () {
          print("Hello world!");
        },
        child: const Icon(Icons.ac_unit_sharp),
      ),
    );
  }
}
