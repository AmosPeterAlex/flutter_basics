import 'package:flutter/material.dart';
import 'package:flutter_starting_project/storage/shared%20prefernces/shared_home.dart';
import 'package:flutter_starting_project/storage/shared%20prefernces/shared_login.dart';

class SharedRegistration extends StatefulWidget {
  @override
  State<SharedRegistration> createState() => _SharedRegistration();
}

class _SharedRegistration extends State<SharedRegistration> {
  final formkey = GlobalKey<FormState>();
  String? pwd;
  bool showpass = false;
  bool showcpass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[500],
        title: Text("Registration Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
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
              SizedBox(
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
              SizedBox(
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
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
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
                          setState(() {
                            if (showcpass == true) {
                              showcpass = false;
                            } else {
                              showcpass = true;
                            }
                          });
                        },
                        icon: Icon(showcpass == true
                            ? Icons.visibility_off_sharp
                            : Icons.visibility)),
                    hintText: "Retype Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                height: 40,
                color: Colors.blueAccent[100],
                shape: StadiumBorder(),
                onPressed: () {
                  final valid = formkey.currentState?.validate();
                  if (valid == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SharedHome()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Registration failed"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: Text("Register"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SharedLogin()));
                  },
                  child: Text('Already Have An Account, SignUp'))
            ],
          ),
        ),
      ),
    );
  }
  // void storeData() async{
  //
  // }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SharedRegistration(),
  ));
}
