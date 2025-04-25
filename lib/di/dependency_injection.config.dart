// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tennis_court_scheduling/scheduling/datasource/db/db.dart'
    as _i867;
import 'package:tennis_court_scheduling/scheduling/datasource/db/hive_reactive_database.dart'
    as _i880;
import 'package:tennis_court_scheduling/scheduling/datasource/local/court_local_datasource.dart'
    as _i866;
import 'package:tennis_court_scheduling/scheduling/datasource/local/location_local_datasource.dart'
    as _i331;
import 'package:tennis_court_scheduling/scheduling/datasource/local/reservation_local_datasource.dart'
    as _i489;
import 'package:tennis_court_scheduling/scheduling/datasource/local/user_local_datasource.dart'
    as _i182;
import 'package:tennis_court_scheduling/scheduling/datasource/remote/weather_remote_datasource.dart'
    as _i334;
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_court_respository.dart'
    as _i193;
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_location_repository.dart'
    as _i716;
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_reservation_repository.dart'
    as _i219;
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_user_repository.dart'
    as _i608;
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_weather_respository.dart'
    as _i67;
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/book_court.dart'
    as _i947;
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/cancel_reservation.dart'
    as _i431;
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/check_reservation_already_exist.dart'
    as _i347;
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/create_user.dart'
    as _i878;
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_all_courts.dart'
    as _i646;
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_all_reservations_use_case.dart'
    as _i437;
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_current_location.dart'
    as _i304;
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_weather_by_coordinates.dart'
    as _i806;
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_court_local_datasource.dart'
    as _i326;
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_location_local_datasource.dart'
    as _i710;
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_reservation_local_datasource.dart'
    as _i860;
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_user_local_data_source.dart'
    as _i456;
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_weather_remote_datasource.dart'
    as _i867;
import 'package:tennis_court_scheduling/scheduling/infrastructure/repositories/court_repository.dart'
    as _i1072;
import 'package:tennis_court_scheduling/scheduling/infrastructure/repositories/location_repository.dart'
    as _i993;
import 'package:tennis_court_scheduling/scheduling/infrastructure/repositories/reservation_repository.dart'
    as _i86;
import 'package:tennis_court_scheduling/scheduling/infrastructure/repositories/user_repository.dart'
    as _i657;
import 'package:tennis_court_scheduling/scheduling/infrastructure/repositories/weather_repository.dart'
    as _i322;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i867.IWeatherRemoteDatasource>(
        () => _i334.WeatherRemoteDatasource());
    gh.singleton<_i710.ILocationLocalDatasource>(
        () => _i331.LocationLocalDatasource());
    gh.singleton<_i867.IBaseDatabase>(() => _i880.HiveDatabase());
    gh.singleton<_i456.IUserLocalDataSource>(
        () => _i182.UserLocalDataSource(database: gh<_i867.IBaseDatabase>()));
    gh.singleton<_i860.IReservationLocalDataSource>(() =>
        _i489.ReservationLocalDataSource(database: gh<_i867.IBaseDatabase>()));
    gh.singleton<_i326.ICourtLocalDatasource>(
        () => _i866.CourtLocalDataSource(database: gh<_i867.IBaseDatabase>()));
    gh.singleton<_i67.IWeatherRepository>(
        () => _i322.WeatherRepository(gh<_i867.IWeatherRemoteDatasource>()));
    gh.singleton<_i219.IReservationRepository>(() =>
        _i86.ReservationRepository(gh<_i860.IReservationLocalDataSource>()));
    gh.singleton<_i193.ICourtRepository>(
        () => _i1072.CourtRepository(gh<_i326.ICourtLocalDatasource>()));
    gh.singleton<_i431.ICancelReservationUseCase>(() =>
        _i431.CancelReservationUseCase(gh<_i219.IReservationRepository>()));
    gh.singleton<_i947.IBookCourtUseCase>(
        () => _i947.BookCourtUseCase(gh<_i219.IReservationRepository>()));
    gh.singleton<_i716.ILocationRepository>(() => _i993.LocationRepository(
        locationLocalDatasource: gh<_i710.ILocationLocalDatasource>()));
    gh.singleton<_i304.IGetCurrentLocationUseCase>(
        () => _i304.GetCurrentLocationUseCase(gh<_i716.ILocationRepository>()));
    gh.singleton<_i608.IUserRepository>(() => _i657.UserRepository(
        userLocalDataSource: gh<_i456.IUserLocalDataSource>()));
    gh.singleton<_i347.ICheckReservationAlreadyExist>(() =>
        _i347.CheckReservationAlreadyExist(gh<_i219.IReservationRepository>()));
    gh.singleton<_i646.IGetAllCourtsUseCase>(
        () => _i646.GetAllCourtsUseCase(gh<_i193.ICourtRepository>()));
    gh.singleton<_i437.IGetAllReservationsUseCase>(() =>
        _i437.GetAllReservationsUseCase(gh<_i219.IReservationRepository>()));
    gh.singleton<_i806.IGetWeatherByCoordinates>(
        () => _i806.GetWeatherByCoordinates(gh<_i67.IWeatherRepository>()));
    gh.singleton<_i878.ICreateUser>(
        () => _i878.CreateUser(gh<_i608.IUserRepository>()));
    return this;
  }
}
