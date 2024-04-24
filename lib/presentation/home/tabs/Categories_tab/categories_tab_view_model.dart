import 'dart:ffi';

import 'package:ecommerce/domain/entites/CategoryEntity.dart';
import 'package:ecommerce/domain/entites/ProductEntity.dart';
import 'package:ecommerce/domain/use_cases/get_category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/get_sub_categories_use_case/get_sub_categories_use_case.dart';
@injectable
class CategoriesTabViewModel extends Cubit<CategoriesTabStates>{
  @factoryMethod
  static CategoriesTabViewModel get(context)=>BlocProvider.of(context);
  CategoriesTabViewModel(this.getCategoriesUseCase,this.subCategoriesOfSpecificCategoryUseCase):super(CategoriesTabInitialStates());
GetCategoriesUseCase getCategoriesUseCase;
  getSubCategoriesOfSpecificCategoryUseCase subCategoriesOfSpecificCategoryUseCase;
getCategories()async{
  emit(  GetCategoriesLoadingStates());

  var results=await getCategoriesUseCase.call();
  results.fold((categories){
 emit(GetCategoriesSuccessStates(categories));
  }, (error)  {
 emit(GetCategoriesErrorStates(error));
  });
}
  getSubCategories(String categoryID)async{
    emit(  SubCategoriesLoadingStates());

    var results=await subCategoriesOfSpecificCategoryUseCase.call(categoryID);
    results.fold((subCategories){
      emit(SubCategoriesSuccessStates(subCategories));
    }, (error)  {
      emit(SubCategoriesErrorStates(error));
    });
  }
}


abstract class CategoriesTabStates{}
class CategoriesTabInitialStates extends  CategoriesTabStates{}
class GetCategoriesLoadingStates extends  CategoriesTabStates{}
class GetCategoriesSuccessStates extends  CategoriesTabStates{
  List<CategoryEntity>categories;
  GetCategoriesSuccessStates(this.categories);
}
class GetCategoriesErrorStates extends  CategoriesTabStates{
  String error;
  GetCategoriesErrorStates(this.error);
}
///sub categories
class SubCategoriesLoadingStates extends  CategoriesTabStates{}
class SubCategoriesSuccessStates extends  CategoriesTabStates{
  List<SubcategoryEntity>subCategories;
  SubCategoriesSuccessStates(this.subCategories);
}
class SubCategoriesErrorStates extends  CategoriesTabStates{
  String error;
 SubCategoriesErrorStates(this.error);
}