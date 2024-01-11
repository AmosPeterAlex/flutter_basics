import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "MyApp",
          ),
          bottom: TabBar(tabs: [
            Text("Chat"),
            Text("Community"),
            Text("Call"),
          ]),
        ),
        body: TabBarView(children: [
          Center(child: Text("Chat pg")),
          Text("hghg"),
          Text("Call"),
        ]),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: TabBarExample(),
  ));
}
