import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/user_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_user_repository.dart';

import 'base_usecase.dart';

abstract interface class IAuthenticateUserUseCase
    implements BaseUseCase<AuthenticateUserParams, Future<User?>> {}

@Injectable(as: IAuthenticateUserUseCase)
class AuthenticateUserUseCase implements IAuthenticateUserUseCase {
  final IUserRepository _userRepository;

  /// Constructor for [AuthenticateUserUseCase].
  ///
  /// Requires a [userRepository] instance to interact with the user repository.
  AuthenticateUserUseCase(this._userRepository);

  @override
  Future<User?> call(AuthenticateUserParams authenticatingUser) async {
    final User? foundUser =
        await _userRepository.getCurrentUserByEmail(authenticatingUser.email);
    if (foundUser == null) {
      return null;
    }
    if (foundUser.password == authenticatingUser.password) {
      return foundUser;
    } else {
      return null;
    }
  }
}

class AuthenticateUserParams {
  final String email;
  final String password;

  AuthenticateUserParams({
    required this.email,
    required this.password,
  });
}
