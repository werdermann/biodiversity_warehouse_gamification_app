import 'dart:io';

import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/data/dto/create_sighting_dto.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:biodiversity/domain/repository/sighting_repository.dart';

class SubmitSightingUseCase {
  SubmitSightingUseCase({
    required SightingRepository sightingRepository,
    required GamificationRepository gamificationRepository,
    required AuthRepository authRepository,
  })  : _sightingRepository = sightingRepository,
        _gamificationRepository = gamificationRepository,
        _authRepository = authRepository;

  final SightingRepository _sightingRepository;
  final GamificationRepository _gamificationRepository;
  final AuthRepository _authRepository;

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

      _authRepository.updateUser(user: result.user);

      _gamificationRepository.updateResult(result: result);

      yield const EmptyResource.success();
    } catch (_) {
      yield const EmptyResource.error('ERROR.GENERAL');
    }
  }
}
