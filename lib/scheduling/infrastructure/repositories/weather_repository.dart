import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/weather_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_weather_respository.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_weather_remote_datasource.dart';

@Singleton(as: IWeatherRepository)
class WeatherRepository implements IWeatherRepository {
  final IWeatherRemoteDatasource weatherRemoteDatasource;

  WeatherRepository(this.weatherRemoteDatasource);

  @override
  Future<WeatherModel?> getWeatherData(
      double lat, double long, String time) async {
    return await weatherRemoteDatasource.getWeatherData(lat, long, time);
  }
}
