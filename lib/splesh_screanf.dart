import 'dart:async';
import 'package:bucseproject/pages/home.dart';
import 'package:flutter/material.dart';
class spleshScreanflutter extends StatefulWidget {
  const spleshScreanflutter({Key? key}) : super(key: key);

  @override
  _spleshScreanflutterState createState() => _spleshScreanflutterState();
}

class _spleshScreanflutterState extends State<spleshScreanflutter> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeClass()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.greenAccent,
        child: Center(
            child: Image.asset(
          'images/BU.png',
          height: 300,
          width: 300,
          fit: BoxFit.fill,
        )
        ));
  }
}
