import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_court_respository.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_court_local_datasource.dart';

@Singleton(as: ICourtRepository)
class CourtRepository implements ICourtRepository {
  final ICourtLocalDatasource courtLocalDataSource;

  CourtRepository(this.courtLocalDataSource);

  @override
  Future<void> createCourt(CourtModel court) async {
    await courtLocalDataSource.createCourt(court);
  }

  @override
  Future<CourtModel?> readCourt(String courtId) {
    return courtLocalDataSource.readCourt(courtId);
  }

  @override
  Future<void> updateCourt(CourtModel court) async {
    await courtLocalDataSource.updateCourt(court);
  }

  @override
  Future<List<CourtModel>> getAllCourts() async {
    return await courtLocalDataSource.getAllCourts();
  }
}
