import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starting_project/firebase%20example/email%20verification/firebase_functions.dart';
import 'package:flutter_starting_project/firebase%20example/email%20verification/home_firebase.dart';
import 'package:flutter_starting_project/firebase%20example/email%20verification/pg1_firebase.dart';

class LoginPageFirebase extends StatelessWidget {
  // const LoginPageFirebase({super.key});
  final nameC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameC,
              decoration: InputDecoration(
                  hintText: 'User Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller: passC,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            ElevatedButton(
                onPressed: () {
                  String email = nameC.text.trim();
                  String pass = passC.text.trim();
                  FirebaseFunctionss()
                      .loginUser1(email: email, pass: pass)
                      .then((value) {
                    if (value == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeFirebase()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(value)));
                    }
                  });
                },
                child: const Text('Login Now')),
            InkWell(
              child: Text('Register'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegistrationPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB8tz45w1Lp_Wed8UnytYEZ76qUNHL6K2Y",
          appId: "1:674213172466:android:33fc9c650f8864c228ec6b",
          messagingSenderId: '',
          projectId: "fir-studyamos"));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: user == null ? LoginPageFirebase() : HomeFirebase(),
  ));
}
