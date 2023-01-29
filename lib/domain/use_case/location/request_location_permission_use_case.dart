import 'package:biodiversity/common/empty_resource.dart';
import 'package:geolocator/geolocator.dart';

class RequestLocationPermissionUseCase {
  RequestLocationPermissionUseCase({required GeolocatorPlatform locator})
      : _locator = locator;

  final GeolocatorPlatform _locator;

  Stream<EmptyResource> execute() async* {
    yield const EmptyResource.loading();

    final isServiceEnabled = await _locator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      yield const EmptyResource.error('ERROR.LOCATION_PERMISSION_DISABLED');
    } else {
      // Request permission
      var permission = await _locator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await _locator.requestPermission();

        if (permission == LocationPermission.denied) {
          yield const EmptyResource.error('ERROR.LOCATION_PERMISSION_DISABLED');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        yield const EmptyResource.error('ERROR.LOCATION_PERMISSION_DISABLED');
      }
    }
  }
}
