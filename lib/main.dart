import 'package:flutter/material.dart';
import 'cinema_app.dart';
import 'login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cinema',
 
      home: LoginScreen(),
    );
  }
}

