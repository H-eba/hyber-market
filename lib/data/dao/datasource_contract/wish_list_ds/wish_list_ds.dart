import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/model/wish_list/WishListResponseModel.dart';


import '../../../model/wish_list/GetWishListResponseModel.dart';





abstract class WishListDateSource{
  Future<Either<WishListResponseModel,String>>AddToWishList(String productId);
  Future<Either<GetWishListResponseModel ,String>>GetWishList();
  Future<Either<GetWishListResponseModel ,String>>DeleteFromWishList({required String productId});
  //Future<Either<WishListResponseModel,String>>DeleteFromWishList({required String productId});
}