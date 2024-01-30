import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starting_project/firebase%20example/email%20verification/firebase_functions.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB8tz45w1Lp_Wed8UnytYEZ76qUNHL6K2Y",
          appId: "1:674213172466:android:33fc9c650f8864c228ec6b",
          messagingSenderId: '',
          projectId: "fir-studyamos"));
  runApp(MaterialApp(
    home: RegistrationPage(),
  ));
}

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formkey = GlobalKey<FormState>();
  var nameC = TextEditingController();
  var passC = TextEditingController();

  // var cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registeration Page")),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: nameC,
                validator: (uname) {
                  if (uname!.isEmpty || !uname.contains('@')) {
                    return 'Username error';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              TextFormField(
                controller: passC,
                validator: (pass) {
                  if (pass!.isEmpty || pass.length < 6) {
                    return 'incorrect pass';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              TextFormField(
                validator: (cpass) {
                  if (cpass!.isEmpty || cpass.length > 6) {
                    return 'password mismatch';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                  onPressed: () {
                    final valid = formkey.currentState!.validate();
                    String name = nameC.text.trim();
                    String pass = passC.text.trim();
                    if (valid == true) {
                      FirebaseFunctionss()
                          .regUser(email: name, pwd: pass)
                          .then((res) {
                        if (res == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Success"),
                            backgroundColor: Colors.blueAccent,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Failure"),
                            backgroundColor: Colors.redAccent,
                          ));
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Failure")));
                    }
                  },
                  child: Text('Create Account'))
            ],
          ),
        ),
      ),
    );
  }
}
