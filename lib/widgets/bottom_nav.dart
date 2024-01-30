import 'package:flutter/material.dart';

class BottomNavStf extends StatefulWidget {
  const BottomNavStf({super.key});

  @override
  State<BottomNavStf> createState() => _BottomNavStfState();
}

class _BottomNavStfState extends State<BottomNavStf> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapIndex) {
          setState(() {
            index = tapIndex;
          });
        },
        currentIndex: index,selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BottomNavStf(),
  ));
}
