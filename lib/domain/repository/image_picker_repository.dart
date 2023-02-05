import 'dart:io';

/// Repository that allows the access to image from the camera and the gallery
/// of the device.
abstract class ImageRepository {
  Future<File?> takeImageFromCamera();
  Future<File?> takeImageFromGallery();
}
