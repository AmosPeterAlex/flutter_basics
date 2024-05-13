import 'package:flutter/material.dart';
import 'package:flutter_starting_project/healther%20test/controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormData(),
      child: MaterialApp(
        home: ScreenOne(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  // const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ScreenTwo()));
          },
          child: Icon(Icons.arrow_forward_ios),
          color: Colors.lightBlueAccent,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Consumer<FormData>(
              builder: (context, formData, _) {
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        onChanged: (name) => formData.setName(name),
                        validator: (name) {
                          if (name!.isEmpty) {
                            return 'Your name should be of 4 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (email) => formData.setEmail(email),
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!email.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SuccessScreen(),
                              ),
                            );
                            formData.clear();
                          }
                        },
                        child: const Text("Submit"),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  // const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Success',
          style: TextStyle(
              fontSize: 30, letterSpacing: 1.5, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
