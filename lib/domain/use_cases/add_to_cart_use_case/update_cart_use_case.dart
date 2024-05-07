import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entites/cart/CartResponseEntity.dart';
import '../../repository_contract/cart_repo/cart_repo.dart';
@injectable
class UpDateCartUseCase{
  CartRepo cartRepo;
  @factoryMethod
  UpDateCartUseCase(this.cartRepo);
  Future<Either<CartResponseEntity,String>>call({required String productId,required int count})=>cartRepo.UpDateCart(productId: productId, count: count);
}
