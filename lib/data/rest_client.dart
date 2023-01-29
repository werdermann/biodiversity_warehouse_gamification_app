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

  @GET('profile')
  Future<User> getUser();
}
