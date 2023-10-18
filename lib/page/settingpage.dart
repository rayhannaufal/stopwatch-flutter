import 'package:flutter/material.dart';

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
              SnackBar snackBar = SnackBar(
                content: Text('Berhasil Logout') 
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}