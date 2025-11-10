import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadImage(File file, String uid) async {
  final ref = FirebaseStorage.instance
      .ref()
      .child("users/$uid/profile.jpg");

  final uploadTask = ref.putFile(file);

  uploadTask.snapshotEvents.listen((event) {
    double progress = event.bytesTransferred / event.totalBytes;
    print("Uploading: ${(progress * 100).toStringAsFixed(0)}%");
  });

  await uploadTask;
  return await ref.getDownloadURL();
}
