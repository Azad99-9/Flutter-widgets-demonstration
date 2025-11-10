import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_project/services/firebase_storage_service.dart';
import 'package:first_project/services/image_picker_service.dart';
import 'package:flutter/material.dart';

class FirebaseStorageView extends StatefulWidget {
  const FirebaseStorageView({super.key});

  @override
  State<FirebaseStorageView> createState() => _FirebaseStorageViewState();
}

class _FirebaseStorageViewState extends State<FirebaseStorageView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage'),
      ),  
      body: Column(
        children: [
          CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/firstprojectexample.firebasestorage.app/o/users%2Fshaik_azad%2Fprofile.jpg?alt=media&token=66d99890-d412-4255-9599-c4d9a924e1ab"),
          ElevatedButton(onPressed: () async {
            try {
              File? file = await pickImage();
              print("file has been successfully picked");
              if (file != null) {
                setState(() {
                  isLoading = true;
                });
                final url = await uploadImage(file, "shaik_azad");
                print("Image has been successfully uploaded");
                print(url);
                setState(() {
                  isLoading = false;
                });
              }
            } catch (e) {
              print(e);
            }
          }, child: isLoading ? CircularProgressIndicator() : Text('Pick Image')),
        ],
      ),
    );
  }
}