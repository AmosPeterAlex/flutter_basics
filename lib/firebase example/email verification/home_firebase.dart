import 'package:flutter/material.dart';
import 'package:flutter_starting_project/firebase%20example/email%20verification/pg2_firebase.dart';

class HomeFirebase extends StatelessWidget {
  // const HomeFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hi'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginPageFirebase()));
                },
                child: Text('Log Out'))
          ],
        ),
      ),
    );
  }
}
