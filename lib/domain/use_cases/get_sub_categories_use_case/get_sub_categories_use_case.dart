import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';
import 'package:ecommerce/domain/repository_contract/sub_categories_repo/sub_categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class getSubCategoriesOfSpecificCategoryUseCase {
  SubCategoriesRepo repo;
  @factoryMethod
  getSubCategoriesOfSpecificCategoryUseCase(this.repo);
  Future<Either<List<SubcategoryEntity>, String>> call(String categoryId) =>
      repo.getSubCategories(categoryId);
}
