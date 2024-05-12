import 'package:dartz/dartz.dart';


import 'package:ecommerce/domain/entites/wishListEntity/AddToWhishListEntity.dart';


import '../../../data/model/wish_list/GetWishListResponseModel.dart';





abstract class WishListRepo{
  Future<Either<AddToWishListEntity,String>>AddToWishList(String productId);
 Future<Either<GetWishListResponseModel,String>>GetWishList();
  Future<Either<GetWishListResponseModel ,String>>DeleteFromWishList(String productId);
}