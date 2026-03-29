class ApiErrorModel {
  final String message;
  final String code;

  ApiErrorModel({
    required this.message,
    required this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['error'] ?? 'Unknown error',
      code: json['code'] ?? 'UNKNOWN',
    );
  }
}