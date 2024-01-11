import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class ConvexBottomBarExample extends StatefulWidget {
  // const ConvexBottomBarExample({super.key});

  @override
  State<ConvexBottomBarExample> createState() => _ConvexBottomBarExampleState();
}

class _ConvexBottomBarExampleState extends State<ConvexBottomBarExample> {
  var pageS = [
    Center(child: Text('Hii')),
    Center(child: Text('oke')),
    Center(child: Text('hlo')),
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Convex Bottom Bar'),
          centerTitle: true,
        ),
        bottomNavigationBar: ConvexAppBar(
            onTap: (tap) {
              setState(() {
                index = tap;
              });
            },
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.account_box, title: 'Profile'),
              TabItem(icon: Icons.search, title: 'Search')
            ]),
        body: pageS[index]);
  }
}

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: ConvexBottomBarExample()));
}
