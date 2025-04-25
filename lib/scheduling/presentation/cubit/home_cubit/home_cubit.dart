import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      // {
      //   required this.getWeatherByCoordinates,
      // }
      )
      : super(const HomeState.initial());
  //
  // final IGetWeatherByCoordinates getWeatherByCoordinates;
  //
  // Future<void> getWeather(
  //     double latitude, double longitude, DateTime time) async {
  //   emit(const HomeState.loading());
  //
  //   WeatherModel? weather = await getWeatherByCoordinates(
  //     Coordinates(
  //       latitude,
  //       longitude,
  //       time,
  //     ),
  //   );
  //   if (weather != null) {
  //     emit(HomeState.loaded(weather: weather));
  //   } else {
  //     emit(const HomeState.error(message: 'Error getting weather data'));
  //   }
  // }
}
