import 'dart:io';

import 'package:biodiversity/common/resource.dart';
import 'package:biodiversity/domain/repository/image_picker_repository.dart';

class TakeGalleryImageUseCase {
  TakeGalleryImageUseCase({
    required ImageRepository imageRepository,
  }) : _imagePicker = imageRepository;

  final ImageRepository _imagePicker;

  Stream<Resource<File>> execute() async* {
    yield const Resource.loading();

    final file = await _imagePicker.takeImageFromGallery();

    if (file != null) {
      yield Resource.success(file);
    } else {
      yield const Resource.error('ERROR.TAKE_IMAGE_FAILED');
    }
  }
}
