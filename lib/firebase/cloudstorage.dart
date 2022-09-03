import 'dart:io';

import 'package:image_picker/image_picker.dart';

uploadImage()async{
  final ImagePicker _picker = ImagePicker();

  final XFile? pickedFile = await _picker.pickImage(source:ImageSource.gallery);
  File file = File(pickedFile!.path);
  return file;
}