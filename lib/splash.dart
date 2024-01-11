import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  ///runApp- inflate the given widget and attach to the screen
  runApp(MaterialApp(
      home: Splash()));

  ///materialApp means basic theme
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(

            ///Setting image as background
            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: NetworkImage(
            //         'https://images.unsplash.com/photo-1698375962447-8aac6091e31b?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D'))),
            ///Setting gradient color
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.green,
              Colors.blueAccent,
              Colors.yellow,
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.camera_outlined, size: 125, color: Colors.yellow,),
              Image.asset(
                "assets/icons/Swimming icon.png",
                height: 80,
                width: 60,
                color: Colors.yellowAccent,
              ),
              Text(
                "My App",
                style: GoogleFonts.kalam(
                  fontSize: 30,
                  color: Colors.black,
                  //Text style using google fonts
                ),
              )
              //style: TextStyle(fontSize: 30,color: Colors.deepOrange,fontWeight: FontWeight.normal),),
              ,
              Image.network(
                "https://images.pexels.com/photos/863988/pexels-photo-863988.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                height: 250,
                width: 250,
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
