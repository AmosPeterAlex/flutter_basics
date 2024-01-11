import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridViewOne(),
  ));
}

class GridViewOne extends StatelessWidget {
  // const GridViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      ///Fixed number of cards{here card is used so there is an inbuilt padding}
      // gridDelegate:
      //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ///will change according to double size
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

          ///mainAxisSpacing: 10,
          ///Container oke aa vilikuna enkil edh il inbuilt ayi property ond,
          ///cross axis spacing inum differnt property ond
          /// crossAxisSpacing: 10,
          maxCrossAxisExtent: 150),
      children: List.generate(
        20,
        (index) => Card(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.image), Text("Camera")],
            ),
          ),
          color: Colors
              .primaries[Random().nextInt(Colors.primaries.length)],
        ),
        // children: [
        //   Card(
        //     child: Center(
        //       child: Icon(Icons.image_rounded, size: 20),
        //     ),
        //   ),
        //   Card(
        //     child: Center(
        //       child: Icon(Icons.image_rounded, size: 25),
        //     ),
        //   ),
        //   Card(
        //     child: Center(
        //       child: Icon(Icons.image_rounded, size: 25),
        //     ),
        //
        // ],
      ),
    ));
  }
}
