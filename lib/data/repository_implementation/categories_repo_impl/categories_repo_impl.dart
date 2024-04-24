import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/dao/datasource_contract/categories_ds/categories_ds.dart';
import 'package:ecommerce/data/model/category/CategoriesResponse.dart';
import 'package:ecommerce/domain/entites/CategoryEntity.dart';
import 'package:ecommerce/domain/repository_contract/category_repo/category_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:CategoriesRepo )
class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesDataSource apiDataSource;
  //get data from ds
  CategoriesRepoImpl(this.apiDataSource);
  @factoryMethod
  @override
  Future<Either<List<CategoryEntity>, String>> getCategories() async {
    var result = await apiDataSource.getCategories();
    return result.fold((CategoriesResponse) {
      List<CategoryModel> categories = CategoriesResponse.data ?? [];
      List<CategoryEntity> categoriesEntites = categories
          .map((categoryModel) => categoryModel.toCategoryEntity())
          .toList();
      return left(categoriesEntites);
    }, (error) {
      return Right(error);
    });

  }
}
