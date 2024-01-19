import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 700,
            width: 600,
            color: Colors.red,
          ),
          Positioned(
              height: 200,
              bottom: 30,
              right: 15,
              left: 15,
              child:
                  Container(color: Colors.deepPurple, height: 250, width: 600)),
          Positioned(
              height: 100,
              width: 100,
              child: Container(color: Colors.green, height: 420, width: 400))
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: StackExample(),
  ));
}
