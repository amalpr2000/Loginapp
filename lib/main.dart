import 'package:flutter/material.dart';
import 'package:loginapp/Screens/Homepage.dart';
import 'package:loginapp/Screens/Login.dart';
import 'package:loginapp/Screens/Splash.dart';

const SAVE_KEY ='UserLoggedIn';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Screen_Splash(),
    );
  }
}

