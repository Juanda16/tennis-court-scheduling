import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_user_repository.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/base_usecase.dart';

abstract interface class IGetCurrentUserUseCase
    implements BaseUseCase<NoParam, Future<User>> {}

@Injectable(as: IGetCurrentUserUseCase)
class GetCurrentUserUseCase implements IGetCurrentUserUseCase {
  final IUserRepository _userRepository;

  GetCurrentUserUseCase(this._userRepository);

  @override
  Future<User> call(NoParam params) async {
    return await _userRepository.getCurrentUser();
  }
}
