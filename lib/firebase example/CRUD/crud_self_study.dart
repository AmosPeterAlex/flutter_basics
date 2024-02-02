import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrudFirebase extends StatefulWidget {
  const CrudFirebase({super.key});

  @override
  State<CrudFirebase> createState() => _CrudFirebaseState();
}

class _CrudFirebaseState extends State<CrudFirebase> {
  final nameControl = TextEditingController();
  final ageControl = TextEditingController();
  late CollectionReference _userCollection;

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection('user');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: nameControl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ageControl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    addData();
                  },
                  child: Text('Add Data')),
              StreamBuilder<QuerySnapshot>(
                  stream: getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('has error ${snapshot.error}');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    final user = snapshot.data!.docs;
                    return Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        final userData = user[index];
                        final userID = userData.id;
                        final userName = userData['name'];
                        final userAge = userData['age'];

                        return ListTile(
                          title: Text(userName),
                          subtitle: Text(userAge),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () {
                                  updateData(userID);
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                  onPressed: () {
                                    deleteData(userID);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        );
                      },
                      itemCount: user.length,
                    ));
                  })

            ],
          ),
        ),
      ),
    );
  }

  Future<void> addData() async {
    return _userCollection
        .add({'name': nameControl.text, 'age': ageControl.text}).then((value) {
      nameControl.clear();
      ageControl.clear();
    }).catchError((onError) {
      print(' errror is $onError');
    });
  }

  Stream<QuerySnapshot> getUser() {
    return _userCollection.snapshots();
  }

  void updateData(String userID) {
    showDialog(
        context: context,
        builder: (context) {
          var newName = TextEditingController();
          var newAge = TextEditingController();
          return AlertDialog(
            title: Text('Update User'),
            content: Column(mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: newName,
                ),
                TextField(
                  controller: newAge,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    editData(userID, newName.text, newAge.text);
                    Navigator.pop(context);
                  },
                  child: Text('Update'))
            ],
          );
        });
  }

  void deleteData(String userID) async{
    return _userCollection.doc(userID).delete().then((value){
      print('Succees');
    }).catchError((error){
      print('errore is $error');
    });
  }

  void editData(String userID, String text, String text1) async{
    return _userCollection.doc(userID).update({'name':text,'age':text1}).then((value){
      print('Success ');
    }).catchError((error){
      print('error is $error');
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyB8tz45w1Lp_Wed8UnytYEZ76qUNHL6K2Y',
          appId: "1:674213172466:android:33fc9c650f8864c228ec6b",
          messagingSenderId: '',
          projectId: 'fir-studyamos',
          storageBucket: 'fir-studyamos.appspot.com'));
  runApp(MaterialApp(
    home: CrudFirebase(),
  ));
}
