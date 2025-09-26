import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Sent timout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure("Cancel  with ApiServer");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection Error with ApiServer");
      case DioExceptionType.unknown:
        return ServerFailure("UnKnow");
      }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure("Internet Server error,Please try later!");
    } else {
      return ServerFailure("Oops ther was an Error,Please try again");
    }
  }
}