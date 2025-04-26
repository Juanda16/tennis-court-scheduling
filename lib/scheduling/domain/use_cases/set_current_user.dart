import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_user_repository.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/base_usecase.dart';

abstract interface class ISetCurrentUserUseCase
    implements BaseUseCase<User, Future<User>> {}

@Injectable(as: ISetCurrentUserUseCase)
class SetCurrentUserUseCase implements ISetCurrentUserUseCase {
  final IUserRepository _userRepository;

  SetCurrentUserUseCase(this._userRepository);

  @override
  Future<User> call(User user) async {
    return await _userRepository.setCurrentUser(user);
  }
}
