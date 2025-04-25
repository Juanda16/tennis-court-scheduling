import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';

abstract interface class ICourtRepository {
  /// Creates a new court in the repository.
  ///
  /// Requires a [court] instance for creating the court.
  Future<void> createCourt(CourtModel court);

  /// Watches a court from the repository by its ID.
  ///
  /// Requires a [courtId] to identify the court.
  Future<CourtModel?> readCourt(String courtId);

  /// Updates an existing court in the repository.
  ///
  /// Requires a [court] instance for updating the court.
  Future<void> updateCourt(CourtModel court);

  /// Retrieves all courts from the repository.
  Future<List<CourtModel>> getAllCourts();
}
