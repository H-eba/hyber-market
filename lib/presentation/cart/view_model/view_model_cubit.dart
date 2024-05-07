import 'package:ecommerce/domain/use_cases/add_to_cart_use_case/delete_from_cart.dart';
import 'package:ecommerce/domain/use_cases/add_to_cart_use_case/get_cart_use_case.dart';
import 'package:ecommerce/domain/use_cases/add_to_cart_use_case/update_cart_use_case.dart';
import 'package:ecommerce/presentation/cart/view_model/view_model_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartViewModel extends Cubit<CartViewModelState>{
  @factoryMethod
  CartViewModel(this.getCartUseCase,this.deleteFromCartUseCase,this.upDateCartUseCase):super(GetCartViewModelInitial());
  static CartViewModel get(context)=>BlocProvider.of(context);
  GetCartUseCase getCartUseCase;
 DeleteFromCartUseCase deleteFromCartUseCase;
 UpDateCartUseCase upDateCartUseCase;
  GetCart()async{
    emit(GetCartViewModelLoadingState());
    var result= await getCartUseCase.call();
    result.fold((response)  {
emit(GetCartViewModelSuccessState(response));
    }, (error) {
      emit(GetCartViewModelErrorState(error));

  } );

}
DeleteFromCart(String productId)async
{
  emit(DeleteCartViewModelLoadingState(productId));

  var result=await deleteFromCartUseCase.call(productId: productId);
  result.fold((responce) {
emit(DeleteCartViewModelSuccessState(productId,responce));
emit(GetCartViewModelSuccessState(responce));

  }, (error) {
    emit(DeleteCartViewModelErrorState(error,productId));

  });

}

UpDateCart(String productId,int count)async{
    emit(UpDateCartViewModelLoadingState(productId));
var result=await upDateCartUseCase.call(productId: productId, count: count);
result.fold((responce) {
  emit(UpDateCartViewModelSuccessState(responce,productId));
  emit(GetCartViewModelSuccessState(responce));

}, (error) {
 emit(UpDateCartViewModelErrorState(error,productId));

});
}
}