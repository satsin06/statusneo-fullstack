class Validators {
  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? positiveNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    final number = double.tryParse(value);
    if (number == null || number <= 0) {
      return '$fieldName must be greater than 0';
    }

    return null;
  }
}