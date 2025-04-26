import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/datasource/constants.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/weather_model.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_weather_remote_datasource.dart';

@Singleton(as: IWeatherRemoteDatasource)
class WeatherRemoteDatasource implements IWeatherRemoteDatasource {
  @override
  Future<WeatherModel?> getWeatherData(
      double lat, double long, String time) async {
    /// Fetches weather data from the OpenWeatherMap API for a given latitude,
    /// longitude, and time.
    ///
    /// Returns a [WeatherModel] object containing the weather data.
    /// Throws an exception if the API call fails or returns an error.
    ///
    /// Parameters:
    /// - [lat]: Latitude of the location.
    /// - [long]: Longitude of the location.
    /// - [time]: Time for which to fetch the weather data.
    WeatherModel? result;
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&dt=$time&appid=$weatherApiKey&lang=es"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = WeatherModel.fromJson(item);
      } else {
        log("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
