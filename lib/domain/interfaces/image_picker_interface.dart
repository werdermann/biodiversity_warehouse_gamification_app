import 'dart:io';

abstract class ImageRepositoryInterface {
  Future<File?> takeImageFromCamera();
  Future<File?> takeImageFromGallery();
}
