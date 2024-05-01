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
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(endPoint, queryParameters: queryParameters);
    return response;
  }

  Future<Response> postRequest(
      {required String endPoint, Map<String, dynamic>? body}) async {
    var response = await dio.post(endPoint,data:body );
    return response;
  }
}
