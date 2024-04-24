import 'package:dartz/dartz.dart';

import '../../entites/BrandEntity.dart';

abstract class BrandsRepo{
  Future<Either<List<BrandEntity>,String>>getBrands();
}