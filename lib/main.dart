import 'package:flutter/material.dart';
import 'login/login.dart';
import 'login/register.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: Scaffold(backgroundColor: Color.fromRGBO(232,249,253,100),
    body: Login()));
  }
}
