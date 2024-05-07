import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/cart/CartResponseEntity.dart';
import 'package:ecommerce/domain/repository_contract/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddToCartUseCase{
  CartRepo cartRepo;
  @factoryMethod
  AddToCartUseCase(this.cartRepo);
  Future<Either<CartResponseEntity,String>>call({required String productId})=>cartRepo.AddToCart(productId: productId);
}