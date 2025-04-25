import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/no_param.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_court_respository.dart';

import 'base_usecase.dart';

abstract interface class IGetAllCourtsUseCase
    implements BaseUseCase<NoParam, Future<List<CourtModel>>> {}

/// Implementation of the [IGetAllCourtsUseCase] use case.
@Singleton(as: IGetAllCourtsUseCase)
class GetAllCourtsUseCase implements IGetAllCourtsUseCase {
  final ICourtRepository courtRepository;

  /// Constructor for [GetAllCourtsUseCase].
  ///
  /// Requires a [reservationRepository] instance to interact with the reservation repository.
  GetAllCourtsUseCase(this.courtRepository);

  @override
  Future<List<CourtModel>> call(NoParam i) async {
    return await courtRepository.getAllCourts();
  }
}
