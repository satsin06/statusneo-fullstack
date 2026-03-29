class ServerException implements Exception {
  final String message;
  final String code;

  ServerException(this.message, this.code);
}

class NetworkException implements Exception {}