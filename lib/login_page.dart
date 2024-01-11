import 'package:flutter/material.dart';
import 'package:flutter_starting_project/content_page.dart';
import 'package:flutter_starting_project/login_signup.dart';
import 'package:flutter_starting_project/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  String username = "amos";
  String password = "1234";

  final user_controller = TextEditingController();
  final pass_controller = TextEditingController();

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
      body: Column(
        children: [
          Text(
            "Login Page",
            style: GoogleFonts.fahkwang(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 5),
            child: TextField(
              controller: user_controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "User Name",
                  labelText: "User Name"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 5),
            child: TextField(
              obscureText: true,
              obscuringCharacter: "*",
              controller: pass_controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Password",
                  labelText: "Password"),
            ),
          ),
          MaterialButton(
            child: Text("Login Here",
                style:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.4)),
            onPressed: () {
              if (username == user_controller.text &&
                  password == pass_controller.text) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContentPage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Inavalid UserName or Password"),
                  backgroundColor: Colors.red,
                ));
                //to clear value when pressed back
                user_controller.text = "";
                pass_controller.text = "";
              }
            },
            color: Colors.lightBlueAccent,
            shape: StadiumBorder(),
            height: 40,
            minWidth: 100,
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(text: "Don't Have an account"),
                    TextSpan(
                        text: "SignUp",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]))),

          // ElevatedButton(onPressed: () {}, child: Text("Login here"))
        ],
      ),
    );
  }
}
