import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridViewFive(),
  ));
}

class GridViewFive extends StatelessWidget {
  const GridViewFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3, crossAxisCount: 2),
          childrenDelegate: SliverChildBuilderDelegate((context, index) => Card(
                child: Column(
                  children: [Text("mye"), Text("fek")],
                ),
              ))),
    );
  }
}
