import 'package:flutter/material.dart';
import 'package:quiz_game/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Quiz App',
      home: MyHome(),
    );
  }
}
