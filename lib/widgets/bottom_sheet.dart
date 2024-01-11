import 'package:flutter/material.dart';

class BottomSheet1 extends StatelessWidget {
  const BottomSheet1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onDoubleTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text("Share"),
                        ),
                        ListTile(
                          leading: Icon(Icons.favorite_border_outlined),
                          title: Text("Copy"),
                        ),
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text("Edit"),
                        ),
                        ListTile(
                          leading: Icon(Icons.high_quality_outlined),
                          title: Text("HD"),
                        ),
                        ListTile(
                          leading: Icon(Icons.delete),
                          title: Text("Delete"),
                        )
                      ],
                    );
                  });
            },
            child: Image.asset("assets/images/IMG_1439.JPG")),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomSheet1(),
  ));
}
