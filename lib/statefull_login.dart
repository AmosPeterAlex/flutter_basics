import 'package:flutter/material.dart';
import 'package:flutter_starting_project/content_page.dart';

class LoginStatefull extends StatefulWidget {
  //const LoginStatefull({super.key});

  @override
  State<LoginStatefull> createState() => _LoginStatefullState();
}

class _LoginStatefullState extends State<LoginStatefull> {

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/meta new logo.png"),
                height: 100,
                width: 100,
              ),
              TextFormField(
                validator: (uname) {
                  if (uname!.isEmpty || !uname.contains("@")) {
                    return 'UserName is Invalid';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "User Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (pass) {
                  if (pass!.isEmpty || pass.length < 6) {
                    return "Password is empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 50,
                color: Colors.blueAccent[100],
                shape: StadiumBorder(),
                minWidth: 170,
                onPressed: () {
                  final valid = formkey.currentState?.validate();
                  if (valid == true) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context)=>ContentPage()));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Invalid Details"),
                      backgroundColor: Colors.red,
                    ));

                  }
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
