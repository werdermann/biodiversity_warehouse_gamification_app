import 'package:geolocator/geolocator.dart';

/// Repository that manages the location permission request.
abstract class PositionRepository {
  Future<LocationAccuracyStatus> requestPermission();
}
