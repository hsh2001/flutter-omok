import 'package:flutter/material.dart';

import 'widget/game/Board.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '오목',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(body: Board()),
    );
  }
}
