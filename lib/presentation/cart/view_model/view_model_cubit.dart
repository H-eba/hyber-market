import 'package:ecommerce/domain/use_cases/add_to_cart_use_case/delete_from_cart.dart';
import 'package:ecommerce/domain/use_cases/add_to_cart_use_case/get_cart_use_case.dart';
import 'package:ecommerce/domain/use_cases/add_to_cart_use_case/update_cart_use_case.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entites/cart/CartResponseEntity.dart';
import '../../../domain/use_cases/add_to_cart_use_case/add_to_cart_use_case.dart';
import '../../home/tabs/home_tab/viewmodel/home_tab_view_model.dart';

@injectable
class CartViewModel extends Cubit<CartViewModelState> {
  @factoryMethod
  CartViewModel(this.addToCartUseCase, this.getCartUseCase,
      this.deleteFromCartUseCase, this.upDateCartUseCase)
      : super(GetCartViewModelInitial());
  static CartViewModel get(context) => BlocProvider.of(context);
  //int number=0;

  GetCartUseCase getCartUseCase;
  DeleteFromCartUseCase deleteFromCartUseCase;
  UpDateCartUseCase upDateCartUseCase;
  AddToCartUseCase addToCartUseCase;
  addToCart(String productId) async {
    if (!isClosed) {

      emit(AddToCartLoadingState(productId));
    }

    var result = await addToCartUseCase.call(productId: productId);
    result.fold((response) {
      if (!isClosed) {
        emit(AddToCartSuccessState(response, productId));

      }
    }, (error) {
      if (!isClosed) {
        emit(AddToCartErorrState(error, productId));
      }
    });
  }
  int num=0;

  GetCart() async {

    emit(GetCartViewModelLoadingState());
    var result = await getCartUseCase.call();
    result.fold((response) {
      emit(GetCartViewModelSuccessState(response));
  num=response.numOfCartItems!.toInt();
    }, (error) {
      emit(GetCartViewModelErrorState(error));
    });
  }

  DeleteFromCart(String productId) async {
    emit(DeleteCartViewModelLoadingState(productId));

    var result = await deleteFromCartUseCase.call(productId: productId);
    result.fold((responce) {
      emit(DeleteCartViewModelSuccessState(productId, responce));
      emit(GetCartViewModelSuccessState(responce));
    }, (error) {
      emit(DeleteCartViewModelErrorState(error, productId));
    });
  }

  UpDateCart(String productId, int count) async {
    emit(UpDateCartViewModelLoadingState(productId));
    var result =
        await upDateCartUseCase.call(productId: productId, count: count);
    result.fold((responce) {
      emit(UpDateCartViewModelSuccessState(responce, productId));
      emit(GetCartViewModelSuccessState(responce));
    }, (error) {
      emit(UpDateCartViewModelErrorState(error, productId));
    });
  }
}
