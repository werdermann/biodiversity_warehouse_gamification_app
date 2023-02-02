import 'dart:io';

import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/data/dto/create_sighting_dto.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:biodiversity/domain/repository/sighting_repository.dart';

class SubmitSightingUseCase {
  SubmitSightingUseCase({
    required SightingRepository sightingRepository,
    required GamificationRepository gamificationRepository,
  })  : _sightingRepository = sightingRepository,
        _gamificationRepository = gamificationRepository;

  final SightingRepository _sightingRepository;
  final GamificationRepository _gamificationRepository;

  Stream<EmptyResource> execute({
    required CreateSightingDto createSightingDto,
    required List<File> images,
  }) async* {
    yield const EmptyResource.loading();

    try {
      final result = await _sightingRepository.submitSighting(
        createSightingDto: createSightingDto,
        images: images,
      );

      print("UPDATE RESULT ! ${result}");
      _gamificationRepository.updateResult(result: result);

      yield const EmptyResource.success();
    } catch (_) {
      yield const EmptyResource.error('ERROR.GENERAL');
    }
  }
}
