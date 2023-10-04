import 'package:flutter/material.dart';
import 'package:flutter_tugas2/loginpage.dart';
import 'package:flutter_tugas2/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      title: 'Tugas 2',
      home: MainPage(),
    );
  }
}