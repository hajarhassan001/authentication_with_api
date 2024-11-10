import 'package:dio/dio.dart';
import 'package:mastering_api/core/api/apiconsumer.dart';
import 'package:mastering_api/core/api/apiinterceptor.dart';
import 'package:mastering_api/core/api/endpoint.dart';
import 'package:mastering_api/core/errors/exceptions.dart';

class Dioconsumer extends Apiconsumer {
  final Dio dio;

  Dioconsumer({required this.dio}){
    dio.options.baseUrl=EndPoints.baseUrl;
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true
    ));
    dio.interceptors.add(ApiInterceptor());

  }

  

  @override
  delete(String path,
      {dynamic data, Map<String, dynamic>? quaryParameters, bool isFormData= false}) async {
    try {
      final res =
          await dio.delete(path, data: isFormData? FormData.fromMap(data): data, queryParameters: quaryParameters);
      return res.data;
    } on DioException catch (e) {
      handelException(e);
    }
  }

  @override
  get(String path, {Object? data, Map<String, dynamic>? quaryParameters}) async{
    try {
      final res =
          await dio.get(path, data: data, queryParameters: quaryParameters);
      return res.data;
    } on DioException catch (e) {
      handelException(e);
    }
  }

  @override
  patch(String path, {dynamic data, Map<String, dynamic>? quaryParameters,  bool isFormData= false}) async{
     try {
      final res =
          await dio.patch(path, data:  isFormData? FormData.fromMap(data): data, queryParameters: quaryParameters);
      return res.data;
    } on DioException catch (e) {
      handelException(e);
    }
  }

  @override
  post(String path, {dynamic data, Map<String, dynamic>? quaryParameters, bool isFormData= false}) async{
    try {
      final res =
          await dio.post(path, data:  isFormData? FormData.fromMap(data): data, queryParameters: quaryParameters);
      return res.data;
    } on DioException catch (e) {
      handelException(e);
    }
  }
}
