import 'package:flutter/material.dart';
import 'package:flutter_starting_project/login_page.dart';
import 'package:flutter_starting_project/registration_statefull.dart';
import 'package:flutter_starting_project/signup_page.dart';
import 'package:flutter_starting_project/statefull_login.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "Hello Meta User",
            //   style: TextStyle(
            //     fontSize: 40,
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            RichText(
                text: TextSpan(
                    style:
                        TextStyle(color: Colors.blueAccent[100], fontSize: 40),
                    children: [
                  TextSpan(
                      text: "Hello ",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: "Meta ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: "User!")
                ])),
            Image(
              image: AssetImage("assets/images/meta new logo.png"),
              width: 130,
              height: 130,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("Login Page"),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(50, 35),
                  backgroundColor: Colors.blueAccent[100]),
            ),
            SizedBox(
              height: 1,
            ),
            MaterialButton(
              minWidth: 59,
              //Material Button il kurach kudi extra features indu
              //Color oke simple ayi kodukam
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
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
