import 'package:equatable/equatable.dart';

class SignUpParams extends Equatable {
  final String? email;
  final String? username;
  final String? profileImage;
  final String? password;
  final String? confirmPassword;

  const SignUpParams({
    this.profileImage,
    required this.confirmPassword,
    required this.username,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      'Email ': email,
      'userName': username,
      'Image': profileImage,
      'Password': password,
      'ConfirmPassword': confirmPassword,
    };
  }

  @override
  List<Object?> get props =>
      [email, username, password, confirmPassword, profileImage];
}
