import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/dao/datasource_contract/cart_ds/cart_ds.dart';
import 'package:ecommerce/domain/entites/cart/CartResponseEntity.dart';
import 'package:ecommerce/domain/repository_contract/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CartRepo )
class CartRepoImpl extends CartRepo{
  CartDataSource apiDataSource;
  @factoryMethod
  CartRepoImpl(this.apiDataSource);
  @override
  Future<Either<CartResponseEntity, String>> AddToCart({required String productId})async {
    var result = await apiDataSource.AddToCart(productId: productId);
    return result.fold((response) {
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();
      return Left(cartResponseEntity);
    }
        , (error) {
          return Right(error.toString());
        });
  }

  @override
  Future<Either<CartResponseEntity, String>> GetCart() async{
    var result = await apiDataSource.GetCart();
    return result.fold((response) {
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();
      return Left(cartResponseEntity);
    }
        , (error) {
          return Right(error.toString());
        });
  }

  @override
  Future<Either<CartResponseEntity, String>> DeleteFromCart({required String productId}) async{
    var result = await apiDataSource.DeleteFromCart(productId: productId);
    return result.fold((response) {
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();
      return Left(cartResponseEntity);
    }
        , (error) {
          return Right(error.toString());
        });
  }

  @override
  Future<Either<CartResponseEntity, String>> UpDateCart({required String productId, required int count})async {
    var result = await apiDataSource.UpDateCart(productId: productId, count: count);
    return result.fold((response) {
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();
      return Left(cartResponseEntity);
    }
        , (error) {
          return Right(error.toString());
        });
  }
}