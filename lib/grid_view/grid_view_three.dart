import 'package:flutter/material.dart';
import 'package:flutter_starting_project/widget_refractoring/my_widget_one.dart';

import '../widgets/my_widget_one.dart';

class GridViewThree extends StatelessWidget {
  const GridViewThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        childAspectRatio: 2,
        crossAxisCount: 2,
        // children: []
        children: List.generate(
            12,
            (index) => MyWidgetOne(
                label: Text("heii"),
                onPress: () {
                  print("hello");
                },
                bgColor: Colors.deepPurpleAccent,
                image: Image.asset("assets/images/meta new logo.png"))),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridViewThree(),
  ));
}
