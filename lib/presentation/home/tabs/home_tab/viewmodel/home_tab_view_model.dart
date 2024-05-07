import 'package:ecommerce/domain/entites/BrandEntity.dart';
import 'package:ecommerce/domain/entites/cart/CartResponseEntity.dart';
import 'package:ecommerce/domain/use_cases/add_to_cart_use_case/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/use_cases/get_brands_use_case/get_brands_use_case.dart';
import 'package:ecommerce/domain/use_cases/get_category_use_case.dart';
import 'package:ecommerce/domain/use_cases/get_most_selling_products_use_case/get_most_selling_products_use_case.dart';
import 'package:ecommerce/presentation/home/tabs/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entites/CategoryEntity.dart';
import '../../../../../domain/entites/ProductEntity.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  @factoryMethod
  HomeTabViewModel(this.addToCartUseCase,this.categoriesUseCase,this.brandsUseCase,this.MostSellingProductsUseCase) : super(HomeTabInitialState());
  static HomeTabViewModel get(context) => BlocProvider.of(context);
  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  AddToCartUseCase addToCartUseCase;
  GetMostSellingProductsUseCase MostSellingProductsUseCase;
 addToCart(String productId)async{
   if (!isClosed){
     emit(AddToCartLoadingState(productId));
   }

   var result=await addToCartUseCase.call(productId: productId);
   result.fold((response) {
     if(!isClosed){
       emit(AddToCartSuccessState(response,productId));
     }


   }, (error)
   {
     if(!isClosed){
       emit(AddToCartErorrState(error,productId  ));
     }

   }
   );
 }
  getCategory() async {
    if (!isClosed){
      emit(CategoriesLoadingState());
    }

    var results = await categoriesUseCase.call();
    results.fold((categories) {
      if (!isClosed){
        emit(CategoriesSuccessState(categories));
      }

    }, (error) {
      if (!isClosed){
        emit(CategoriesErrorState(error));
      }

    });
  }
  getBrands()async{
   if(!isClosed){
     emit(BrandsInitialState());
   }

    var result=await brandsUseCase.call();
    result.fold((brands) {
      if(!isClosed){
        emit(BrandsSuccessState(brands));
      }

    }
    , (error) {
          if(!isClosed){
            emit(BrandsErrorState(error));
          }

  });
  }
  getMostSellingProducts()async{
   if(!isClosed){
     emit(mostSellingCategoryProductsLoadingState());
   }

    var result=await MostSellingProductsUseCase.call();
    result.fold((products) {
      if(!isClosed){
        emit(mostSellingCategoryProductsSuccessState(products));
      }

    }
        , (error) {
          if(!isClosed){
            emit(mostSellingCategoryProductsErorrState(error));
          }

        });
  }
}

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoriesLoadingState extends HomeTabStates {}

class CategoriesSuccessState extends HomeTabStates {
  List<CategoryEntity> categories;
  CategoriesSuccessState(this.categories);
}

class CategoriesErrorState extends HomeTabStates {
  String error;
  CategoriesErrorState(this.error);
}

class BrandsInitialState extends HomeTabStates {}
class BrandsLoadingState extends HomeTabStates {}
class BrandsSuccessState extends HomeTabStates {
  List<BrandEntity> brands;
  BrandsSuccessState(this.brands);
}
class BrandsErrorState extends HomeTabStates {
  String error;
  BrandsErrorState(this.error);
}
///most selling category products
class mostSellingCategoryProductsLoadingState extends HomeTabStates {}
class mostSellingCategoryProductsSuccessState extends HomeTabStates {
  List<ProductEntity>products;
  mostSellingCategoryProductsSuccessState(this.products);
}
class mostSellingCategoryProductsErorrState extends HomeTabStates {
  String error;
  mostSellingCategoryProductsErorrState(this.error);
}

///add to cart
class AddToCartLoadingState extends HomeTabStates{
  String productId;
  AddToCartLoadingState(this.productId);
}
class AddToCartSuccessState extends HomeTabStates{
  CartResponseEntity cartResponseEntity;
  String productId;
  AddToCartSuccessState(this.cartResponseEntity,this.productId);
}
class AddToCartErorrState extends HomeTabStates{
  String error;
  String productId;
  AddToCartErorrState(this.error,this.productId);
}


