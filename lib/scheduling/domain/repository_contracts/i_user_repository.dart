import 'package:tennis_court_scheduling/scheduling/domain/entities/user_model.dart';

abstract interface class IUserRepository {
  /// Creates a new user in the repository.
  ///
  /// Requires a [user] instance for creating the user.
  Future<User> createUser(User user);

  /// Watches a user from the repository by its ID.
  ///
  /// Requires a [userId] to identify the user.
  Future<User?> readUser(String userId);

  /// Updates an existing user in the repository.
  ///
  /// Requires a [user] instance for updating the user.
  Future<User> updateUser(User user);

  Future<User> getCurrentUser();

  Future<User> setCurrentUser(User user);

  /// Retrieves the current user from the repository by email.
  Future<User?> getCurrentUserByEmail(String email);
}
