import 'dart:io';

abstract class ImageRepository {
  Future<File?> takeImageFromCamera();
  Future<File?> takeImageFromGallery();
}
