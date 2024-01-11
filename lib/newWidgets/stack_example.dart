import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 600,
            width: 600,
            color: Colors.red,
          ),
          Positioned(
              height: 200,
              bottom: 10,
              right: 15,
              left: 15,
              child:
                  Container(color: Colors.deepPurple, height: 250, width: 600)),
          Container(color: Colors.green, height: 420, width: 400)
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StackExample(),
  ));
}
