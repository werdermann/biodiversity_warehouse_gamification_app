import 'dart:io';

import 'package:biodiversity/data/dto/create_sighting_dto.dart';

abstract class SightingRepository {
  Future<void> submitSighting({
    required CreateSightingDto createSightingDto,
    required List<File> images,
  });
}
