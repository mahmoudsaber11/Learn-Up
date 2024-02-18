import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? message;
  final String? userName;
  final String? email;
  final String? imageUrl;
  final String? token;

  const User(
      {required this.message,
      required this.userName,
      required this.email,
      required this.imageUrl,
      required this.token});
  factory User.fromJson(json) {
    return User(
        message: json['message'] as String?,
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        imageUrl: json['imageUrl'] as String?,
        token: json['token'] as String?);
  }

  @override
  List<Object?> get props => [message, userName, email, imageUrl, token];
}
