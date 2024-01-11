import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_starting_project/login_signup.dart';
import 'package:flutter_starting_project/registration_statefull.dart';
import 'package:flutter_starting_project/statefull_login.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash2(),
  ));
}

class Splash2 extends StatefulWidget {

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginSignup()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.network(
            "https://lottie.host/068eabc0-f586-4041-ba67-d2cc36c7a244/mBLYBc1EbP.json"),
        // child: Lottie.asset("assets/animations/Animation - 1698748008070.json"),
        // child:Lottie.asset('assets/animations/Animation - 1698747377934.json'),
      ),///check evde asset vazhi animation okunila just network vazhi matrame okunne olu
    );
  }
}
