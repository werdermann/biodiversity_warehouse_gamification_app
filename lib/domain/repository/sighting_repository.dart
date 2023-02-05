import 'dart:io';

import 'package:biodiversity/data/dto/create_sighting_dto.dart';
import 'package:biodiversity/data/dto/gamification_result_response.dart';

/// Repository that allows the user to submit his sighting to the backend.
abstract class SightingRepository {
  Future<GamificationResultResponse> submitSighting({
    required CreateSightingDto createSightingDto,
    required List<File> images,
  });
}
