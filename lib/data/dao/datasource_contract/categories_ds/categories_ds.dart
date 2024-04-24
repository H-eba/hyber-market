import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/model/category/CategoriesResponse.dart';

abstract class CategoriesDataSource{
  Future<Either<CategoriesResponse,String>>getCategories();
}