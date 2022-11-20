import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

Future<XFile?> pickImage(BuildContext? context, {bool camera = false}) async {
  try {
    final XFile? file = await ImagePicker().pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 25,
    );
    return file;
  } catch (e) {
    showDialog(
      context: context!,
      builder: (context) {
        return const AlertDialog(
          title: Text("Error"),
          content: Text(
            "Maaf, terjadi kesalahan saat mengambil gambar",
          ),
        );
      },
    );
  }
}
