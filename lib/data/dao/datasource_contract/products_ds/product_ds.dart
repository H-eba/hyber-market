import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/model/products/ProductsResponse.dart';

abstract class ProductsDataSource{
 Future<Either<ProductsResponse,String>>getProducts({String? sort});
}
enum productsSorting{
 MostSelling ('-sold'),
 LeastSelling('sold'),
 MostExpensive('-price'),
 LeastExpensive('price');

  final String sort;
  const productsSorting(this.sort);
 
}