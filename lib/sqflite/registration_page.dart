import 'package:flutter/material.dart';

class RegistartionSQlite extends StatelessWidget {
  // const RegistartionSQlite({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final passController = TextEditingController();
    final cPassController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              TextFormField(
                  controller: cPassController,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              ElevatedButton(onPressed: () {
                var valid=formKey.currentState!.validate();
                if(valid==true){}else{}

              }, child: Text("Register Now"))
            ],
          ),
        ),
      ),
    );
  }
}
