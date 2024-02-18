import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:learn_up/core/api/dio_consumer.dart';
import 'package:learn_up/core/api/end_point.dart';
import 'package:learn_up/core/errors/failures.dart';
import 'package:learn_up/core/errors/server_failure.dart';
import 'package:learn_up/features/auth/data/entities/sign_up_params.dart';
import 'package:learn_up/features/auth/data/models/user.dart';
import 'package:learn_up/features/auth/data/repositories/sign_up/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final DioConsumer dioConsumer;

  SignUpRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, User>> userSignUp(
      {required SignUpParams signUpParams}) async {
    try {
      final formData = FormData();

      // final profilePhotoName = signUpParams.profileImage!.split("/").last;

      // final formData = FormData.fromMap({
      //   "Email": signUpParams.email,
      //   "userName": signUpParams.username,
      //   "Password": signUpParams.password,
      //   "ConfirmPassword": signUpParams.confirmPassword,
      //   "Image": await MultipartFile.fromFile(
      //     signUpParams.profileImage!,
      //     filename: profilePhotoName,
      //     contentType: MediaType("image", profilePhotoName.split(".").last),
      //   ),
      // });

      formData.fields
        ..add(MapEntry('Email', signUpParams.email!))
        ..add(MapEntry('userName', signUpParams.username!))
        ..add(MapEntry('Password', signUpParams.password!))
        ..add(MapEntry('ConfirmPassword', signUpParams.confirmPassword!));

      if (signUpParams.profileImage != null) {
        final profilePhotoName = signUpParams.profileImage!.split("/").last;
        formData.files.add(MapEntry(
          "Image",
          await MultipartFile.fromFile(
            signUpParams.profileImage!,
            filename: profilePhotoName,
            contentType: MediaType("image", profilePhotoName.split(".").last),
          ),
        ));
      }
      // log(Map.fromEntries(formData.fields).toString());

      final response = await dioConsumer.post(EndPoints.signUp, data: formData);
      log(response.toString());
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
