import 'package:flutter/material.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/no_param.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/user_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/authenticate_user.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/create_user.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_current_user_use_case.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/set_current_user.dart';

class UserProvider extends ChangeNotifier {
  UserProvider(
    this._getUserUseCase,
    this._setCurrentUserUseCase,
    this._createUser,
    this._authenticateUserUseCase,
  );

  final IGetCurrentUserUseCase _getUserUseCase;
  final ISetCurrentUserUseCase _setCurrentUserUseCase;
  final ICreateUser _createUser;
  final IAuthenticateUserUseCase _authenticateUserUseCase;

  String? _userName;
  String? get userName => _userName;
  set userName(String? value) {
    _userName = value;
    notifyListeners();
  }

  void setUserName(User user) {
    userName = user.name;
    _setCurrentUserUseCase.call(user);
  }

  void getUser() async {
    User user = await _getUserUseCase.call(NoParam.i);
    userName = user.name;
  }

  void clearUser() {
    userName = null;
    // _setCurrentUserUseCase.call(User(name: ''));
  }

  void createUser(User user) {
    _createUser.call(user).then((user) {
      setUserName(user);
    }).catchError((error) {
      // Handle error
      print('Error creating user: $error');
    });
  }

  Future<bool> authenticateUser(String email, String password) async {
    bool isAuthenticated = false;
    await _authenticateUserUseCase
        .call(AuthenticateUserParams(email: email, password: password))
        .then((user) {
      if (user != null) {
        setUserName(user);
        isAuthenticated = true;
      } else {
        isAuthenticated = false;
      }
    }).catchError((error) {
      // Handle error
      print('Error authenticating user: $error');
    });
    return isAuthenticated;
  }
}
