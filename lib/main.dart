import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/screens/home_page.dart';
import 'package:firebase_firestoreapp/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:flutter/services.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 debugShowCheckedModeBanner: false,
 title: 'Firebase Firestore App',
 routes: {
 '/login': (context) => LoginPage(),
 '/home': (context) => HomePage(),
 },
 home: LoginPage(),
 );
 }
}