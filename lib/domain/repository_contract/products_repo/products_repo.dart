import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';

abstract class ProductsRepo{
  Future<Either<List<ProductEntity>,String>>getProducts({String? sort});
}