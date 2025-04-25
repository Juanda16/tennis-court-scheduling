import 'package:geolocator/geolocator.dart';

abstract interface class ILocationRepository {
  /// Retrieves the current location of the user.
  ///
  /// Returns a [Position] object containing the latitude and longitude.
  Future<Position> getCurrentPosition();
}
