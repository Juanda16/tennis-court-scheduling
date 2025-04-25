import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_location_repository.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/base_usecase.dart';

abstract interface class IGetCurrentLocationUseCase
    implements BaseUseCase<NoParam, Future<Position>> {}

/// Implementation of the [IGetCurrentLocationUseCase] use case.
@Singleton(as: IGetCurrentLocationUseCase)
class GetCurrentLocationUseCase implements IGetCurrentLocationUseCase {
  final ILocationRepository locationRepository;

  /// Constructor for [GetCurrentLocationUseCase].
  ///
  /// Requires a [locationRepository] instance to interact with the location repository.
  GetCurrentLocationUseCase(this.locationRepository);

  @override
  Future<Position> call(NoParam params) async {
    return locationRepository.getCurrentPosition();
  }
}
