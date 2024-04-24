import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/dao/datasource_contract/brands_ds/brands_ds.dart';
import 'package:ecommerce/domain/entites/BrandEntity.dart';
import 'package:ecommerce/domain/repository_contract/brands_repo/brands_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepo)
class BrandsRepoImpl implements BrandsRepo {
  @factoryMethod
  BrandsDataSource apiDataSource;
  BrandsRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<BrandEntity>, String>> getBrands() async {
    var result = await apiDataSource.getBrand();
    return result.fold((brandsResponse) {
      var brandsModelList = brandsResponse.data ?? [];
      var brandsEntityList = brandsModelList
          .map((brandModel) => brandModel.toBrandEntiry())
          .toList();
      return left(brandsEntityList);
    }, (error) {
      return Right(error);
    });
  }
}
