import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CrudFirebase extends StatefulWidget {
  const CrudFirebase({super.key});

  @override
  State<CrudFirebase> createState() => _CrudFirebaseState();
}

class _CrudFirebaseState extends State<CrudFirebase> {
  final nameControl = TextEditingController();
  final ageControl = TextEditingController();
  late CollectionReference
      _userCollection; // Reference to the Firestore 'user' collection

  @override
  void initState() {
    // Initialization function called when the state is first created
    _userCollection = FirebaseFirestore.instance
        .collection('user'); // Initialize the user collection reference
    super.initState(); // Call the superclass initState method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: nameControl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ), // Input decoration
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ageControl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ), // Input decoration
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
                // StreamBuilder widget for listening to changes in Firestore data
                stream: getUser(),
                // Stream to listen to changes in the user collection
                builder: (context, snapshot) {
                  // Builder function to build UI based on stream data
                  if (snapshot.hasError) {
                    // Check if snapshot has error
                    return Text(
                        'has error ${snapshot.error}'); // Show error message
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Check if connection state is waiting
                    return CircularProgressIndicator();
                  }
                  final user =
                      snapshot.data!.docs; // Extract documents from snapshot
                  return Expanded(
                    // Expanded widget to fill remaining space
                    child: ListView.builder(
                      // ListView.builder widget to build list of items
                      itemBuilder: (context, index) {
                        // Item builder function
                        final userData =
                            user[index]; // Get user data at current index
                        final userID = userData.id; // Get user ID
                        final userName = userData['name']; // Get user name
                        final userAge = userData['age']; // Get user age

                        return ListTile(
                          title: Text(userName),
                          subtitle: Text(userAge),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () {
                                  updateData(userID);
                                },
                                icon: Icon(Icons.edit), // Edit icon
                              ),
                              IconButton(
                                onPressed: () {
                                  deleteData(userID);
                                },
                                icon: Icon(Icons.delete),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: user.length,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addData() async {
    // Function to add data to Firestore
    return _userCollection // Return a Future
        .add({'name': nameControl.text, 'age': ageControl.text}).then((value) {
      // Add data to Firestore and handle success
      nameControl.clear(); // Clear name input
      ageControl.clear(); // Clear age input
    }).catchError((onError) {
      // Catch and handle errors
      print(' errror is $onError');
    });
  }

  Stream<QuerySnapshot> getUser() {
    // Function to get user data from Firestore
    return _userCollection.snapshots(); // Return stream of user data
  }

  void updateData(String userID) {
    // Function to update user data in Firestore
    showDialog(
      // Show dialog for updating user data
      context: context, // Dialog context
      builder: (context) {
        // Dialog builder function
        var newName =
            TextEditingController(); // TextEditingController for new name input
        var newAge =
            TextEditingController(); // TextEditingController for new age input
        return AlertDialog(
          // AlertDialog widget for update dialog
          title: Text('Update User'), // Dialog title
          content: Column(
            mainAxisSize: MainAxisSize.min,
            // Column widget for dialog content
            children: [
              TextField(
                // TextField widget for new name input
                controller: newName, // Assigning the TextEditingController
              ),
              TextField(
                // TextField widget for new age input
                controller: newAge, // Assigning the TextEditingController
              )
            ],
          ),
          actions: [
            // Dialog actions
            TextButton(
              // TextButton widget for update action
              onPressed: () {
                editData(userID, newName.text, newAge.text);
                Navigator.pop(context);
              },
              child: Text('Update'),
            )
          ],
        );
      },
    );
  }

  void deleteData(String userID) async {
    // Function to delete user data from Firestore
    return _userCollection.doc(userID).delete().then((value) {
      // Delete user data and handle success
      print('Succees'); // Print success message
    }).catchError((error) {
      // Catch and handle errors
      print('error is $error'); // Print error message
    });
  }

  void editData(String userID, String text, String text1) async {
    // Function to edit user data in Firestore
    return _userCollection
        .doc(userID)
        .update({'name': text, 'age': text1}).then((value) {
      // Update user data and handle success
      print('Success '); // Print success message
    }).catchError((error) {
      // Catch and handle errors
      print('error is $error'); // Print error message
    });
  }
}

void main() async {
  // Main function to run the Flutter application
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyB8tz45w1Lp_Wed8UnytYEZ76qUNHL6K2Y',
          appId: "1:674213172466:android:33fc9c650f8864c228ec6b",
          messagingSenderId: '',
          projectId: 'fir-studyamos',
          storageBucket: 'fir-studyamos.appspot.com'));
  runApp(
    MaterialApp(
      home: CrudFirebase(),
    ),
  );
}

/* Code basically written by me, and above code is explained version by Chat gpt
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
                    ),);
                  },)

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


 */
