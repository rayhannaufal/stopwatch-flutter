import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tugas2/mainpage.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.timer_sharp,size: 110,color: (isLogin) ? Colors.indigo : Colors.red,),
            SizedBox(height: 10,),
            Text(
              'Login Page',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: (isLogin) ? Colors.grey : Colors.redAccent
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.sizeOf(context).height/3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        borderSide: BorderSide(color: (isLogin) ? Colors.grey : Colors.red)
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
                        content: Text(text)
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (isLogin) ? Colors.indigo : Colors.red,
                      minimumSize: Size.fromHeight(55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text('Login'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}