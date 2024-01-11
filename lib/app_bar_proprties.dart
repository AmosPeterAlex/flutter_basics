import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppBarProperties(),
  ));
}

class AppBarProperties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("My AppBar"),
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.camera_alt_outlined),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.search),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text("New Group")),
              PopupMenuItem(child: Text("New Channel")),
              PopupMenuItem(child: Text("Settings")),
              PopupMenuItem(child: Text("Profile")),
            ];
          })
        ],
      ),
    );
  }
}
