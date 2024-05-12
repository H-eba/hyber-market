import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/dao/datasource_contract/wish_list_ds/wish_list_ds.dart';


import 'package:ecommerce/domain/entites/wishListEntity/AddToWhishListEntity.dart';



import 'package:ecommerce/domain/repository_contract/wish_list_repo/wish_list_repo.dart';
import 'package:injectable/injectable.dart';

import '../../model/wish_list/GetWishListResponseModel.dart';

@Injectable(as: WishListRepo )
class WishListRepoImpl extends WishListRepo{
  @factoryMethod
  WishListDateSource apiDataSource;
  WishListRepoImpl(this.apiDataSource);
  @override
  Future<Either<AddToWishListEntity, String>> AddToWishList(String productId) async{
    var result = await apiDataSource.AddToWishList(productId);
    return result.fold((response) {
      AddToWishListEntity addToWishListEntity = response.toWishListEntity();
      return Left(addToWishListEntity);
    }
        , (error) {
          return Right(error.toString());
        });  }

 @override
  Future<Either<GetWishListResponseModel, String>> GetWishList() async{
    var result = await apiDataSource.GetWishList();
    return result.fold((response) {
      GetWishListResponseModel getWishListResponse= response;
      return Left(getWishListResponse);
    }
        , (error) {
          return Right(error.toString());
        });
  }

  @override
  Future<Either<GetWishListResponseModel , String>> DeleteFromWishList(String productId) async{
    var result = await apiDataSource.DeleteFromWishList(productId: productId);
    return result.fold((response) {
      GetWishListResponseModel  getWishListResponseModel= response;
      return Left(getWishListResponseModel);
    }
        , (error) {
          return Right(error.toString());
        });
  }



}