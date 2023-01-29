import 'package:biodiversity/common/resource.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationUseCase {
  GetLocationUseCase({
    required GeolocatorPlatform locator,
  }) : _locator = locator;

  final GeolocatorPlatform _locator;

  Stream<Resource<Position>> execute() async* {
    yield const Resource.loading();

    try {
      final position = await _locator.getCurrentPosition();

      yield Resource.success(position);
    } catch (_) {
      yield const Resource.error('ERROR.LOCATION_CANT_BE_FOUND');
    }
  }
}
