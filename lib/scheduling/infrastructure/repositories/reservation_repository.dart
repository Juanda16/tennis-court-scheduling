import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/schedule_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_reservation_repository.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_reservation_local_datasource.dart';

@Singleton(as: IReservationRepository)
class ReservationRepository implements IReservationRepository {
  final IReservationLocalDataSource reservationLocalDataSource;

  ReservationRepository(this.reservationLocalDataSource);

  @override
  Future<bool> createReservation(ScheduleModel reservation) {
    return reservationLocalDataSource.createReservation(reservation);
  }

  @override
  Future<ScheduleModel?> readReservation(String reservationId) {
    return reservationLocalDataSource.readReservation(reservationId);
  }

  @override
  Future<void> updateReservation(ScheduleModel reservation) {
    return reservationLocalDataSource.updateReservation(reservation);
  }

  @override
  Future<List<ScheduleModel>> getAllReservations() {
    return reservationLocalDataSource.getAllReservations();
  }

  @override
  Future<void> deleteReservation(String reservationId) {
    return reservationLocalDataSource.deleteReservation(reservationId);
  }

  @override
  Future<bool> reservationExists(String reservationId) {
    return reservationLocalDataSource.reservationExists(reservationId);
  }
}
