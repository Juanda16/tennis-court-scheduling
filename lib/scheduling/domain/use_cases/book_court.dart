import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/schedule_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_reservation_repository.dart';

import 'base_usecase.dart';

abstract interface class IBookCourtUseCase
    implements BaseUseCase<ScheduleModel, Future<bool>> {}

/// Implementation of the [IBookCourt] use case.
@Singleton(as: IBookCourtUseCase)
class BookCourtUseCase implements IBookCourtUseCase {
  final IReservationRepository reservationRepository;

  /// Constructor for [BookCourt] use case.
  ///
  /// Requires a [userRepository] instance to interact with the user repository.
  BookCourtUseCase(this.reservationRepository);

  @override
  Future<bool> call(ScheduleModel schedule) async {
    return await reservationRepository.createReservation(schedule);
  }
}
