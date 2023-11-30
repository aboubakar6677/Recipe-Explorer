// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ImagePickerController {
//   Future<File?> pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//     return pickedFile != null ? File(pickedFile.path) : null;
//   }

//   Future<void> saveImagePath(String path) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('imagePath', path);
//   }

//   Future<String?> getImagePath() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('imagePath');
//   }
// }
