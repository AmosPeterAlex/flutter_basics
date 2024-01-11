import 'package:flutter/material.dart';
import 'package:flutter_starting_project/content_page.dart';
import 'package:flutter_starting_project/login_signup.dart';

class SignUpPage extends StatelessWidget {
  // const SignUpPage({super.key});
  String nameSignUp = "Amos P Alex";
  String emailSignUp = "amos@gmail.com";
  String passSignUp = "amos";
  String cpassSignUp = "amos";

  final name_cont = TextEditingController();
  final email_cont = TextEditingController();
  final pass_cont = TextEditingController();
  final cpass_cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginSignup()));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Create New Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
              child: TextField(
                controller: name_cont,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        gapPadding: 5, borderRadius: BorderRadius.circular(5)),
                    labelText: "Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
              child: TextField(
                controller: email_cont,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        gapPadding: 5, borderRadius: BorderRadius.circular(5)),
                    labelText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
              child: TextField(
                controller: pass_cont,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        gapPadding: 5, borderRadius: BorderRadius.circular(5)),
                    labelText: "Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, right: 20, left: 20, bottom: 10),
              child: TextField(
                controller: cpass_cont,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        gapPadding: 5, borderRadius: BorderRadius.circular(5)),
                    labelText: "Confirm Password"),
              ),
            ),
            MaterialButton(
              shape: StadiumBorder(),
              onPressed: () {
                if (nameSignUp == name_cont.text &&
                    emailSignUp == email_cont.text &&
                    passSignUp == pass_cont.text &&
                    passSignUp == pass_cont.text) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContentPage()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please check the given details!!"),
                    backgroundColor: Colors.red,
                  ));
                  //to clear value when pressed back
                  name_cont.text = "";
                  email_cont.text = "";
                  pass_cont.text = "";
                  cpass_cont.text = "";
                }
              },
              color: Colors.blueAccent[100],
              child: Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
