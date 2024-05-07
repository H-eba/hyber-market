import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManager {
  static late Dio dio;
  static void init() {
    dio = Dio(
        BaseOptions(
      baseUrl: Constants.baseUrl,
          validateStatus: (status) {
            if(status!<500){
              return true;
            }else{
              return false;
            }
          },
    ));
  }

  Future<Response> getRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}) async {
    var response = await dio.get(endPoint, queryParameters: queryParameters,
      options: Options(
          headers:headers
      )
    );
    return response;
  }

  Future<Response> postRequest(
      {required String endPoint, Map<String, dynamic>? body,Map<String, dynamic>? headers}) async {
    var response = await dio.post(endPoint,data:body,options: Options(
      headers:headers
    ) );
    return response;
  }

  Future<Response> deleteRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers,}) async {
    var response = await dio.delete(endPoint, queryParameters: queryParameters,
        options: Options(
            headers:headers
        )
    );
    return response;
  }


  Future<Response> upDateRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters,Map<String, dynamic>? body,Map<String, dynamic>? headers,}) async {
    var response = await dio.put(endPoint, queryParameters: queryParameters,data: body,
        options: Options(
            headers:headers
        )
    );
    return response;
  }




}
