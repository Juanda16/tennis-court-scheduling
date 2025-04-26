import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  User({
    required this.name,
    required this.email,
    required this.createdAt,
    required this.password,
    this.phoneNumber,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String? phoneNumber;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}

extension UserJson on User {
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
