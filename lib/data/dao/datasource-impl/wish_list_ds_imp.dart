import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/dao/datasource_contract/wish_list_ds/wish_list_ds.dart';
import 'package:ecommerce/data/model/wish_list/WishListResponseModel.dart';


import 'package:injectable/injectable.dart';

import '../../../core/api/api_manager/api_manager.dart';
import '../../../core/api/end_point/endpoint.dart';
import '../../../core/local/prefsHelper.dart';

import '../../model/wish_list/GetWishListResponseModel.dart';

@Injectable(as: WishListDateSource)
class WishListDateSourceImpl extends WishListDateSource{
  @factoryMethod
  ApiManager apiManager;
  WishListDateSourceImpl(this.apiManager);
  @override
  Future<Either<WishListResponseModel, String>> AddToWishList(String productId) async{
    try{
      var response=await apiManager.postRequest(endPoint: EndPoint.wishListEndPoint,
          body: { "productId":productId,

          },
          headers: {"token":PrefsHelper.getToken()});
      WishListResponseModel addToWishListResponseModel =WishListResponseModel.fromJson(response.data);

      if(addToWishListResponseModel .status==null){
        return Right(addToWishListResponseModel.status??'');
      }

      else{
        return Left(addToWishListResponseModel);
      }
    }catch(error){
      return Right(error.toString());
    }
  }

  @override
 Future<Either<GetWishListResponseModel , String>> GetWishList() async{
    try{
      var response=await apiManager.getRequest(endPoint: EndPoint.wishListEndPoint,

          headers: {"token":PrefsHelper.getToken()});
      GetWishListResponseModel getWishListResponse =GetWishListResponseModel.fromJson(response.data);

      if(getWishListResponse.status==null){
        return Right(getWishListResponse.status??'');
      }

      else{
        return Left(getWishListResponse);
      }
    }catch(error){
      return Right(error.toString());
    }
  }

  @override
  Future<Either<GetWishListResponseModel , String>> DeleteFromWishList({required String productId}) async{
    try{
      var response=await apiManager.deleteRequest(endPoint: '${EndPoint.wishListEndPoint}/$productId',
          headers: { 'token':PrefsHelper.getToken()});


      GetWishListResponseModel  wishListResponseModel=GetWishListResponseModel .fromJson(response.data);
      if(wishListResponseModel.status==null){
        return Right(wishListResponseModel.status??'');
      }

      else{
        return Left(wishListResponseModel);
      }
    }catch(error){
      return Right(error.toString());
    }
  }

}