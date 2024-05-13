import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_starting_project/content_page.dart';
import 'package:flutter_starting_project/login_signup.dart';

class RegistrationStatefull extends StatefulWidget {
  //const registrationStatefull({super.key});

  @override
  State<RegistrationStatefull> createState() => _RegistrationStatefullState();
}

class _RegistrationStatefullState extends State<RegistrationStatefull> {
  final formkey = GlobalKey<FormState>();
  String? pwd;
  bool showpass = false;
  bool showcpass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[500],
        title: const Text("Registration Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (name) {
                  if (name!.isEmpty || name.length < 4) {
                    return "Minimum 4 character required";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (email) {
                  if (email!.isEmpty || !email.contains('@')) {
                    //doubt ! vno vndayo
                    return "Type valid email";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscuringCharacter: "*",
                obscureText: showpass,
                validator: (pass) {
                  pwd = pass;
                  if (pass!.isEmpty || pass.length < 8) {
                    return "Minimum 8 characters required";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(showpass == true
                        ? Icons.visibility_off_sharp
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        if (showpass == true) {
                          showpass = false;
                        } else {
                          showpass = true;
                        }
                      });
                    },
                  ),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: showcpass,
                obscuringCharacter: "*",
                validator: (cpass) {
                  if (cpass!.isEmpty || cpass != pwd) {
                    return "invalid password";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          if (showcpass == true) {
                            showcpass = false;
                          } else {
                            showcpass = true;
                          }
                        },
                      );
                    },
                    icon: Icon(showcpass == true
                        ? Icons.visibility_off_sharp
                        : Icons.visibility),
                  ),
                  hintText: "Retype Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                height: 40,
                color: Colors.blueAccent[100],
                shape: const StadiumBorder(),
                onPressed: () {
                  final valid = formkey.currentState?.validate();
                  if (valid == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ContentPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Registration failed"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: const Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
