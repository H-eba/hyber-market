import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/dao/datasource_contract/products_ds/product_ds.dart';
import 'package:ecommerce/data/model/products/ProductsResponse.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';
import 'package:ecommerce/domain/repository_contract/products_repo/products_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:ProductsRepo )
class ProductsRepoImpl implements ProductsRepo{
  ProductsDataSource apiDataSource;
  @factoryMethod
  ProductsRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<ProductEntity>, String>> getProducts({String? sort}) async{

   var results=await apiDataSource.getProducts(sort: sort);
  return results.fold((response) {
 List<ProductModel>productModelList=response.data??[];
 List<ProductEntity>productEintitylList=productModelList.map((productModel) => productModel.toProductEntity()).toList();
return Left(productEintitylList);
   }, (error)
   {
  return Right(error.toString());
   });
  }
  
}