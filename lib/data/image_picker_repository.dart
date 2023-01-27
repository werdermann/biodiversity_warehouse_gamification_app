import 'dart:io';

import 'package:biodiversity/domain/interfaces/image_picker_interface.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerRepository implements ImageRepositoryInterface {
  ImagePickerRepository({
    required ImagePicker imagePicker,
  }) : _imagePicker = imagePicker;

  final ImagePicker _imagePicker;

  @override
  Future<File?> takeImageFromCamera() async {
    final rawFile = await _imagePicker.pickImage(source: ImageSource.camera);

    final file = rawFile?.path != null ? File(rawFile!.path) : null;

    return file;
  }

  @override
  Future<File?> takeImageFromGallery() async {
    final rawFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    final file = rawFile?.path != null ? File(rawFile!.path) : null;

    return file;
  }
}
