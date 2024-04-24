import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repository_contract/category_repo/category_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/CategoryEntity.dart';
@injectable
class GetCategoriesUseCase{
  CategoriesRepo categoriesRepo;
  @factoryMethod
  GetCategoriesUseCase(this.categoriesRepo);
  Future<Either<List<CategoryEntity>,String>>call(){
     return categoriesRepo.getCategories();
  }
}