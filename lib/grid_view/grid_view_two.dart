import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridViewTwo(),
  ));
}

class GridViewTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: GridView.builder(
            itemCount: 13,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10, mainAxisSpacing: 15, crossAxisCount: 3),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blueGrey[100],
                child: Column(
                  children: [
                    Image.asset("assets/images/my profile pic.jpg"),
                    Text("Text $index")
                  ],
                ),
              );
            }),
      ),
    );
  }
}
