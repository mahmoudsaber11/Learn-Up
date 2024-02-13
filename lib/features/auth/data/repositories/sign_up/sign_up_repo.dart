import 'package:dartz/dartz.dart';
import 'package:learn_up/core/errors/failures.dart';
import 'package:learn_up/features/auth/data/entities/sign_up_params.dart';
import 'package:learn_up/features/auth/data/models/user.dart';

abstract class SignUpRepo {
  Future<Either<Failure, User>> userSignUp({
    required SignUpParams signUpParams,
  });
}
