import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/coordinates.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/weather_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_weather_respository.dart';

import 'base_usecase.dart';

abstract interface class IGetWeatherByCoordinates
    implements BaseUseCase<Coordinates, Future<WeatherModel?>> {}

@Singleton(as: IGetWeatherByCoordinates)
class GetWeatherByCoordinates implements IGetWeatherByCoordinates {
  final IWeatherRepository weatherRepository;

  GetWeatherByCoordinates(this.weatherRepository);

  @override
  Future<WeatherModel?> call(Coordinates coordinates) async {
    return await weatherRepository.getWeatherData(
        coordinates.latitude, coordinates.longitude, coordinates.time);
  }
}
