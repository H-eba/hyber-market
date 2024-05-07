import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api_manager/api_manager.dart';
import 'package:ecommerce/core/api/end_point/endpoint.dart';
import 'package:ecommerce/core/local/prefsHelper.dart';
import 'package:ecommerce/data/dao/datasource_contract/cart_ds/cart_ds.dart';
import 'package:ecommerce/data/model/cart/CartResponseModel.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource{
  ApiManager apiManager;
  @factoryMethod
  CartDataSourceImpl({required this.apiManager});
  @override
  Future<Either<CartResponseModel, String>> AddToCart({required String productId}) async{
  try{
    var response=await apiManager.postRequest(endPoint: EndPoint.cardEndPoint,
    body: { "productId":productId,

    },
    headers: {"token":PrefsHelper.getToken()});
    CartResponseModel cartResponseModel=CartResponseModel.fromJson(response.data);
    if(cartResponseModel.statusMsg!=null){
      return Right(cartResponseModel.message??'');
    }

    else{
      return Left(cartResponseModel);
    }
  }catch(error){
return Right(error.toString());
  }
  }

  @override
  Future<Either<CartResponseModel, String>> GetCart() async{
    try{
      var response=await apiManager.getRequest(endPoint: EndPoint.cardEndPoint,
      headers: { 'token':PrefsHelper.getToken()});


      CartResponseModel cartResponseModel=CartResponseModel.fromJson(response.data);
      if(cartResponseModel.statusMsg!=null){
        return Right(cartResponseModel.message??'');
      }

      else{
        return Left(cartResponseModel);
      }
    }catch(error){
      return Right(error.toString());
    }
  }

  @override
  Future<Either<CartResponseModel, String>> DeleteFromCart({required String productId}) async{
    try{
      var response=await apiManager.deleteRequest(endPoint: '${EndPoint.cardEndPoint}/$productId',
          headers: { 'token':PrefsHelper.getToken()});


      CartResponseModel cartResponseModel=CartResponseModel.fromJson(response.data);
      if(cartResponseModel.statusMsg!=null){
        return Right(cartResponseModel.message??'');
      }

      else{
        return Left(cartResponseModel);
      }
    }catch(error){
      return Right(error.toString());
    }
  }

  @override
  Future<Either<CartResponseModel, String>> UpDateCart({required String productId,required int count})async {
    try{
      var response=await apiManager.upDateRequest(endPoint: '${EndPoint.cardEndPoint}/$productId',
          body: {
            "count":count,

          },
          headers: {"token":PrefsHelper.getToken()});
      CartResponseModel cartResponseModel=CartResponseModel.fromJson(response.data);
      if(cartResponseModel.statusMsg!=null){
        return Right(cartResponseModel.message??'');
      }

      else{
        return Left(cartResponseModel);
      }
    }catch(error){
      return Right(error.toString());
    }
  }


  
}