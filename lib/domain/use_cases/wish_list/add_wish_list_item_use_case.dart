import 'package:dartz/dartz.dart';

import 'package:ecommerce/domain/entites/wishListEntity/AddToWhishListEntity.dart';
import 'package:ecommerce/domain/repository_contract/wish_list_repo/wish_list_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class AddToWishListUseCase{
  WishListRepo wishListRepo;
  @factoryMethod
  AddToWishListUseCase(this.wishListRepo);
  Future<Either<AddToWishListEntity, String>>call({required String productId})=>wishListRepo.AddToWishList(productId);
}