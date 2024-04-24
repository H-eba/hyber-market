

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api_manager/api_manager.dart';
import 'package:ecommerce/core/api/end_point/endpoint.dart';
import 'package:ecommerce/data/dao/datasource_contract/brands_ds/brands_ds.dart';
import 'package:ecommerce/data/model/brands/BrandsResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandsDataSource)
class BrandsDataSourceImpl implements BrandsDataSource{
  ApiManager apiManager;
  @factoryMethod
  BrandsDataSourceImpl(this.apiManager);
  @override
  Future<Either<BrandsResponse, String>> getBrand() async{
    try{
     var response=await apiManager.getRequest(endPoint: EndPoint.brandsEndPoint);
     return left(BrandsResponse.fromJson(response.data));
    }catch(error){
return right(error.toString());
    }

  }

}