// Convert is required for parsing objects in a multiform request.
// ignore: unused_import
import 'dart:convert';

import 'package:biodiversity/data/dto/create_sighting_dto.dart';
import 'package:biodiversity/data/dto/gamification_config.dart';
import 'package:biodiversity/data/dto/gamification_result_response.dart';
import 'package:biodiversity/data/dto/leaderboard_response.dart';
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

  @MultiPart()
  @POST('sighting')
  Future<GamificationResultResponse> createSighting({
    @Part() required CreateSightingDto createSightingDto,
    @Part() required List<MultipartFile> files,
  });

  @GET('gamification/config')
  Future<GamificationConfig> getGamificationConfig();

  @GET('gamification/leaderboard')
  Future<LeaderboardResponse> getLeaderboard({
    @Field('username') required String username,
  });

  @GET('user/me')
  Future<User> getUser();
}
