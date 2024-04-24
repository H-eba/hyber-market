import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/model/brands/BrandsResponse.dart';

abstract class BrandsDataSource{
  Future<Either<BrandsResponse,String>>getBrand();
}