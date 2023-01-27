import 'dart:io';

import 'package:biodiversity/data/common/result.dart';
import 'package:biodiversity/domain/interfaces/image_picker_interface.dart';

class TakeGalleryImageUseCase {
  TakeGalleryImageUseCase({
    required ImageRepositoryInterface imageRepository,
  }) : _imagePicker = imageRepository;

  final ImageRepositoryInterface _imagePicker;

  Future<Result<File>> execute() async {
    final file = await _imagePicker.takeImageFromGallery();

    if (file != null) {
      return Result.success(data: file);
    } else {
      return const Result.failure(error: 'ERROR.TAKE_IMAGE_FAILED');
    }
  }
}
