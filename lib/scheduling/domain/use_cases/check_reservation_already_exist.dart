import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_reservation_repository.dart';

import 'base_usecase.dart';

abstract interface class ICheckReservationAlreadyExist
    implements BaseUseCase<ScheduleModel, Future<bool>> {}

/// Implementation of the [ICheckReservationAlreadyExist] use case.
@Singleton(as: ICheckReservationAlreadyExist)
class CheckReservationAlreadyExist implements ICheckReservationAlreadyExist {
  final IReservationRepository reservationRepository;

  /// Constructor for [CheckReservationAlreadyExist].
  ///
  /// Requires a [reservationRepository] instance to interact with the reservation repository.
  CheckReservationAlreadyExist(this.reservationRepository);

  @override
  Future<bool> call(ScheduleModel schedule) async {
    return await reservationRepository.reservationExists(schedule.id);
  }
}
