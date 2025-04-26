import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/no_param.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_current_location.dart';

/// This provider manages the user's current location and address.
/// It retrieves the location using the `getCurrentLocationUseCase`
/// and converts the coordinates to a human-readable address.
class PositionProvider extends ChangeNotifier {
  PositionProvider({
    required this.getCurrentLocationUseCase,
  });

  final IGetCurrentLocationUseCase getCurrentLocationUseCase;

  Position? _location;
  String? _address;

  void getLocation() async {
    Position position = await getCurrentLocationUseCase.call(NoParam.i);
    saveLocation(position);
  }

  void saveLocation(Position location) {
    _location = location;
    _getAddressFromLatLng(location);

    notifyListeners();
  }

  Position? get location {
    return _location;
  }

  String? get address {
    return _address;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      _address = "${place.street}, ${place.locality}, ${place.country}";
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
