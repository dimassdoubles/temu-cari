import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

Future<String> uploadImage(File imageFile) async {
  // imageFile.path akan beri alamat penuh file
  // untuk mengambil nama filenya kita menggunakan basename
  String fileName = basename(imageFile.path);

  // membuat referensi ke imageFile
  final storageRef = FirebaseStorage.instance.ref().child(fileName);

  // mengupload file
  await storageRef.putFile(imageFile);

  // mendapatkan url download
  return await storageRef.getDownloadURL();
}
