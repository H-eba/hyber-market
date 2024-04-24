import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api_manager/api_manager.dart';
import 'package:ecommerce/core/api/end_point/endpoint.dart';
import 'package:ecommerce/data/dao/datasource_contract/products_ds/product_ds.dart';
import 'package:ecommerce/data/model/products/ProductsResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:ProductsDataSource )
class ProductsDataSourceImpl implements ProductsDataSource{
  ApiManager apiManager;
  @factoryMethod
  ProductsDataSourceImpl(this.apiManager);
  @override
  Future<Either<ProductsResponse, String>> getProducts({String? sort}) async{
   try{
     var response=await apiManager.getRequest(endPoint: EndPoint.productsEndPoint,
         queryParameters: sort!=null?{'sort':sort}
             :null
     );
     return Left(ProductsResponse.fromJson(response.data));

   }catch(error){
     return Right(error.toString());
   }

  }
  
}