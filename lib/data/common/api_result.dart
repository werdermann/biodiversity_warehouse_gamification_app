import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

/// Represents the result that is returned by the api
@freezed
class ApiResult<T> with _$ApiResult<T> {
  /// An api result can be successful
  const factory ApiResult.success({required T data}) = Success<T>;

  /// An api result can fail
  const factory ApiResult.failure({required String error}) = Failure<T>;
}
