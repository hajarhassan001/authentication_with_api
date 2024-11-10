import 'package:dio/dio.dart';
import 'package:mastering_api/core/api/endpoint.dart';
import 'package:mastering_api/core/database/cachehelper.dart';

class ApiInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accpet-Language']='en';
        options.headers[ApiKey.token]= 
        CacheHelper.getData(key: ApiKey.token)!= null?
        "FOODAPI ${CacheHelper.getData(key: ApiKey.token)}":null;

    
    super.onRequest(options, handler);
  }


}