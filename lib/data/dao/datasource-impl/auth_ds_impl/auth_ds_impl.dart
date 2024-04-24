import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api_manager/api_manager.dart';
import 'package:ecommerce/core/api/end_point/endpoint.dart';
import 'package:ecommerce/data/dao/datasource_contract/auth_ds/auth_ds.dart';
import 'package:ecommerce/data/model/auth/AuthResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AuthDataSource )
class AuthDataSourceImpl extends AuthDataSource{
  ApiManager apiManager;
  @factoryMethod
  AuthDataSourceImpl(this.apiManager);
  @override
  Future<Either<AuthResponse, String>> signUp({required String fullName, required String email, required String password, required String rePassword, required String phone}) async{
    try{
var response=await apiManager.postRequest(endPoint: EndPoint.signUpEndPoint,body: {
  "name": fullName,
  "email":email,
  "password":password,
  "phone":phone,
  "rePassword":password,

});
AuthResponse authResponse=AuthResponse.fromJson(response.data);
if (authResponse.statusMsg!=null){
  return Right(authResponse.message??'');
}else{
 return Left(authResponse);
}
    }catch(error){
     return Right(error.toString());
    }
  }
  
}