import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListViewCustom(),
  ));
}

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Custom"),
      ),
      body: ListView.custom(
        // childrenDelegate: SliverChildListDelegate(
        ///we should manually type everything
        //     [Card(
        //       child: Center(
        //         child: Text("Hiiiii Allll!"),
        //       ),),
        //       Card(
        //         child: Center(
        //           child: Text("Hiiiii Allll!"),
        //         ),
        //       ),
        //       Card(
        //         child: Center(
        //           child: Text("Hiiiii Allll!"),
        //         ),
        //       ),
        //       Card(
        //         child: Center(
        //           child: Text("Hiiiii Allll!"),
        //         ),
        //       ))
        // ]
        ///List generate using list.generate >>>
        //   List.generate(
        //       10,
        //       (index) => Card(
        //             child: Center(
        //               child: Text("Hiii "),
        //             ),
        //           )))
        ///List using SliverChildBuilderDelegate
        ///
        childrenDelegate: SliverChildBuilderDelegate(
            childCount: 8,
            (context, index) => Card(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/meta new logo.png",
                        height: 80,
                        width: 80,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Brand : Meta"),
                          Text("Founded: 2021"),
                          Text("Value:\$ 28 Billion")
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.greenAccent,
                        shape: const StadiumBorder(),
                        minWidth: 100,
                        child: const Text("View More",
                            style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
