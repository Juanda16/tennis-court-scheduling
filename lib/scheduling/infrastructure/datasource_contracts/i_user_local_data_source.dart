import 'package:tennis_court_scheduling/scheduling/domain/entities/user_model.dart';

abstract interface class IUserLocalDataSource {
  /// Creates a new user in the local data source.
  ///
  /// Requires a [user] instance for creating the user.
  Future<User> createUser(User user);

  /// Watches a user from the local data source by its ID.
  ///
  /// Requires a [userId] to identify the user.
  Future<User?> readUser(String userId);

  /// Updates an existing user in the local data source.
  ///
  /// Requires a [user] instance for updating the user.
  Future<User> updateUser(User user);

  /// Retrieves the current user from the local data source.
  Future<User> getCurrentUser();

  /// Set the current user in the local data source.
  Future<User> setCurrentUser(User user);

  /// Retrieves the current user from the local data source by email.
  Future<User?> getCurrentUserByEmail(String email);
}
