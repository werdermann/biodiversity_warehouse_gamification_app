// Convert is required for parsing objects in a multiform request.
// ignore: unused_import
import 'dart:convert';

import 'package:biodiversity/data/dto/create_sighting_dto.dart';
import 'package:biodiversity/data/dto/gamification_config.dart';
import 'package:biodiversity/data/dto/login_result.dart';
import 'package:biodiversity/data/dto/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('auth/login')
  Future<LoginResult> login({
    @Field('username') required String username,
    @Field('password') required String password,
  });

  // TODO: Check how to combine these.
  // TODO: https://github.com/trevorwang/retrofit.dart/issues/529

  @MultiPart()
  @POST('sighting')
  Future<dynamic> createSighting({
    @Part() required CreateSightingDto createSightingDto,
    @Part() required List<MultipartFile> files,
  });

  @GET('gamification')
  Future<GamificationConfig> getGamificationConfig();

  @GET('profile')
  Future<User> getUser();
}
