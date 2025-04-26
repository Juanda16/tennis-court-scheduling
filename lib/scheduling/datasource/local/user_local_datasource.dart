import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:tennis_court_scheduling/scheduling/datasource/db/db.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/user_model.dart';
import 'package:tennis_court_scheduling/scheduling/infrastructure/datasource_contracts/i_user_local_data_source.dart';

/// Concrete implementation of [IUserLocalDataSource] that interacts with
/// a reactive database to manage user data.
@Singleton(as: IUserLocalDataSource)
class UserLocalDataSource implements IUserLocalDataSource {
  final IBaseDatabase _database;

  /// Creates a [UserLocalDataSource] instance.
  ///
  /// Requires a [database] instance for database operations.
  UserLocalDataSource({required IBaseDatabase database}) : _database = database;

  @override
  Future<User> createUser(User user) async {
    try {
      await _database.create(
        table: _usersTableName,
        mapWithId: MapWithId(id: user.email, map: user.toJson()),
      );
      return user;
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  @override
  Future<User?> readUser(String userId) async {
    try {
      final user = await _database.read(
        table: _usersTableName,
        id: userId,
      );
      if (user == null) {
        return null;
      }
      return User.fromJson(user);
    } catch (e) {
      throw Exception('Failed to watch user with id $userId: $e');
    }
  }

  @override
  Future<User> updateUser(User user) async {
    try {
      await _database.create(
        table: _usersTableName,
        mapWithId: MapWithId(id: user.email, map: user.toJson()),
      );
      return user;
    } catch (e) {
      throw Exception('Failed to update user with id ${user.email}: $e');
    }
  }

  /// The name of the table used to store users.
  static const String _usersTableName = 'users';

  @override
  Future<User> getCurrentUser() async {
    try {
      final user = await _database.read(
        table: _usersTableName,
        id: 'current_user',
      );
      if (user == null) {
        throw Exception('No current user found');
      }
      return User.fromJson(user);
    } catch (e) {
      throw Exception('Failed to get current user: $e');
    }
  }

  @override
  Future<User> setCurrentUser(User user) async {
    try {
      await _database.create(
        table: _usersTableName,
        mapWithId: MapWithId(id: 'current_user', map: user.toJson()),
      );
      return user;
    } catch (e) {
      throw Exception('Failed to set current user: $e');
    }
  }

  @override
  Future<User?> getCurrentUserByEmail(String email) async {
    try {
      final user = await _database.read(
        table: _usersTableName,
        id: email,
      );
      if (user == null) {
        return null;
      }
      return User.fromJson(user);
    } catch (e) {
      throw Exception('Failed to get current user by email: $e');
    }
  }
}
