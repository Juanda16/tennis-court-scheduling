import 'package:tennis_court_scheduling/scheduling/domain/entities/schedule_model.dart';

abstract interface class IReservationLocalDataSource {
  /// Creates a new reservation in the repository.
  ///
  /// Requires a [reservation] instance for creating the reservation.
  Future<bool> createReservation(ScheduleModel reservation);

  /// Watches a reservation from the repository by its ID.
  ///
  /// Requires a [reservationId] to identify the reservation.
  Future<ScheduleModel?> readReservation(String reservationId);

  /// Updates an existing reservation in the repository.
  ///
  /// Requires a [reservation] instance for updating the reservation.
  Future<void> updateReservation(ScheduleModel reservation);

  /// Retrieves all reservations from the repository.
  Future<List<ScheduleModel>> getAllReservations();

  /// Deletes a reservation from the repository.
  /// Requires a [reservationId] to identify the reservation.
  Future<void> deleteReservation(String reservationId);

  /// Checks if a reservation exists in the repository.
  ///
  /// Requires a [reservationId] to identify the reservation.
  Future<bool> reservationExists(String reservationId);
}
