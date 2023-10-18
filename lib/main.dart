import 'package:flutter/material.dart';
import 'package:flutter_tugas2/page/loginpage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      title: 'Tugas 2',
      home: const LoginPage(),
    );
  }
}