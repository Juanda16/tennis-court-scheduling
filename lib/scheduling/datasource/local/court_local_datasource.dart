import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/datasource/db/db.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_court_local_datasource.dart';

@Singleton(as: ICourtLocalDatasource)
class CourtLocalDataSource implements ICourtLocalDatasource {
  final IBaseDatabase _database;

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
          await rootBundle.loadString('assets/json/mock_field.json');

      return (json.decode(response) as List)
          .map((data) => CourtModel.fromJson(data))
          .toList();

      // final data = await _database.readAll(table: _courtsTableName);
      // return data.map((court) => CourtModel.fromJson(court)).toList();
    } catch (e) {
      throw Exception('Failed to get all courts: $e');
    }
  }

  static const String _courtsTableName = 'courts';

  @override
  Future<void> updateCourt(CourtModel court) {
    try {
      return _database.create(
        table: _courtsTableName,
        mapWithId: MapWithId(id: court.id, map: court.toJson()),
      );
    } catch (e) {
      throw Exception('Failed to update court with id ${court.id}: $e');
    }
  }
}
