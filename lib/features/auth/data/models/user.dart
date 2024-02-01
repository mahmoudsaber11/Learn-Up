import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;

  const User({required this.token});

  factory User.fromJson(dynamic json) {
    return User(token: json['token']);
  }

  @override
  List<Object?> get props => [token];
}
