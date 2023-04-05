import 'package:flutter/material.dart';
import 'package:flutter_login/model/main_screen.dart';
import 'package:flutter_login/model/register.dart';
import 'package:flutter_login/model/screens/screens.dart';

import 'model/login.dart';

void main() {
  runApp(BoardingScreen());
}

class BoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BoardingPage(),
      routes: {
        'register': (context) => register(),
        'login': (context) => login(),
      },
    );
  }
}
