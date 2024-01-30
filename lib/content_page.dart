import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ContentPage(),
  ));
}

class ContentPage extends StatelessWidget {
  // const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("My Contacts"),
        ),
        body: ListView(
          children: const [
            SizedBox(
              height: 30,
            ),
            Text("Phone Log"),
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/my profile pic.jpg"),
              ),
              title: Text("Amos P Alex"),
              subtitle: Text("9633780485"),
              trailing: Icon(Icons.phone),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person),
              ),
              title: Text("Sajin Duglas"),
              subtitle: Row(
                children: [FaIcon(FontAwesomeIcons.whatsapp), Text("fek")],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("10.28"),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                    child: Text("8"),
                  )
                ],
              ),
            ),
            FaIcon(FontAwesomeIcons.facebook),
            SizedBox(
              height: 500,
            )
          ],
        ));
  }
}
