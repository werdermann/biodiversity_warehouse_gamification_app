import 'dart:io';

import 'package:biodiversity/common/resource.dart';
import 'package:biodiversity/domain/repository/image_picker_repository.dart';

/// Use case for making a photo with the camera for the sighting process.
class TakeCameraImageUseCase {
  TakeCameraImageUseCase({
    required ImageRepository imageRepository,
  }) : _imagePicker = imageRepository;

  final ImageRepository _imagePicker;

  Stream<Resource<File>> execute() async* {
    yield const Resource.loading();

    final file = await _imagePicker.takeImageFromCamera();

    if (file != null) {
      yield Resource.success(file);
    } else {
      yield const Resource.error('ERROR.TAKE_IMAGE_FAILED');
    }
  }
}
