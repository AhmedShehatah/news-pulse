import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../enums/image_type_enum.dart';

class AttachemntUtils {
  final _picker = ImagePicker();

  Future<File?> getOneImage(ImageTypeEnum imageTypeEnum) async {
    File? pickedFile;
    if (imageTypeEnum == ImageTypeEnum.GALLERY) {
      pickedFile = await _getOneImageFromGallery();
    } else {
      pickedFile = await _getOneImageFromCamera();
    }
    if (pickedFile != null) return File(pickedFile.path);
    return null;
  }

  Future<File?> _getOneImageFromGallery() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> _getOneImageFromCamera() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
