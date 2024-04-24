import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/model/sub_categories/SubCategoriesResponse.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';

abstract class SubCategoriesDataSource{
  Future<Either<SubCategoriesResponse,String>>getSubCategories(String categoryID);
}