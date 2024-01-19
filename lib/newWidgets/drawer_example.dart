import 'package:flutter/material.dart';

class DrawerExample extends StatelessWidget {
  const DrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    var col1=[Colors.purple,Colors.red[400],Colors.yellowAccent,Colors.purple[50],Colors.red,];
    var col2=[Colors.purple[50],Colors.red,Colors.yellowAccent[50],Colors.lightGreen,Colors.indigo];
    var col3=[Colors.purple[400],Colors.purple[50],Colors.red,Colors.lightGreen,Colors.indigo[100]];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Example & Expansion Tile Example'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/my profile pic.jpg'),
                        fit: BoxFit.fill)),
                currentAccountPicture: const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.abc),
                  ),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundColor: Colors.purple[300],
                    child: const Icon(Icons.account_box),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.purple[300],
                    child: const Icon(Icons.add),
                  ),
                ],
                accountName: const Text(
                  'Amos P Alex',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: const Text('amos@gmail.com',
                    style: TextStyle(color: Colors.black))),
            const ListTile(
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text('Home Page Opens'),
              leading: Icon(Icons.account_box),
            ),
            const ListTile(
              title: Text(
                'Search',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text('Search Anything'),
              leading: Icon(Icons.search),
            ),
            const ListTile(
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text('Settings Page Open'),
              leading: Icon(Icons.settings),
            ),
            const ListTile(
              title: Text(
                'Print',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text('Print Page'),
              leading: Icon(Icons.local_printshop_outlined),
            ),
            //List.generate vilicha madhy ayirunn. Matram ala ela code inum main function arutatr ila
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('Tile One'),
              children: List.generate(
                  5,
                      (index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: col1[index],
                    ),
                  )),
            ),ExpansionTile(
              title: const Text('Tile Two'),
              children: List.generate(
                  5,
                      (index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: col2[index],
                    ),
                  )),
            ),ExpansionTile(
              title: const Text('Tile Three'),
              children: List.generate(
                  5,
                      (index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: col3[index],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DrawerExample(),
  ));
}
