import 'package:latlong2/latlong.dart';

class Constants {
  static String baseUrl = 'http://192.168.178.42:3000/';
  static String accessTokenStorageKey = '__access_token_key__';
  static String hasOnBoardingSeenKey = '__has_on_boarding_see_key__';
  static double zoomLevel = 16;
  static LatLng mapStartPosition =
      LatLng(53.891901513303246, 8.687039445348567);
  static LatLng onBoardingMapStartPosition =
      LatLng(53.888038887120246, 8.680851482537127);
}
