import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';



import '../../../data/model/wish_list/GetWishListResponseModel.dart';
import '../../entites/wishListEntity/AddToWhishListEntity.dart';
import '../../repository_contract/wish_list_repo/wish_list_repo.dart';

@injectable
class DeleteFromWishListUseCase{
  WishListRepo wishListRepo;
  @factoryMethod
  DeleteFromWishListUseCase(this.wishListRepo);
  Future<Either<GetWishListResponseModel , String>>call({required String productId})=>wishListRepo.DeleteFromWishList(productId);
}