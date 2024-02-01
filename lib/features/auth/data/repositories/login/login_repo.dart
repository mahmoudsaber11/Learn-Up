import 'package:dartz/dartz.dart';
import 'package:learn_up/core/errors/failures.dart';
import 'package:learn_up/features/auth/data/entities/login_params.dart';
import 'package:learn_up/features/auth/data/models/user.dart';

abstract class LoginRepo {
  Future<Either<Failure, User>> userLogin({
    required LoginParams loginParams,
  });
}
