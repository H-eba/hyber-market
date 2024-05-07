import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/model/cart/CartResponseModel.dart';

abstract class CartDataSource{
  Future<Either<CartResponseModel,String>>AddToCart({required String productId});
  Future<Either<CartResponseModel,String>>GetCart();
  Future<Either<CartResponseModel,String>>DeleteFromCart({required String productId});
  Future<Either<CartResponseModel,String>>UpDateCart({required String productId,required int count});

}