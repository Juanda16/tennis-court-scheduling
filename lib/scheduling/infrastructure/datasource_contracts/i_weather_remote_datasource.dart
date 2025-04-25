import 'package:tennis_court_scheduling/scheduling/domain/entities/weather_model.dart';

abstract interface class IWeatherRemoteDatasource {
  /// Fetches weather data from the remote API using latitude, longitude, and time.
  Future<WeatherModel?> getWeatherData(double lat, double long, String time);
}
