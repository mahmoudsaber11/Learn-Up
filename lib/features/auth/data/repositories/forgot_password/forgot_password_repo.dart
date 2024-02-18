import 'package:dartz/dartz.dart';
import 'package:learn_up/core/errors/failures.dart';
import 'package:learn_up/features/auth/data/models/user.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, User>> forgetPassword({required String email});
}
