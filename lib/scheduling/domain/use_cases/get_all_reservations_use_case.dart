import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_reservation_repository.dart';

import 'base_usecase.dart';

abstract interface class IGetAllReservationsUseCase
    implements BaseUseCase<NoParam, Future<List<ScheduleModel>>> {}

@Singleton(as: IGetAllReservationsUseCase)
class GetAllReservationsUseCase implements IGetAllReservationsUseCase {
  final IReservationRepository reservationRepository;

  GetAllReservationsUseCase(this.reservationRepository);

  @override
  Future<List<ScheduleModel>> call(NoParam data) async {
    return await reservationRepository.getAllReservations();
  }
}
