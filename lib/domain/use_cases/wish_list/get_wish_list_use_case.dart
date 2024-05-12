import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';



import '../../../data/model/wish_list/GetWishListResponseModel.dart';
import '../../repository_contract/wish_list_repo/wish_list_repo.dart';

@injectable
class GetWishListUseCase{
  WishListRepo wishListRepo;
  @factoryMethod
  GetWishListUseCase(this.wishListRepo);
  Future<Either<GetWishListResponseModel, String>>call()=>wishListRepo.GetWishList();
}

