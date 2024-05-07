import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repository_contract/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../entites/cart/CartResponseEntity.dart';
@injectable
class GetCartUseCase{
  CartRepo cartRepo;
  @factoryMethod
  GetCartUseCase(this.cartRepo);
  Future<Either<CartResponseEntity, String>>call()=>cartRepo.GetCart();
}