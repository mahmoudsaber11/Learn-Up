import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learn_up/core/api/dio_consumer.dart';
import 'package:learn_up/core/api/end_point.dart';
import 'package:learn_up/core/errors/failures.dart';
import 'package:learn_up/core/errors/server_failure.dart';
import 'package:learn_up/features/auth/data/models/user.dart';
import 'package:learn_up/features/auth/data/repositories/forgot_password/forgot_password_repo.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final DioConsumer dioConsumer;

  const ForgetPasswordRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, User>> forgetPassword({required String email}) async {
    try {
      final Response response = await dioConsumer
          .post(EndPoints.forgetPassword, data: {"email": email});
      final User user = User.fromJson(response.data);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
