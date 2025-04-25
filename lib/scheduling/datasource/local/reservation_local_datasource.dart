import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/datasource/db/db.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_reservation_local_datasource.dart';

@Singleton(as: IReservationLocalDataSource)
class ReservationLocalDataSource implements IReservationLocalDataSource {
  final IBaseDatabase _database;

  ReservationLocalDataSource({required IBaseDatabase database})
      : _database = database;

  @override
  Future<bool> createReservation(ScheduleModel reservation) async {
    try {
      await _database.create(
        table: _reservationsTableName,
        mapWithId: MapWithId(id: reservation.id, map: reservation.toJson()),
      );
      return true;
    } catch (e) {
      throw Exception('Failed to create reservation: $e');
    }
  }

  @override
  Future<ScheduleModel?> readReservation(String reservationId) async {
    try {
      final data = await _database.read(
          table: _reservationsTableName, id: reservationId);
      return data != null ? ScheduleModel.fromJson(data) : null;
    } catch (e) {
      throw Exception('Failed to watch reservation with id $reservationId: $e');
    }
  }

  @override
  Future<void> updateReservation(ScheduleModel reservation) async {
    try {
      await _database.create(
        table: _reservationsTableName,
        mapWithId: MapWithId(id: reservation.id, map: reservation.toJson()),
      );
    } catch (e) {
      throw Exception('Failed to update reservation: $e');
    }
  }

  @override
  Future<List<ScheduleModel>> getAllReservations() async {
    try {
      return _database
          .readAll(
            table: _reservationsTableName,
          )
          .then(
              (value) => value.map((e) => ScheduleModel.fromJson(e)).toList());
    } catch (e) {
      throw Exception('Failed to get all reservations: $e');
    }
  }

  static const String _reservationsTableName = 'reservations';

  @override
  Future<void> deleteReservation(String reservationId) {
    try {
      return _database.delete(
        table: _reservationsTableName,
        id: reservationId,
      );
    } catch (e) {
      throw Exception(
          'Failed to delete reservation with id $reservationId: $e');
    }
  }

  @override
  Future<bool> reservationExists(String reservationId) {
    try {
      return _database
          .read(
            table: _reservationsTableName,
            id: reservationId,
          )
          .then((value) => value != null);
    } catch (e) {
      throw Exception('Failed to check if reservation exists: $e');
    }
  }
}
