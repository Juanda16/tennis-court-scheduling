import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/user_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/repository_contracts/i_user_repository.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_user_local_data_source.dart';

@Singleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IUserLocalDataSource _userLocalDataSource;

  UserRepository({
    required IUserLocalDataSource userLocalDataSource,
  }) : _userLocalDataSource = userLocalDataSource;

  @override
  Future<User> createUser(User user) async {
    return await _userLocalDataSource.createUser(user);
  }

  @override
  Future<User?> readUser(String userId) {
    return _userLocalDataSource.readUser(userId);
  }

  @override
  Future<User> updateUser(User user) async {
    return await _userLocalDataSource.updateUser(user);
  }
}
