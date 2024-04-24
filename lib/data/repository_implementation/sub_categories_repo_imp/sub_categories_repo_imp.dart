import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/dao/datasource_contract/sub_category_ds/sub_categories_ds.dart';
import 'package:ecommerce/data/model/products/ProductsResponse.dart';
import 'package:ecommerce/data/model/sub_categories/SubCategoriesResponse.dart';

import 'package:ecommerce/domain/entites/ProductEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository_contract/sub_categories_repo/sub_categories_repo.dart';

@Injectable(as: SubCategoriesRepo )
class SubCategoriesRepoImpl extends SubCategoriesRepo{
  SubCategoriesDataSource apiDataSource;
@factoryMethod
SubCategoriesRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<SubcategoryEntity>, String>> getSubCategories(String categoryId) async{
    var result=await apiDataSource.getSubCategories(categoryId);
    return result.fold((response) {
      List<SubCategoryModel>subCategoryModel=response.data??[];
      List<SubcategoryEntity>subcategoryEntityList=subCategoryModel.
      map((subCategotyModel) => subCategotyModel.toSubCategoryEntity()).toList();
      return left(subcategoryEntityList);
    }, (error)
    {
      return Right(error.toString());
    });
  }
  }
