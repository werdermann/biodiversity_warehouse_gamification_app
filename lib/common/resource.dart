import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';

/// Represents a result that can either be successful, an error or indicate the
/// loading process.
///
/// The successful result returns data.
@freezed
class Resource<T> with _$Resource<T> {
  const factory Resource.loading() = Loading<T>;
  const factory Resource.success(T data) = Success<T>;
  const factory Resource.error(String messageKey) = Error<T>;
}
