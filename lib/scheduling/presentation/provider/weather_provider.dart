import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/coordinates.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/weather_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_weather_by_coordinates.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';

/// This provider manages the weather data based on the user's location.
/// It retrieves the weather information using the `getWeatherByCoordinates`
/// use case.
class WeatherProvider extends ChangeNotifier {
  WeatherProvider({
    required this.getWeatherByCoordinates,
  });

  IGetWeatherByCoordinates getWeatherByCoordinates;

  WeatherModel? weatherData;
  bool loading = false;
  String _rainProb = '';

  setRainProb(String weatherDesc) {
    log(weatherDesc);
    _rainProb = weatherDesc;
    notifyListeners();
  }

  String get rainProb {
    return _rainProb;
  }

  getWeather(BuildContext context, String time) async {
    final position = Provider.of<PositionProvider>(context, listen: false);
    loading = true;
    weatherData = await getWeatherByCoordinates.call(
      Coordinates(
        position.location?.latitude ?? 0.0,
        position.location?.longitude ?? 0.0,
        time,
      ),
    );
    setRainProb(
        weatherData?.weather?.first.description ?? 'error al cargar datos');
    loading = false;

    notifyListeners();
  }
}
