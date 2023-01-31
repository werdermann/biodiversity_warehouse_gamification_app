import 'dart:io';

import 'package:biodiversity/common/resource.dart';
import 'package:biodiversity/data/dto/create_sighting_dto.dart';
import 'package:biodiversity/domain/repository/sighting_repository.dart';

class SubmitSightingUseCase {
  SubmitSightingUseCase({
    required SightingRepository sightingRepository,
  }) : _sightingRepository = sightingRepository;

  final SightingRepository _sightingRepository;

  Stream<Resource> execute({
    required CreateSightingDto createSightingDto,
    required List<File> images,
  }) async* {
    yield Resource.loading();

    try {
      final result = _sightingRepository.submitSighting(
        createSightingDto: createSightingDto,
        images: images,
      );

      yield Resource.success('data');
    } catch (_) {
      print("ERROR RESULT!");

      yield Resource.error('ERROR.GENERAL');
    }
  }
}
