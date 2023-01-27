import 'package:freezed_annotation/freezed_annotation.dart';

part 'empty_resource.freezed.dart';

/// Represents a result that can either be successful or a failure.
@freezed
class EmptyResource with _$EmptyResource {
  const factory EmptyResource.loading() = Loading;
  const factory EmptyResource.success() = Success;
  const factory EmptyResource.error(String message) = Error;
}
