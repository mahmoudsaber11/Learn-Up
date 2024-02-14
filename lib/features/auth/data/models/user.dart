import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String message;
  final String userName;
  final String email;
  final String imageUrl;
  final String token;

  const User(
      {required this.message,
      required this.userName,
      required this.email,
      required this.imageUrl,
      required this.token});
  factory User.fromJson(dynamic json) {
    return User(
        message: json['message'],
        userName: json['userName'],
        email: json['email'],
        imageUrl: json['imageUrl'],
        token: json['token']);
  }

  @override
  List<Object?> get props => [message, userName, email, imageUrl, token];
}
