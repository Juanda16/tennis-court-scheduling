import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/user_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_user_repository.dart';

import 'base_usecase.dart';

abstract interface class ICreateUser
    implements BaseUseCase<User, Future<User>> {}

/// Implementation of the [ICreateUser] use case.
@Singleton(as: ICreateUser)
class CreateUser implements ICreateUser {
  final IUserRepository userRepository;

  /// Constructor for [CreateUser] use case.
  ///
  /// Requires a [userRepository] instance to interact with the user repository.
  CreateUser(this.userRepository);

  @override
  Future<User> call(User user) async {
    return await userRepository.createUser(user);
  }
}
