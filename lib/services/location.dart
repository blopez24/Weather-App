import 'package:geolocator/geolocator.dart';

class Location {
  /// The latitude of the phone's location.
  double latitude;

  /// The longitude of the phone's location.
  double longitude;

  /// Uses geolocator package to obtain location.
  Future<void> getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
