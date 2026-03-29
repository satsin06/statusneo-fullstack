import 'package:dio/dio.dart';
import 'api_error_model.dart';
import 'exceptions.dart';

class ErrorMapper {
  static Exception mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.unknown) {
      return NetworkException();
    }

    if (e.response != null && e.response?.data != null) {
      final apiError = ApiErrorModel.fromJson(e.response!.data);
      return ServerException(apiError.message, apiError.code);
    }

    return ServerException('Something went wrong', 'UNKNOWN');
  }
}