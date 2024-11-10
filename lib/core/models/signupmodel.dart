import 'package:mastering_api/core/api/endpoint.dart';

class Signupmodel {


  final String message;

  Signupmodel({required this.message});

  factory Signupmodel.fromJson(Map<String,dynamic>json){
    return Signupmodel(message: json[ApiKey.message],);
  }

}