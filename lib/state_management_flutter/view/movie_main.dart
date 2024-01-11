import 'package:flutter/material.dart';

class MovieMain extends StatelessWidget {
  // const MovieMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              label: Text('WishList')),
          Expanded(
              child: ListView.builder(itemBuilder: (context, index) => Card()))
        ],
      ),
    );
  }
}
