import 'package:mastering_api/core/api/endpoint.dart';

class SignInModel {


  final String message;
  final String token;

  SignInModel({required this.message, required this.token});
  factory SignInModel.fromJson(Map<String, dynamic> json){
    return SignInModel(message: json[ApiKey.message]??''
    
    , token:  json[ApiKey.token]??''
    );
  }
  
}