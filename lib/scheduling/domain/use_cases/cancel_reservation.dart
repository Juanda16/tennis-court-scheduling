import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_reservation_repository.dart';

import 'base_usecase.dart';

abstract interface class ICancelReservationUseCase
    implements BaseUseCase<String, Future<void>> {}

@Singleton(as: ICancelReservationUseCase)
class CancelReservationUseCase implements ICancelReservationUseCase {
  final IReservationRepository reservationRepository;

  /// Constructor for [CancelReservationUseCase].
  ///
  /// Requires a [reservationRepository] instance to interact with the reservation repository.
  CancelReservationUseCase(this.reservationRepository);

  @override
  Future<void> call(String reservationId) async {
    await reservationRepository.deleteReservation(reservationId);
  }
}
