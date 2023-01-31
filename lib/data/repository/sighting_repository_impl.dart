import 'dart:convert';
import 'dart:io';

import 'package:biodiversity/data/common/network_exceptions.dart';
import 'package:biodiversity/data/dto/create_sighting_dto.dart';
import 'package:biodiversity/data/rest_client.dart';
import 'package:biodiversity/domain/repository/sighting_repository.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class SightingRepositoryImpl implements SightingRepository {
  SightingRepositoryImpl({
    required Dio dio,
    required String baseUrl,
  }) : _biodiversityApi = RestClient(dio, baseUrl: baseUrl);

  final RestClient _biodiversityApi;

  @override
  Future<void> submitSighting({
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

      final json = jsonEncode(createSightingDto);

      print(json);

      final result = await _biodiversityApi.createSighting(
        // createSightingDto: json.toString(),
        createSightingDto: createSightingDto,
        files: multipartFiles,
      );

      return result;
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);

      final dio = NetworkExceptions.getDioError(exception);

      print("ERROR ${dio?.response}");

      throw exception;
    }

    print("CALL API!");
  }
}
