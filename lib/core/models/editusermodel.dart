
import 'package:mastering_api/core/api/endpoint.dart';

class UserEditModel {
  final String message;
 final String token;
   UserEditModel({required this.message, required this.token});

 
  factory UserEditModel.fromJson(Map<String, dynamic> json) {
    return UserEditModel(
      message: json[ApiKey.message],
      token:  json[ApiKey.token]??''
    );
  }
}

