import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tugas2/page/mainpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              // color: Colors.amber
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'GROUP 5',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 10,),
                Icon(
                  Icons.people
                  ,size: 110,color: Colors.white,
                ),
                Text(
                  'Login for Access',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 10,),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.sizeOf(context).height/2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  enabled: true,
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: (isLogin) ? Colors.grey : Colors.red)
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  enabled: true,
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: isLogin ? Colors.grey : Colors.red
                      )
                    )
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    String text = '';
                    if (username == "admin" && password == "admin") {
                      setState(() {
                        isLogin = true;
                        text = 'Login Berhasil';
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),));
                    } else {
                      setState(() {
                        isLogin = false;
                        text = 'Login Gagal';
                      });
                    }
                    SnackBar snackBar = SnackBar(
                      content: Text(text),
                      backgroundColor: !isLogin ? Colors.red[700] : null,
                    );
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (isLogin) ? Colors.indigo : Colors.red[700],
                    minimumSize: Size.fromHeight(55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}