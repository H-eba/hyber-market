import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';

abstract class SubCategoriesRepo{
 Future <Either<List<SubcategoryEntity>,String>> getSubCategories(String categoryId);
}