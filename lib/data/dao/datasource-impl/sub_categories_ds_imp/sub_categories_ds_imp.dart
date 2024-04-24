import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api_manager/api_manager.dart';
import 'package:ecommerce/core/api/end_point/endpoint.dart';
import 'package:ecommerce/data/dao/datasource_contract/sub_category_ds/sub_categories_ds.dart';
import 'package:ecommerce/data/model/sub_categories/SubCategoriesResponse.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:SubCategoriesDataSource )
class SubCategoriesDataSourceImp extends SubCategoriesDataSource{
  ApiManager apiManager;
  @factoryMethod
  SubCategoriesDataSourceImp(this.apiManager);
  @override
  Future<Either<SubCategoriesResponse, String>> getSubCategories(String categoryID) async{
    try {
      var response =
      await apiManager.getRequest(endPoint: EndPoint.subCategoriesOfCategoriesEndPoint(categoryID));
      return left(SubCategoriesResponse.fromJson(response.data));
    } catch (error) {
      return right(error.toString());
    }

  }
}