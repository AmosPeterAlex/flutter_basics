import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  // const BottomNavigationBarExample({super.key});
  int index = 0;
  var screenS = [
    Text('hi'),
    Text('2nd pg'),
    Text('3rd pg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapNum) {
          setState(() {
            index = tapNum;
          });
        },
        currentIndex: index,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
        ],
      ),
      body: screenS[index],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BottomNavigationBarExample(),
  ));
}
