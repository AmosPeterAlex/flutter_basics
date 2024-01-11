import 'package:flutter/material.dart';
import 'package:flutter_starting_project/storage/shared%20prefernces/shared_home.dart';
import 'package:flutter_starting_project/storage/shared%20prefernces/shared_registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLogin extends StatefulWidget {
  @override
  State<SharedLogin> createState() => _SharedLoginState();
}

class _SharedLoginState extends State<SharedLogin> {
  final uname_controller = TextEditingController();
  final pass_controller = TextEditingController();
  late SharedPreferences preferences;
  late bool loggedIn;

  @override
  void initState() {
    // TODO: implement initState
    check_user_loggedin();
    super.initState();
  }

  void check_user_loggedin() async {
    loggedIn = preferences.getBool('loggedIn') ?? false;
    if (loggedIn == true) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SharedHome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page '),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
                controller: uname_controller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'UserName',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            TextField(
                controller: pass_controller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            MaterialButton(
              onPressed: () async {
                preferences = await SharedPreferences.getInstance();
                String uname = uname_controller.text;
                String pass = pass_controller.text;
                if (uname != '' && pass != '') {
                  preferences.setString('', uname);
                  preferences.setBool('logged In', true);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SharedHome()));
                }
              },
              child: Text('Login Here'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => SharedRegistration()));
                },
                child: Text('Register New Account'))
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SharedLogin(),
  ));
}
