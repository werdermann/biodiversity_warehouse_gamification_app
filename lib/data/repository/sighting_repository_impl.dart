import 'dart:io';

import 'package:biodiversity/data/biodiversity_api.dart';
import 'package:biodiversity/data/dto/create_sighting_dto.dart';
import 'package:biodiversity/data/dto/gamification_result_response.dart';
import 'package:biodiversity/domain/repository/sighting_repository.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

/// Implementation of the sighting repository.
class SightingRepositoryImpl implements SightingRepository {
  SightingRepositoryImpl({
    required Dio dio,
    required String baseUrl,
  }) : _biodiversityApi = BiodiversityApi(dio, baseUrl: baseUrl);

  final BiodiversityApi _biodiversityApi;

  @override
  Future<GamificationResultResponse> submitSighting({
    required CreateSightingDto createSightingDto,
    required List<File> images,
  }) async {
    try {
      final multipartFiles = <MultipartFile>[];

      for (final file in images) {
        final fileBytes = await file.readAsBytes();
        final multipartFile = MultipartFile.fromBytes(
          fileBytes,
          filename: file.path.split('/').last,
          contentType: MediaType('application', 'octet-stream'),
        );
        multipartFiles.add(multipartFile);
      }

      final result = await _biodiversityApi.createSighting(
        createSightingDto: createSightingDto,
        files: multipartFiles,
      );

      return result;
    } catch (_) {
      rethrow;
    }
  }
}
