import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/CategoryEntity.dart';

abstract class CategoriesRepo{
  Future<Either<List<CategoryEntity>,String>>getCategories();
}