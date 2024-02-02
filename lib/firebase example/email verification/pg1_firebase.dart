import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starting_project/firebase%20example/email%20verification/firebase_functions.dart';
import 'package:flutter_starting_project/firebase%20example/email%20verification/pg2_firebase.dart';
import 'package:get/get.dart';


class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  var nameC = TextEditingController();
  var passC = TextEditingController();

  // var cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registeration Page")),
      body: Center(
        child: Form(
          key: formKey,
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
                  if ((cpass!.isEmpty || cpass.length < 6) && passC == cpass) {
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
                    final valid = formKey.currentState!.validate();
                    String name = nameC.text.trim();
                    String pass = passC.text.trim();
                    if (valid == true) {
                      FirebaseFunctionss()
                          .regUser(email: name, pwd: pass)
                          .then((res) {
                        if (res == null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPageFirebase()));
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Failure"),
                        backgroundColor: Colors.grey,
                      ));
                    }
                  },
                  child: Text('Create Account')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPageFirebase()));
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
