import 'package:dio/dio.dart';
import 'package:learn_up/core/api/status_code.dart';
import 'package:learn_up/core/errors/failures.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Your request not found, please try again later!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(AppString.noInternet);
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected Error, please try again!");
      default:
        return ServerFailure(AppString.opps);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == StatusCodes.internalServerError) {
      return ServerFailure(AppString.opps);
    }
    return ServerFailure(response['msgError']);
  }
}
