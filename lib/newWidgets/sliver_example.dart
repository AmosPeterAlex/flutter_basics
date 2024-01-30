import 'package:flutter/material.dart';

class SliverExample extends StatelessWidget {
  const SliverExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 5,
            title: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search)),
            ),
            bottom: AppBar(
              title: SizedBox(
                  width: double.infinity,
                  // color: Colors.blueGrey[400],
                  child: Text('Slivers')),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(List.generate(
                  40,
                  (index) => const ListTile(
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
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SliverExample(),
  ));
}
