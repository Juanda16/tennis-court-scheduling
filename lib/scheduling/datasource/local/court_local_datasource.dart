import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/datasource/db/db.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_court_local_datasource.dart';

/// {@template court_local_data_source}
/// A concrete implementation of [ICourtLocalDatasource] that provides access to
/// court data stored locally.
///
/// This class uses a local database to persist court data. It also loads mock
/// data from a JSON file during the `getAllCourts` operation.
/// {@endtemplate}
@Singleton(as: ICourtLocalDatasource)
class CourtLocalDataSource implements ICourtLocalDatasource {
  /// The database used for persisting court data.
  final IBaseDatabase _database;

  static const String _courtsTableName = 'courts';

  /// {@macro court_local_data_source}
  CourtLocalDataSource({required IBaseDatabase database})
      : _database = database;

  @override
  Future<CourtModel> createCourt(CourtModel court) async {
    try {
      await _database.create(
        table: _courtsTableName,
        mapWithId: MapWithId(id: court.id, map: court.toJson()),
      );
      return court;
    } catch (e) {
      throw Exception('Failed to create court: $e');
    }
  }

  @override
  Future<CourtModel?> readCourt(String courtId) async {
    try {
      final Map<String, dynamic>? data =
          await _database.read(table: _courtsTableName, id: courtId);
      if (data == null) {
        return null;
      }
      return CourtModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to read court with id $courtId: $e');
    }
  }

  @override
  Future<List<CourtModel>> getAllCourts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/mock_courts.json');

      return (json.decode(response) as List)
          .map((data) => CourtModel.fromJson(data))
          .toList();
    } catch (e) {
      throw DataSourceOperationException('Failed to get all courts: $e');
    }
  }

  @override
  Future<void> updateCourt(CourtModel court) async {
    try {
      await _database.create(
        table: _courtsTableName,
        mapWithId: MapWithId(id: court.id, map: court.toJson()),
      );
    } catch (e) {
      throw Exception('Failed to update court with id ${court.id}: $e');
    }
  }
}

class DataSourceOperationException implements Exception {
  final String message;

  DataSourceOperationException(this.message);

  @override
  String toString() {
    return 'DataSourceOperationException: $message';
  }
}
