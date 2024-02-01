import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learn_up/core/api/dio_consumer.dart';
import 'package:learn_up/core/api/end_point.dart';
import 'package:learn_up/core/errors/failures.dart';
import 'package:learn_up/core/errors/server_failure.dart';
import 'package:learn_up/features/auth/data/entities/login_params.dart';
import 'package:learn_up/features/auth/data/models/user.dart';
import 'package:learn_up/features/auth/data/repositories/login/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final DioConsumer dioConsumer;

  LoginRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, User>> userLogin(
      {required LoginParams loginParams}) async {
    try {
      final response = await dioConsumer.post(EndPoints.login,
          data: {"email": loginParams.email, "password": loginParams.password});
      final User user = User.fromJson(response);

      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
