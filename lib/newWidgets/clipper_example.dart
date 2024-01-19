import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ClipperExample extends StatelessWidget {
  const ClipperExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clipper'),
      ),
      body: ListView(
        children: [
          ClipRRect(
            child: Align(
                widthFactor: .4,
                heightFactor: .8,
                child: Image.asset('assets/images/IMG_1439.JPG')),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            child: Align(
                widthFactor: .4,
                heightFactor: .7,
                child: Image.asset('assets/images/IMG_1377.JPG')),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipOval(
            child: Align(
                heightFactor: .5,
                widthFactor: .5,
                child: Image.asset('assets/images/IMG_1466.JPG')),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Align(
                  heightFactor: .9,
                  child: Image.asset('assets/images/IMG_1357.JPG'))),
          const SizedBox(
            height: 10,
          ),
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: 150,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 150,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipPath(
            clipper: ArrowClipper(150, 30, Edge.BOTTOM),
            child: Container(
              height: 150,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipPath(
            clipper: StarClipper(5),
            child: Container(
              height: 600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClipperExample(),
  ));
}
