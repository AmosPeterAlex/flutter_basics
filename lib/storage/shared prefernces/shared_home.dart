import 'package:flutter/material.dart';
import 'package:flutter_starting_project/storage/shared%20prefernces/shared_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHome extends StatefulWidget {
  const SharedHome({super.key});

  @override
  State<SharedHome> createState() => _SharedHomeState();
}

class _SharedHomeState extends State<SharedHome> {
  late String uname;
  late SharedPreferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    fetch_data();
    super.initState();
  }

  void fetch_data() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      uname = preferences.getString('Amos')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello $uname '),
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setBool('loggedIn', false);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SharedLogin()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('hello $uname'),
      ),
    );
  }
}
