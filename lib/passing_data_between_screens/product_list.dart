import 'package:flutter/material.dart';
import 'package:flutter_starting_project/passing_data_between_screens/dummy_data.dart';
import 'package:flutter_starting_project/passing_data_between_screens/product_details.dart';

void main() {
  runApp(MaterialApp(
      home: ProductList(),
      debugShowCheckedModeBanner: false,
      routes: {'details': (context) => Details()}));
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: ListView(
          children: products
              .map((e) => ListTile(
                    title: Text(e['Name']),
                    trailing: Text(e['Price'].toString()),
                    onTap: () => Navigator.pushNamed(context, 'details',
                        arguments: e['Name']),
                  ))
              .toList()),
    );
  }
}
