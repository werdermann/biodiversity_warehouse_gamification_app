import 'package:biodiversity/domain/repository/position_repository.dart';
import 'package:geolocator/geolocator.dart';

class PositionRepositoryImpl implements PositionRepository {
  PositionRepositoryImpl({
    required GeolocatorPlatform locator,
  }) : _locator = locator;

  final GeolocatorPlatform _locator;

  Future<LocationAccuracyStatus> requestPermission() async {
    return await _locator.requestTemporaryFullAccuracy(
      purposeKey: 'YourPurposeKey',
    );
  }
}
