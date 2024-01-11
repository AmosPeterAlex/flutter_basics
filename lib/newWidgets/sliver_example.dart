import 'package:flutter/material.dart';

class SliverExample extends StatelessWidget {
  const SliverExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 5,
            title: Text('Slivers..'),
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                color: Colors.blueGrey[400],
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(List.generate(
                  6,
                  (index) => ListTile(
                        iconColor: Colors.blue,
                        leading: Icon(Icons.image),
                        title: Text('Image'),
                      )))),
          // SliverGrid(
          //     delegate: SliverChildBuilderDelegate((context, index) => Card(shape: StadiumBorder(),
          //           color: Colors.red,
          //           child: Text('card'),
          //         )),
          //     gridDelegate:
          //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SliverExample(),
  ));
}
