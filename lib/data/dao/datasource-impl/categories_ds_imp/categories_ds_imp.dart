import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api_manager/api_manager.dart';
import 'package:ecommerce/core/api/end_point/endpoint.dart';
import 'package:ecommerce/data/dao/datasource_contract/categories_ds/categories_ds.dart';
import 'package:ecommerce/data/model/category/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CategoriesDataSource )
class CategoriesDataSourceImpl implements CategoriesDataSource {
  @factoryMethod
  ApiManager apiManager;
  CategoriesDataSourceImpl(this.apiManager);

  @override
  Future<Either<CategoriesResponse, String>> getCategories() async {
    try {
      var response =
          await apiManager.getRequest(endPoint: EndPoint.categoriesEndPoint);
      return left(CategoriesResponse.fromJson(response.data));
    } catch (error) {
      return right(error.toString());
    }
  }
}
