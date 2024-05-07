import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/cart/CartEntity.dart';
import 'package:ecommerce/domain/entites/cart/CartResponseEntity.dart';

abstract class CartRepo{
  Future<Either<CartResponseEntity,String>>AddToCart({required String productId});
  Future<Either<CartResponseEntity,String>>GetCart();
  Future<Either<CartResponseEntity,String>>DeleteFromCart({required String productId});
  Future<Either<CartResponseEntity,String>>UpDateCart({required String productId,required int count});


}