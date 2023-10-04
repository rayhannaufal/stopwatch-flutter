import 'package:flutter/material.dart';
import 'package:flutter_tugas2/loginpage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => SeettingPageState();
}

class SeettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Klik Logout untuk keluar"),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}