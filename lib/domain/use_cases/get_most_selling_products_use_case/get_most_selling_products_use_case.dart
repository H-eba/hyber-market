import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/dao/datasource_contract/products_ds/product_ds.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';
import 'package:ecommerce/domain/repository_contract/products_repo/products_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetMostSellingProductsUseCase{
  ProductsRepo productsRepo;
  @factoryMethod
  GetMostSellingProductsUseCase(this.productsRepo);
  Future<Either<List<ProductEntity>,String>> call()=>productsRepo.getProducts(sort: productsSorting.MostSelling.sort);
}