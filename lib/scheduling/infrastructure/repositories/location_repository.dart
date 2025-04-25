import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_location_repository.dart';

import '../datasource_contracts/i_location_local_datasource.dart';

@Singleton(as: ILocationRepository)
class LocationRepository implements ILocationRepository {
  final ILocationLocalDatasource _locationLocalDatasource;

  LocationRepository(
      {required ILocationLocalDatasource locationLocalDatasource})
      : _locationLocalDatasource = locationLocalDatasource;

  @override
  Future<Position> getCurrentPosition() async {
    return await _locationLocalDatasource.getCurrentPosition();
  }
}
