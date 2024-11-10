class ErrorModel {
  final int statusCode;
  final String messege;

  ErrorModel({required this.statusCode, required this.messege});

  factory ErrorModel.fromJson(json) {
    return ErrorModel(
        statusCode: json['status'], messege: json['ErrorMessage']);
  }
}
