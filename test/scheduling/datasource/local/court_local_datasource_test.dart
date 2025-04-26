import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tennis_court_scheduling/scheduling/datasource/db/db.dart';
import 'package:tennis_court_scheduling/scheduling/datasource/local/court_local_datasource.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_court_local_datasource.dart';

import 'court_local_datasource_test.mocks.dart';

@GenerateMocks([IBaseDatabase])
void main() {
  final IBaseDatabase mockDatabase = MockIBaseDatabase();
  final ICourtLocalDatasource courtLocalDataSource =
      CourtLocalDataSource(database: mockDatabase);
  const String courtsTableName = 'courts';

  group('CourtLocalDataSource', () {
    _testCreateCourt(mockDatabase, courtLocalDataSource, courtsTableName);
  });
}

void _testCreateCourt(IBaseDatabase mockDatabase,
    ICourtLocalDatasource courtLocalDataSource, String courtsTableName) {
  group('createCourt', () {
    test('should create a court successfully', () async {
      await _testCreateCourtHappyPath(
          mockDatabase, courtLocalDataSource, courtsTableName);
    });
    // test('should throw an exception if create fails', () async {
    //   await _testCreateCourtThrowsException(
    //       mockDatabase, courtLocalDataSource, courtsTableName);
    // });
  });
}

Future<void> _testCreateCourtHappyPath(IBaseDatabase mockDatabase,
    ICourtLocalDatasource courtLocalDataSource, String courtsTableName) async {
  // Arrange
  final court = CourtModel(id: '1', name: 'Court 1');
  when(mockDatabase.create(
    table: courtsTableName,
    mapWithId: MapWithId(id: court.id, map: court.toJson()),
  )).thenAnswer((_) async {});

  // Act
  await courtLocalDataSource.createCourt(court);

  // Assert
  verify(mockDatabase.create(
    table: courtsTableName,
    mapWithId: MapWithId(id: court.id, map: court.toJson()),
  )).called(1);
}
