import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// Represents a result that can either be successful or a failure.
@freezed
class Result<T> with _$Result<T> {
  /// An api result can be successful
  const factory Result.success({required T data}) = Success<T>;

  /// An api result can fail
  const factory Result.failure({required String error}) = Failure<T>;
}
