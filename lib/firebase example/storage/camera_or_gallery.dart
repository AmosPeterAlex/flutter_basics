import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

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
    home: FirebaseImageStorage(),
  ));
}

class FirebaseImageStorage extends StatefulWidget {
  const FirebaseImageStorage({super.key});

  @override
  State<FirebaseImageStorage> createState() => _FirebaseImageStorageState();
}

class _FirebaseImageStorageState extends State<FirebaseImageStorage> {
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Store'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () => upload("camera"),
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: const Text('Camera'),
                ),
                ElevatedButton.icon(
                  onPressed: () => upload("gallery"),
                  icon: const Icon(Icons.photo),
                  label: const Text('Gallery'),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: loadMedia(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final image = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(image['imageUrl']),
                          trailing: IconButton(
                            onPressed: () => deleteMedia(image['path']),
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data?.length ?? 0,
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }

  ///upload image to firebase
  Future<void> upload(String imageFrom) async {
    final picker = ImagePicker();
    XFile? pickedImage; //Used for cross platform

    try {
      pickedImage = await picker.pickImage(
          source:
              imageFrom == "camera" ? ImageSource.camera : ImageSource.gallery);
      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);
      try {
        await storage.ref(fileName).putFile(imageFile);
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (error) {
      print(error);
    }
    setState(() {});
  }

  ///load images from firebase
  Future<List<Map<String, dynamic>>> loadMedia() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;
    await Future.forEach(
      allFiles,
      (singleFile) async {
        final String fileUrl = await singleFile.getDownloadURL();

        images.add(
          {
            'imageUrl': fileUrl,
            'path': singleFile.fullPath,
          },
        );
      },
    );
    return images;
  }

  ///delete from firebase
  Future<void> deleteMedia(String imagePath) async {
    await storage.ref(imagePath).delete();
    setState(() {});
  }
}
