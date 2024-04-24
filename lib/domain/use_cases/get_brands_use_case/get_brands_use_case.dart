import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/BrandEntity.dart';
import 'package:ecommerce/domain/repository_contract/brands_repo/brands_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetBrandsUseCase{
  BrandsRepo brandsRepo;
  @factoryMethod
  GetBrandsUseCase(this.brandsRepo);

  Future<Either<List<BrandEntity>,String>>call()=>brandsRepo.getBrands();
}