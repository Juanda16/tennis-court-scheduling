import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_location_local_datasource.dart';

/// {@template location_local_datasource}
/// A concrete implementation of [ILocationLocalDatasource] that provides access
/// to the device's current location.
/// {@endtemplate}
@Singleton(as: ILocationLocalDatasource)
class LocationLocalDatasource implements ILocationLocalDatasource {
  /// {@macro location_local_datasource}
  LocationLocalDatasource();

  @override
  Future<Position> getCurrentPosition() async {
    try {
      await _checkLocationServiceEnabled();
      await _checkAndRequestPermission();
      return await Geolocator.getCurrentPosition();
    } on LocationServiceDisabledException catch (_) {
      rethrow;
    } catch (e) {
      throw Exception('Failed to get current position: $e');
    }
  }

  /// Checks if location services are enabled.
  ///
  /// Throws a [LocationServiceDisabledException] if the location service is
  /// disabled.
  Future<void> _checkLocationServiceEnabled() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }
  }

  /// Checks the current location permission and requests it if denied.
  ///
  /// Throws a [LocationPermissionDeniedException] if the permissions are denied
  /// or denied forever.
  Future<LocationPermission> _checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return permission;
  }
}
